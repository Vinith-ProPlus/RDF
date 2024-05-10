<?php

namespace App\Http\Controllers\web\masters\product;

use App\enums\activeMenuNames;
use App\enums\cruds;
use App\enums\docTypes;
use App\helper\helper;
use App\Http\Controllers\Controller;
use App\Http\Controllers\web\logController;
use App\Models\DocNum;
use App\Models\general;
use App\Models\ServerSideProcess;
use App\Rules\ValidUnique;
use Exception;
use helper\dynamicField;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Validator;

class ProductCategoryTypeController extends Controller
{
    private $general;
    private $UserID;
    private $ReferID;
    private $ActiveMenuName;
    private $PageTitle;
    private $CRUD;
    private $Settings;
    private $FileTypes;
    private $Menus;

    public function __construct()
    {
        $this->ActiveMenuName = activeMenuNames::ProductCategoryType->value;
        $this->PageTitle = "Product Category Type";
        $this->middleware('auth');
        $this->FileTypes = Helper::getFileTypes(array("category" => array("Images")));
        $this->middleware(function ($request, $next) {
            $this->UserID = auth()->user()->UserID;
            $this->ReferID = auth()->user()->ReferID;
            $this->general = new general($this->UserID, $this->ActiveMenuName);
            $this->Menus = $this->general->loadMenu();
            $this->CRUD = $this->general->getCrudOperations($this->ActiveMenuName);
            $this->Settings = $this->general->getSettings();
            return $next($request);
        });
    }

    public function view(Request $req)
    {
        // return $this->ReferID;
        if ($this->general->isCrudAllow($this->CRUD, "view")) {
            $FormData = $this->general->UserInfo;
            $FormData['menus'] = $this->Menus;
            $FormData['crud'] = $this->CRUD;
            $FormData['ActiveMenuName'] = $this->ActiveMenuName;
            $FormData['PageTitle'] = $this->PageTitle;
            return view('app.master.product.category-type.view', $FormData);
        } elseif ($this->general->isCrudAllow($this->CRUD, "add")) {
            return Redirect::to('/admin/master/product/category-type/create');
        } else {
            return view('errors.403');
        }
    }

    public function TrashView(Request $req)
    {
        if ($this->general->isCrudAllow($this->CRUD, "restore")) {
            $FormData = $this->general->UserInfo;
            $FormData['menus'] = $this->Menus;
            $FormData['crud'] = $this->CRUD;
            $FormData['ActiveMenuName'] = $this->ActiveMenuName;
            $FormData['PageTitle'] = $this->PageTitle;
            return view('app.master.product.category-type.trash', $FormData);
        } elseif ($this->general->isCrudAllow($this->CRUD, "view")) {
            return Redirect::to('/admin/master/product/category-type/');
        } else {
            return view('errors.403');
        }
    }

    public function create(Request $req)
    {
        if ($this->general->isCrudAllow($this->CRUD, "add")) {
            $FormData = $this->general->UserInfo;
            $FormData['menus'] = $this->Menus;
            $FormData['crud'] = $this->CRUD;
            $FormData['ActiveMenuName'] = $this->ActiveMenuName;
            $FormData['PageTitle'] = $this->PageTitle;
            $FormData['isEdit'] = false;
            $FormData['FileTypes'] = $this->FileTypes;
            return view('app.master.product.category-type.create', $FormData);
        } elseif ($this->general->isCrudAllow($this->CRUD, "view")) {
            return Redirect::to('/admin/master/product/category-type/');
        } else {
            return view('errors.403');
        }
    }

    public function edit(Request $req, $PCTID)
    {
        if ($this->general->isCrudAllow($this->CRUD, "edit")) {
            $FormData = $this->general->UserInfo;
            $FormData['menus'] = $this->Menus;
            $FormData['crud'] = $this->CRUD;
            $FormData['ActiveMenuName'] = $this->ActiveMenuName;
            $FormData['PageTitle'] = $this->PageTitle;
            $FormData['isEdit'] = true;
            $FormData['FileTypes'] = $this->FileTypes;
            $FormData['EditData'] = DB::Table('tbl_product_category_type')->where('DFlag', 0)->Where('PCTID', $PCTID)->get();
            if (count($FormData['EditData']) > 0) {
                return view('app.master.product.category-type.create', $FormData);
            } else {
                return view('errors.403');
            }
        } elseif ($this->general->isCrudAllow($this->CRUD, "view")) {
            return Redirect::to('/admin/master/product/category-type');
        } else {
            return view('errors.403');
        }
    }

    public function save(Request $req)
    {
        if ($this->general->isCrudAllow($this->CRUD, "add")) {
            $OldData = [];
            $PCTID = "";
            $rules = array(
                'PCTName' => ['required', 'max:50', new ValidUnique(array("TABLE" => "tbl_product_category_type", "WHERE" => " PCTName='" . $req->PCTName . "'  "), "This Product Category Type Name is already taken.")],
            );
            $message = array(
                'PCTName.required' => "Product Category Type Name is required",
                'PCTName.min' => "Product Category Type Name must be greater than 2 characters",
                'PCTName.max' => "Product Category Type Name may not be greater than 100 characters",
                'PCTImage.mimes' => "The Product Category Type image field must be a file of type: " . implode(", ", $this->FileTypes['category']['Images']) . "."
            );
            if ($req->hasFile('PCTImage')) {
                $rules['PCTImage'] = 'mimes:' . implode(",", $this->FileTypes['category']['Images']);
            }
            $validator = Validator::make($req->all(), $rules, $message);

            if ($validator->fails()) {
                return array('status' => false, 'message' => "Product Category Type Create Failed", 'errors' => $validator->errors());
            }
            DB::beginTransaction();
            $images = array();
            try {
                $PCTImage = "";
                $PCTID = DocNum::getDocNum(docTypes::ProductCategoryType->value, "", Helper::getCurrentFY());
                $dir = "uploads/master/product/category-type/" . $PCTID . "/";
                if (!file_exists($dir)) {
                    mkdir($dir, 0777, true);
                }
                if ($req->hasFile('PCTImage')) {
                    $file = $req->file('PCTImage');
                    $fileName = md5($file->getClientOriginalName() . time());
                    $fileName1 = $fileName . "." . $file->getClientOriginalExtension();
                    $file->move($dir, $fileName1);
                    $PCTImage = $dir . $fileName1;
                } else if (Helper::isJSON($req->PCTImage)) {
                    $Img = json_decode($req->PCTImage);
                    if (file_exists($Img->uploadPath)) {
                        $fileName1 = $Img->fileName != "" ? $Img->fileName : Helper::RandomString(10) . "png";
                        copy($Img->uploadPath, $dir . $fileName1);
                        $PCTImage = $dir . $fileName1;
                        unlink($Img->uploadPath);
                    }
                }
                if (file_exists($PCTImage)) {
                    $images = helper::ImageResize($PCTImage, $dir);
                }
                $data = array(
                    "PCTID" => $PCTID,
                    "PCTName" => $req->PCTName,
                    'PCTImage' => $PCTImage,
                    "Images" => serialize($images),
                    "ActiveStatus" => $req->ActiveStatus,
                    "CreatedBy" => $this->UserID,
                    "CreatedOn" => date("Y-m-d H:i:s")
                );
                DB::Table('tbl_product_category_type')->insert($data);
                DocNum::updateDocNum(docTypes::ProductCategoryType->value);
                DB::commit();
                $NewData = DB::table('tbl_product_category_type')->where('PCTID', $PCTID)->get();
                $logData = array("Description" => "New Product Category Type Created ", "ModuleName" => $this->ActiveMenuName, "Action" => cruds::ADD->value, "ReferID" => $PCTID, "OldData" => $OldData, "NewData" => $NewData, "UserID" => $this->UserID, "IP" => $req->ip());
                logController::Store($logData);
                return array('status' => true, 'message' => "Product Category Type Created Successfully");
            } catch (Exception $e) {
                logger($e);
                DB::rollback();
                foreach ($images as $KeyName => $Img) {
                    Helper::removeFile($Img['url']);
                }
                return array('status' => false, 'message' => "Product Category Type Create Failed");
            }
        } else {
            return array('status' => false, 'message' => 'Access denined');
        }
    }

    public function update(Request $req, $PCTID)
    {
        if ($this->general->isCrudAllow($this->CRUD, "edit")) {
            $OldData = array();
            $rules = array(
                'PCTName' => ['required', 'max:50', new ValidUnique(array("TABLE" => "tbl_product_category_type", "WHERE" => " PCTName='" . $req->PCTName . "' and PCTID<>'" . $PCTID . "'  "), "This Product Category Type Name is already taken.")]
            );
            $message = array(
                'PCTName.required' => "Product Category Type Name is required",
                'PCTName.min' => "Product Category Type Name must be greater than 2 characters",
                'PCTName.max' => "Product Category Type Name may not be greater than 100 characters",
                'PCTImage.mimes' => "The Product Category Type image field must be a file of type: " . implode(", ", $this->FileTypes['category']['Images']) . "."
            );
            if ($req->hasFile('PCTImage')) {
                $rules['PCTImage'] = 'mimes:' . implode(",", $this->FileTypes['category']['Images']);
            }
            $validator = Validator::make($req->all(), $rules, $message);

            if ($validator->fails()) {
                return array('status' => false, 'message' => "Product Category Type Update Failed", 'errors' => $validator->errors());
            }
            DB::beginTransaction();
            $currCImage = array();
            $images = array();
            try {
                $OldData = DB::table('tbl_product_category_type')->where('PCTID', $PCTID)->get();
                $PCTImage = "";
                $dir = "uploads/master/product/category-type/" . $PCTID . "/";
                if (!file_exists($dir)) {
                    mkdir($dir, 0777, true);
                }
                if ($req->hasFile('PCTImage')) {
                    $file = $req->file('PCTImage');
                    $fileName = md5($file->getClientOriginalName() . time());
                    $fileName1 = $fileName . "." . $file->getClientOriginalExtension();
                    $file->move($dir, $fileName1);
                    $PCTImage = $dir . $fileName1;
                } else if (Helper::isJSON($req->PCTImage)) {
                    $Img = json_decode($req->PCTImage);
                    if (file_exists($Img->uploadPath)) {
                        $fileName1 = $Img->fileName != "" ? $Img->fileName : Helper::RandomString(10) . "png";
                        copy($Img->uploadPath, $dir . $fileName1);
                        $PCTImage = $dir . $fileName1;
                        unlink($Img->uploadPath);
                    }
                }
                if (file_exists($PCTImage)) {
                    $images = helper::ImageResize($PCTImage, $dir);
                }
                if (($PCTImage != "" || intval($req->removePCTImage) == 1) && Count($OldData) > 0) {
                    $currCImage = $OldData[0]->Images != "" ? unserialize($OldData[0]->Images) : array();
                }
                $data = array(
                    "PCTName" => $req->PCTName,
                    "ActiveStatus" => $req->ActiveStatus,
                    "UpdatedBy" => $this->UserID,
                    "UpdatedOn" => date("Y-m-d H:i:s")
                );
                if ($PCTImage != "") {
                    $data['PCTImage'] = $PCTImage;
                    $data['Images'] = serialize($images);
                } else if (intval($req->removePCTImage) == 1) {
                    $data['PCTImage'] = "";
                    $data['Images'] = serialize(array());
                }
                $status = DB::Table('tbl_product_category_type')->where('PCTID', $PCTID)->update($data);
                if ($status) {
                    DB::commit();
                }
            } catch (Exception $e) {
                $status = false;
            }

            if ($status) {
                DB::commit();
                $NewData = DB::table('tbl_product_category_type')->where('PCTID', $PCTID)->get();
                $logData = array("Description" => "Product Category Type Updated ", "ModuleName" => $this->ActiveMenuName, "Action" => cruds::UPDATE->value, "ReferID" => $PCTID, "OldData" => $OldData, "NewData" => $NewData, "UserID" => $this->UserID, "IP" => $req->ip());
                logController::Store($logData);

                foreach ($currCImage as $KeyName => $Img) {
                    Helper::removeFile($Img['url']);
                }
                return array('status' => true, 'message' => "Product Category Type Updated Successfully");
            } else {
                DB::rollback();
                foreach ($images as $KeyName => $Img) {
                    Helper::removeFile($Img['url']);
                }
                return array('status' => false, 'message' => "Product Category Type Update Failed");
            }
        } else {
            return array('status' => false, 'message' => 'Access denined');
        }
    }

    public function Delete(Request $req, $PCTID)
    {
        $OldData = $NewData = array();
        if ($this->general->isCrudAllow($this->CRUD, "delete")) {
            DB::beginTransaction();
            $status = false;
            try {
                $OldData = DB::table('tbl_product_category_type')->where('PCTID', $PCTID)->get();
                $status = DB::table('tbl_product_category_type')->where('PCTID', $PCTID)->update(array("DFlag" => 1, "DeletedBy" => $this->UserID, "DeletedOn" => date("Y-m-d H:i:s")));
            } catch (Exception $e) {

            }
            if ($status) {
                DB::commit();
                $logData = array("Description" => "Product Category Type has been Deleted ", "ModuleName" => $this->ActiveMenuName, "Action" => cruds::DELETE->value, "ReferID" => $PCTID, "OldData" => $OldData, "NewData" => $NewData, "UserID" => $this->UserID, "IP" => $req->ip());
                logController::Store($logData);
                return array('status' => true, 'message' => "Product Category Type Deleted Successfully");
            } else {
                DB::rollback();
                return array('status' => false, 'message' => "Product Category Type Delete Failed");
            }
        } else {
            return response(array('status' => false, 'message' => "Access Denied"), 403);
        }
    }

    public function Restore(Request $req, $PCTID)
    {
        $OldData = $NewData = array();
        if ($this->general->isCrudAllow($this->CRUD, "restore")) {
            DB::beginTransaction();
            $status = false;
            try {
                $OldData = DB::table('tbl_product_category_type')->where('PCTID', $PCTID)->get();
                $status = DB::table('tbl_product_category_type')->where('PCTID', $PCTID)->update(array("DFlag" => 0, "UpdatedBy" => $this->UserID, "UpdatedOn" => date("Y-m-d H:i:s")));
            } catch (Exception $e) {

            }
            if ($status) {
                DB::commit();
                $NewData = DB::table('tbl_product_category_type')->where('PCTID', $PCTID)->get();
                $logData = array("Description" => "Product Category Type has been Restored ", "ModuleName" => $this->ActiveMenuName, "Action" => cruds::RESTORE->value, "ReferID" => $PCTID, "OldData" => $OldData, "NewData" => $NewData, "UserID" => $this->UserID, "IP" => $req->ip());
                logController::Store($logData);
                return array('status' => true, 'message' => "Product Category Type Restored Successfully");
            } else {
                DB::rollback();
                return array('status' => false, 'message' => "Product Category Type Restore Failed");
            }
        } else {
            return response(array('status' => false, 'message' => "Access Denied"), 403);
        }
    }

    public function TableView(Request $request)
    {
        if ($this->general->isCrudAllow($this->CRUD, "view")) {
            $columns = array(
                array('db' => 'PCTID', 'dt' => '0'),
                array('db' => 'PCTName', 'dt' => '1'),
                array('db' => 'ActiveStatus', 'dt' => '2',
                    'formatter' => function ($d, $row) {
                        if ($d == "Active") {
                            return "<span class='badge badge-success m-1'>Active</span>";
                        } else {
                            return "<span class='badge badge-danger m-1'>Inactive</span>";
                        }
                    }
                ),
                array('db' => 'PCTID', 'dt' => '3',
                    'formatter' => function ($d, $row) {
                        $html = '';
                        if ($this->general->isCrudAllow($this->CRUD, "edit")) {
                            $html .= '<button type="button" data-id="' . $d . '" class="btn  btn-outline-success ' . $this->general->UserInfo['Theme']['button-size'] . ' mr-10 btnEdit" data-original-title="Edit"><i class="fa fa-pencil"></i></button>';
                        }
                        if ($this->general->isCrudAllow($this->CRUD, "delete")) {
                            $html .= '<button type="button" data-id="' . $d . '" class="btn  btn-outline-danger ' . $this->general->UserInfo['Theme']['button-size'] . ' btnDelete" data-original-title="Delete"><i class="fa fa-trash" aria-hidden="true"></i></button>';
                        }
                        return $html;
                    }
                )
            );
            $data = array();
            $data['POSTDATA'] = $request;
            $data['TABLE'] = 'tbl_product_category_type';
            $data['PRIMARYKEY'] = 'PCTID';
            $data['COLUMNS'] = $columns;
            $data['COLUMNS1'] = $columns;
            $data['GROUPBY'] = null;
            $data['WHERERESULT'] = null;
            $data['WHEREALL'] = " DFlag=0 ";
            return ServerSideProcess::SSP($data);
        } else {
            return response(array('status' => false, 'message' => "Access Denied"), 403);
        }
    }

    public function TrashTableView(Request $request)
    {
        if ($this->general->isCrudAllow($this->CRUD, "restore")) {
            $columns = array(
                array('db' => 'PCTID', 'dt' => '0'),
                array('db' => 'PCTName', 'dt' => '1'),
                array('db' => 'ActiveStatus', 'dt' => '2',
                    'formatter' => function ($d, $row) {
                        if ($d == "Active") {
                            return "<span class='badge badge-success m-1'>Active</span>";
                        } else {
                            return "<span class='badge badge-danger m-1'>Inactive</span>";
                        }
                    }
                ),
                array(
                    'db' => 'PCTID',
                    'dt' => '3',
                    'formatter' => function ($d, $row) {
                        $html = '<button type="button" data-id="' . $d . '" class="btn btn-outline-success ' . $this->general->UserInfo['Theme']['button-size'] . '  m-2 btnRestore"> <i class="fa fa-repeat" aria-hidden="true"></i> </button>';
                        return $html;
                    }
                )
            );
            $data = array();
            $data['POSTDATA'] = $request;
            $data['TABLE'] = 'tbl_product_category_type';
            $data['PRIMARYKEY'] = 'PCTID';
            $data['COLUMNS'] = $columns;
            $data['COLUMNS1'] = $columns;
            $data['GROUPBY'] = null;
            $data['WHERERESULT'] = null;
            $data['WHEREALL'] = " DFlag=1 ";
            return ServerSideProcess::SSP($data);
        } else {
            return response(array('status' => false, 'message' => "Access Denied"), 403);
        }
    }

    // Create Form

    private function getUserID()
    {
        if (Auth::Check()) {
            return auth()->user()->UserID;
        }
        return "";
    }

    private function getThemesOption()
    {
        $UserID = $this->getUserID();
        $return = array("button-size" => "btn-sm", "table-size" => "table-sm", "input-size" => "", "switch-size" => "");
        $result = DB::Table('tbl_user_theme')->where('UserID', $UserID)->get();
        if (count($result) > 0) {
            for ($i = 0; $i < count($result); $i++) {
                $return[$result[$i]->Theme_option] = $result[$i]->Theme_Value;
            }
        }
        return $return;
    }

    public function GetNewProductCategoryType(Request $req)
    {
        $Theme = $this->getThemesOption();
        return view("app.modals.productCategoryType", array("Theme" => $Theme, "FileTypes" => $this->FileTypes));
    }

    public static function GetProductCategoryType(request $req)
    {
        return DB::Table('tbl_product_category_type')->where('ActiveStatus', 'Active')->where('DFlag', 0)->get();
    }

}

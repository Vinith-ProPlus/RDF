<?php

namespace App\Http\Controllers\web\masters\product;

use App\enums\docTypes;
use App\helper\helper;
use App\Http\Controllers\Controller;
use App\Models\DocNum;
use App\Rules\ValidDB;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Redirect;
use App\Models\general;
use SSP;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\Rules\ValidUnique;
use logs;
use App\enums\activeMenuNames;
use App\enums\cruds;
use helper\dynamicField;

class ProductCategoryController extends Controller
{
    private $general;
    private $DocNum;
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
        $this->ActiveMenuName = activeMenuNames::ProductCategory->value;
        $this->PageTitle = "Product Category";
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
            return view('app.master.product.category.view', $FormData);
        } elseif ($this->general->isCrudAllow($this->CRUD, "add")) {
            return Redirect::to('/admin/master/product/category/create');
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
            return view('app.master.product.category.trash', $FormData);
        } elseif ($this->general->isCrudAllow($this->CRUD, "view")) {
            return Redirect::to('/admin/master/product/category/');
        } else {
            return view('errors.403');
        }
    }

    public function create(Request $req)
    {
        if ($this->general->isCrudAllow($this->CRUD, "add")) {
            $OtherCruds = array(
                "PCategoryType" => $this->general->getCrudOperations(activeMenuNames::ProductCategoryType->value),
            );
            $FormData = $this->general->UserInfo;
            $FormData['menus'] = $this->Menus;
            $FormData['crud'] = $this->CRUD;
            $FormData['ActiveMenuName'] = $this->ActiveMenuName;
            $FormData['PageTitle'] = $this->PageTitle;
            $FormData['isEdit'] = false;
            $FormData['FileTypes'] = $this->FileTypes;
            $FormData['OtherCruds'] = $OtherCruds;
            return view('app.master.product.category.create', $FormData);
        } elseif ($this->general->isCrudAllow($this->CRUD, "view")) {
            return Redirect::to('/admin/master/product/category/');
        } else {
            return view('errors.403');
        }
    }

    public function edit(Request $req, $PCID)
    {
        if ($this->general->isCrudAllow($this->CRUD, "edit")) {
            $OtherCruds = array(
                "PCategoryType" => $this->general->getCrudOperations(activeMenuNames::ProductCategoryType->value),
            );
            $FormData = $this->general->UserInfo;
            $FormData['menus'] = $this->Menus;
            $FormData['crud'] = $this->CRUD;
            $FormData['ActiveMenuName'] = $this->ActiveMenuName;
            $FormData['PageTitle'] = $this->PageTitle;
            $FormData['isEdit'] = true;
            $FormData['FileTypes'] = $this->FileTypes;
            $FormData['OtherCruds'] = $OtherCruds;
            $FormData['EditData'] = DB::Table('tbl_product_category')->where('DFlag', 0)->Where('PCID', $PCID)->get();
            if (count($FormData['EditData']) > 0) {
                return view('app.master.product.category.create', $FormData);
            } else {
                return view('errors.403');
            }
        } elseif ($this->general->isCrudAllow($this->CRUD, "view")) {
            return Redirect::to('/admin/master/product/category');
        } else {
            return view('errors.403');
        }
    }

    public function save(Request $req)
    {
        if ($this->general->isCrudAllow($this->CRUD, "add")) {
            $OldData = [];
            $PCID = "";
            $ValidDB = [];
            //Category Type validation
            $ValidDB['CategoryType']['TABLE'] = "tbl_product_category_type";
            $ValidDB['CategoryType']['ErrMsg'] = "Product Category Type name does not exist";
            $ValidDB['CategoryType']['WHERE'][] = array("COLUMN" => "PCTID", "CONDITION" => "=", "VALUE" => $req->PCTID);
            $ValidDB['CategoryType']['WHERE'][] = array("COLUMN" => "DFlag", "CONDITION" => "=", "VALUE" => 0);
            $ValidDB['CategoryType']['WHERE'][] = array("COLUMN" => "ActiveStatus", "CONDITION" => "=", "VALUE" => 'Active');
            $rules = array(
                'PCName' => ['required', 'max:50', new ValidUnique(array("TABLE" => "tbl_product_category", "WHERE" => " PCName='" . $req->PCName . "'  "), "This Product Category Name is already taken.")],
                'PCTID' => ['required', new ValidDB($ValidDB['CategoryType'])]
            );
            $message = array(
                'PCName.required' => "Product Category Name is required",
                'PCName.min' => "Product Category Name must be greater than 2 characters",
                'PCName.max' => "Product Category Name may not be greater than 100 characters",
                'PCImage.mimes' => "The Product Category image field must be a file of type: " . implode(", ", $this->FileTypes['category']['Images']) . "."
            );
            if ($req->hasFile('PCImage')) {
                $rules['PCImage'] = 'mimes:' . implode(",", $this->FileTypes['category']['Images']);
            }
            $validator = Validator::make($req->all(), $rules, $message);

            if ($validator->fails()) {
                return array('status' => false, 'message' => "Product Category Create Failed", 'errors' => $validator->errors());
            }
            DB::beginTransaction();
            $images = array();
            try {
                $PCImage = "";
                $PCID = DocNum::getDocNum(docTypes::ProductCategory->value, "", Helper::getCurrentFY());
                $dir = "uploads/master/product/category/" . $PCID . "/";
                if (!file_exists($dir)) {
                    mkdir($dir, 0777, true);
                }
                if ($req->hasFile('PCImage')) {
                    $file = $req->file('PCImage');
                    $fileName = md5($file->getClientOriginalName() . time());
                    $fileName1 = $fileName . "." . $file->getClientOriginalExtension();
                    $file->move($dir, $fileName1);
                    $PCImage = $dir . $fileName1;
                } else if (Helper::isJSON($req->PCImage)) {
                    $Img = json_decode($req->PCImage);
                    if (file_exists($Img->uploadPath)) {
                        $fileName1 = $Img->fileName != "" ? $Img->fileName : Helper::RandomString(10) . "png";
                        copy($Img->uploadPath, $dir . $fileName1);
                        $PCImage = $dir . $fileName1;
                        unlink($Img->uploadPath);
                    }
                }
                if (file_exists($PCImage)) {
                    $images = helper::ImageResize($PCImage, $dir);
                }
                $data = array(
                    "PCID" => $PCID,
                    "PCTID" => $req->PCTID,
                    "PCName" => $req->PCName,
                    'PCImage' => $PCImage,
                    "Images" => serialize($images),
                    "ActiveStatus" => $req->ActiveStatus,
                    "CreatedBy" => $this->UserID,
                    "CreatedOn" => date("Y-m-d H:i:s")
                );
                $status = DB::Table('tbl_product_category')->insert($data);
                if ($status) {
                    DB::commit();
                }
            } catch (Exception $e) {
                $status = false;
            }

            if ($status == true) {
                DocNum::updateDocNum(docTypes::ProductCategory->value);
                DB::commit();
                $NewData = DB::table('tbl_product_category')->where('PCID', $PCID)->get();
                $logData = array("Description" => "New Product Category Created ", "ModuleName" => $this->ActiveMenuName, "Action" => cruds::ADD->value, "ReferID" => $PCID, "OldData" => $OldData, "NewData" => $NewData, "UserID" => $this->UserID, "IP" => $req->ip());
                logs::Store($logData);
                return array('status' => true, 'message' => "Product Category Created Successfully");
            } else {
                DB::rollback();
                //Helper::removeFile($PCImage);
                foreach ($images as $KeyName => $Img) {
                    Helper::removeFile($Img['url']);
                }
                return array('status' => false, 'message' => "Product Category Create Failed");
            }
        } else {
            return array('status' => false, 'message' => 'Access denined');
        }
    }

    public function update(Request $req, $PCID)
    {
        if ($this->general->isCrudAllow($this->CRUD, "edit") == true) {
            $OldData = array();
            $ValidDB = [];
            //Category Type validation
            $ValidDB['CategoryType']['TABLE'] = "tbl_product_category_type";
            $ValidDB['CategoryType']['ErrMsg'] = "Product Category Type name does not exist";
            $ValidDB['CategoryType']['WHERE'][] = array("COLUMN" => "PCTID", "CONDITION" => "=", "VALUE" => $req->PCTID);
            $ValidDB['CategoryType']['WHERE'][] = array("COLUMN" => "DFlag", "CONDITION" => "=", "VALUE" => 0);
            $ValidDB['CategoryType']['WHERE'][] = array("COLUMN" => "ActiveStatus", "CONDITION" => "=", "VALUE" => 'Active');

            $rules = array(
                'PCName' => ['required', 'max:50', new ValidUnique(array("TABLE" => "tbl_product_category", "WHERE" => " PCName='" . $req->PCName . "' and PCID<>'" . $PCID . "'  "), "This Product Category Name is already taken.")],
                'PCTID' => ['required', new ValidDB($ValidDB['CategoryType'])]
            );
            $message = array(
                'PCName.required' => "Product Category Name is required",
                'PCName.min' => "Product Category Name must be greater than 2 characters",
                'PCName.max' => "Product Category Name may not be greater than 100 characters",
                'PCImage.mimes' => "The Product Category image field must be a file of type: " . implode(", ", $this->FileTypes['category']['Images']) . "."
            );
            if ($req->hasFile('PCImage')) {
                $rules['PCImage'] = 'mimes:' . implode(",", $this->FileTypes['category']['Images']);
            }
            $validator = Validator::make($req->all(), $rules, $message);

            if ($validator->fails()) {
                return array('status' => false, 'message' => "Product Category Update Failed", 'errors' => $validator->errors());
            }
            DB::beginTransaction();
            $currCImage = array();
            $images = array();
            try {
                $OldData = DB::table('tbl_product_category')->where('PCID', $PCID)->get();
                $PCImage = "";
                $dir = "uploads/master/product/category/" . $PCID . "/";
                if (!file_exists($dir)) {
                    mkdir($dir, 0777, true);
                }
                if ($req->hasFile('PCImage')) {
                    $file = $req->file('PCImage');
                    $fileName = md5($file->getClientOriginalName() . time());
                    $fileName1 = $fileName . "." . $file->getClientOriginalExtension();
                    $file->move($dir, $fileName1);
                    $PCImage = $dir . $fileName1;
                } else if (Helper::isJSON($req->PCImage) == true) {
                    $Img = json_decode($req->PCImage);
                    if (file_exists($Img->uploadPath)) {
                        $fileName1 = $Img->fileName != "" ? $Img->fileName : Helper::RandomString(10) . "png";
                        copy($Img->uploadPath, $dir . $fileName1);
                        $PCImage = $dir . $fileName1;
                        unlink($Img->uploadPath);
                    }
                }
                if (file_exists($PCImage)) {
                    $images = helper::ImageResize($PCImage, $dir);
                }
                if (($PCImage != "" || intval($req->removePCImage) == 1) && Count($OldData) > 0) {
                    $currCImage = $OldData[0]->Images != "" ? unserialize($OldData[0]->Images) : array();
                }
                $data = array(
                    "PCName" => $req->PCName,
                    "PCTID" => $req->PCTID,
                    "ActiveStatus" => $req->ActiveStatus,
                    "UpdatedBy" => $this->UserID,
                    "UpdatedOn" => date("Y-m-d H:i:s")
                );
                if ($PCImage != "") {
                    $data['PCImage'] = $PCImage;
                    $data['Images'] = serialize($images);
                } else if (intval($req->removePCImage) == 1) {
                    $data['PCImage'] = "";
                    $data['Images'] = serialize(array());
                }
                $status = DB::Table('tbl_product_category')->where('PCID', $PCID)->update($data);
                if ($status) {
                    DB::commit();
                }
            } catch (Exception $e) {
                $status = false;
            }

            if ($status == true) {
                DB::commit();
                $NewData = DB::table('tbl_product_category')->where('PCID', $PCID)->get();
                $logData = array("Description" => "Product Category Updated ", "ModuleName" => $this->ActiveMenuName, "Action" => cruds::UPDATE->value, "ReferID" => $PCID, "OldData" => $OldData, "NewData" => $NewData, "UserID" => $this->UserID, "IP" => $req->ip());
                logs::Store($logData);
                //Helper::removeFile($currCImage);

                foreach ($currCImage as $KeyName => $Img) {
                    Helper::removeFile($Img['url']);
                }
                return array('status' => true, 'message' => "Product Category Updated Successfully");
            } else {
                DB::rollback();
                foreach ($images as $KeyName => $Img) {
                    Helper::removeFile($Img['url']);
                }
                return array('status' => false, 'message' => "Product Category Update Failed");
            }
        } else {
            return array('status' => false, 'message' => 'Access denined');
        }
    }

    public function Delete(Request $req, $PCID)
    {
        $OldData = $NewData = array();
        if ($this->general->isCrudAllow($this->CRUD, "delete")) {
            DB::beginTransaction();
            $status = false;
            try {
                $OldData = DB::table('tbl_product_category')->where('PCID', $PCID)->get();
                $status = DB::table('tbl_product_category')->where('PCID', $PCID)->update(array("DFlag" => 1, "DeletedBy" => $this->UserID, "DeletedOn" => date("Y-m-d H:i:s")));
            } catch (Exception $e) {

            }
            if ($status) {
                DB::commit();
                $logData = array("Description" => "Product Category has been Deleted ", "ModuleName" => $this->ActiveMenuName, "Action" => cruds::DELETE->value, "ReferID" => $PCID, "OldData" => $OldData, "NewData" => $NewData, "UserID" => $this->UserID, "IP" => $req->ip());
                logs::Store($logData);
                return array('status' => true, 'message' => "Product Category Deleted Successfully");
            } else {
                DB::rollback();
                return array('status' => false, 'message' => "Product Category Delete Failed");
            }
        } else {
            return response(array('status' => false, 'message' => "Access Denied"), 403);
        }
    }

    public function Restore(Request $req, $PCID)
    {
        $OldData = $NewData = array();
        if ($this->general->isCrudAllow($this->CRUD, "restore") == true) {
            DB::beginTransaction();
            $status = false;
            try {
                $OldData = DB::table('tbl_product_category')->where('PCID', $PCID)->get();
                $status = DB::table('tbl_product_category')->where('PCID', $PCID)->update(array("DFlag" => 0, "UpdatedBy" => $this->UserID, "UpdatedOn" => date("Y-m-d H:i:s")));
            } catch (Exception $e) {

            }
            if ($status == true) {
                DB::commit();
                $NewData = DB::table('tbl_product_category')->where('PCID', $PCID)->get();
                $logData = array("Description" => "Product Category has been Restored ", "ModuleName" => $this->ActiveMenuName, "Action" => cruds::RESTORE->value, "ReferID" => $PCID, "OldData" => $OldData, "NewData" => $NewData, "UserID" => $this->UserID, "IP" => $req->ip());
                logs::Store($logData);
                return array('status' => true, 'message' => "Product Category Restored Successfully");
            } else {
                DB::rollback();
                return array('status' => false, 'message' => "Product Category Restore Failed");
            }
        } else {
            return response(array('status' => false, 'message' => "Access Denied"), 403);
        }
    }

    public function TableView(Request $request)
    {
        if ($this->general->isCrudAllow($this->CRUD, "view")) {
            $columns = array(
                array('db' => 'C.PCID', 'dt' => '0'),
                array('db' => 'C.PCName', 'dt' => '1'),
                array('db' => 'PCT.PCTName', 'dt' => '2'),
                array('db' => 'C.ActiveStatus', 'dt' => '3'),
            );
            $columns1 = array(
                array('db' => 'PCID', 'dt' => '0'),
                array('db' => 'PCName', 'dt' => '1'),
                array('db' => 'PCTName', 'dt' => '2'),
                array('db' => 'ActiveStatus', 'dt' => '3',
                    'formatter' => function ($d, $row) {
                        if ($d == "Active") {
                            return "<span class='badge badge-success m-1'>Active</span>";
                        } else {
                            return "<span class='badge badge-danger m-1'>Inactive</span>";
                        }
                    }
                ),
                array('db' => 'PCID', 'dt' => '4',
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
            $data['TABLE'] = "tbl_product_category as C LEFT JOIN tbl_product_category_type as PCT ON PCT.PCTID = C.PCTID";
            $data['PRIMARYKEY'] = 'C.PCID';
            $data['COLUMNS'] = $columns;
            $data['COLUMNS1'] = $columns1;
            $data['GROUPBY'] = null;
            $data['WHERERESULT'] = null;
            $data['WHEREALL'] = " C.DFlag=0 ";
            return SSP::SSP($data);
        } else {
            return response(array('status' => false, 'message' => "Access Denied"), 403);
        }
    }


    public function TrashTableView(Request $request)
    {
        if ($this->general->isCrudAllow($this->CRUD, "restore")) {
            $columns = array(
                array('db' => 'PCID', 'dt' => '0'),
                array('db' => 'PCName', 'dt' => '1'),
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
                    'db' => 'PCID',
                    'dt' => '3',
                    'formatter' => function ($d, $row) {
                        $html = '<button type="button" data-id="' . $d . '" class="btn btn-outline-success ' . $this->general->UserInfo['Theme']['button-size'] . '  m-2 btnRestore"> <i class="fa fa-repeat" aria-hidden="true"></i> </button>';
                        return $html;
                    }
                )
            );
            $data = array();
            $data['POSTDATA'] = $request;
            $data['TABLE'] = 'tbl_product_category';
            $data['PRIMARYKEY'] = 'PCID';
            $data['COLUMNS'] = $columns;
            $data['COLUMNS1'] = $columns;
            $data['GROUPBY'] = null;
            $data['WHERERESULT'] = null;
            $data['WHEREALL'] = " DFlag=1 ";
            return SSP::SSP($data);
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

    public function GetNewProductCategory(Request $req)
    {
        $OtherCruds = array(
            "PCategory" => $this->general->getCrudOperations(activeMenuNames::ProductCategory->value),
            "PCategoryType" => $this->general->getCrudOperations(activeMenuNames::ProductCategoryType->value),
        );
        $Theme = $this->getThemesOption();
        return view("app.modals.productCategory", array("Theme" => $Theme, "FileTypes" => $this->FileTypes, "OtherCruds" => $OtherCruds));
    }

    public static function GetProductCategory(Request $req)
    {
        return DB::table('tbl_product_category')
            ->where('ActiveStatus', 'Active')
            ->where('DFlag', 0)
            ->when($req->PCTID, function ($query) use ($req) {
                return $query->where('PCTID', $req->PCTID);
            })
            ->get();
    }

    public static function GetProductCategoryType(Request $req)
    {
        return DB::Table('tbl_product_category_type')->where('ActiveStatus', 'Active')->where('DFlag', 0)->get();
    }

}

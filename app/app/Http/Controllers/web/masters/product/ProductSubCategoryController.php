<?php

namespace App\Http\Controllers\web\masters\product;

use App\enums\activeMenuNames;
use App\helper\helper;
use App\Http\Controllers\Controller;
use App\Models\Language;
use App\Models\ProductCategoryType;
use App\Rules\ValidDB;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Redirect;
use App\Models\DocNum;
use App\Models\general;
use SSP;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\Rules\ValidUnique;
use logs;
use App\enums\docTypes;
use App\enums\cruds;
use helper\dynamicField;
use stdClass;

class ProductSubCategoryController extends Controller
{
    private $general;
    private $DocNum;
    private $UserID;
    private $ActiveMenuName;
    private $PageTitle;
    private $CRUD;
    private $Settings;
    private $FileTypes;
    private $Menus;

    public function __construct()
    {
        $this->ActiveMenuName = activeMenuNames::ProductSubCategory->value;
        $this->PageTitle = "Product Sub Category";
        $this->middleware('auth');
        $this->FileTypes = Helper::getFileTypes(array("category" => array("Images")));
        $this->middleware(function ($request, $next) {
            $this->UserID = auth()->user()->UserID;
            $this->general = new general($this->UserID, $this->ActiveMenuName);
            $this->Menus = $this->general->loadMenu();
            $this->CRUD = $this->general->getCrudOperations($this->ActiveMenuName);
            $this->Settings = $this->general->getSettings();
            return $next($request);
        });
    }

    public function view(Request $req)
    {
        if ($this->general->isCrudAllow($this->CRUD, "view")) {
            $FormData = $this->general->UserInfo;
            $FormData['menus'] = $this->Menus;
            $FormData['crud'] = $this->CRUD;
            $FormData['ActiveMenuName'] = $this->ActiveMenuName;
            $FormData['PageTitle'] = $this->PageTitle;
            return view('app.master.product.sub-category.view', $FormData);
        } elseif ($this->general->isCrudAllow($this->CRUD, "add")) {
            return Redirect::to('/admin/master/product/sub-category/create');
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
            return view('app.master.product.sub-category.trash', $FormData);
        } elseif ($this->general->isCrudAllow($this->CRUD, "view")) {
            return Redirect::to('/admin/master/product/sub-category/');
        } else {
            return view('errors.403');
        }
    }

    public function create(Request $req)
    {
        if ($this->general->isCrudAllow($this->CRUD, "add")) {
            $OtherCruds = array(
                "PCategory" => $this->general->getCrudOperations(activeMenuNames::ProductCategory->value),
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
            $FormData['languages'] = Language::active()->get();
            return view('app.master.product.sub-category.create', $FormData);
        } elseif ($this->general->isCrudAllow($this->CRUD, "view")) {
            return Redirect::to('/admin/master/product/sub-category/');
        } else {
            return view('errors.403');
        }
    }

    public function edit(Request $req, $PSCID)
    {
        if ($this->general->isCrudAllow($this->CRUD, "edit")) {
            $OtherCruds = array(
                "PCategory" => $this->general->getCrudOperations(activeMenuNames::ProductCategory->value),
                "PCategoryType" => $this->general->getCrudOperations(activeMenuNames::ProductCategoryType->value),
            );
            $FormData = $this->general->UserInfo;
            $FormData['menus'] = $this->Menus;
            $FormData['crud'] = $this->CRUD;
            $FormData['ActiveMenuName'] = $this->ActiveMenuName;
            $FormData['PageTitle'] = $this->PageTitle;
            $FormData['isEdit'] = true;
            $FormData['PSCID'] = $PSCID;
            $FormData['FileTypes'] = $this->FileTypes;
            $FormData['OtherCruds'] = $OtherCruds;
            $FormData['languages'] = Language::active()->get();
            $FormData['EditData'] = DB::Table('tbl_product_subcategory')->where('DFlag', 0)->Where('PSCID', $PSCID)->get();
            if (count($FormData['EditData']) > 0) {
                $FormData['EditData'][0]->VideoURLs = unserialize($FormData['EditData'][0]->VideoURLs);
                $FormData['EditData'][0]->PSCNameInTranslation = json_decode($FormData['EditData'][0]->PSCNameInTranslation);
                return view('app.master.product.sub-category.create', $FormData);
            } else {
                return view('errors.403');
            }
        } elseif ($this->general->isCrudAllow($this->CRUD, "view")) {
            return Redirect::to('/admin/master/product/sub-category');
        } else {
            return view('errors.403');
        }
    }

    public function getCategory(request $req)
    {
        return DB::Table('tbl_product_category')->where('ActiveStatus', 'Active')->where('DFlag', 0)->get();
    }

    public function save(Request $req)
    {
        if ($this->general->isCrudAllow($this->CRUD, "add")) {
            $OldData = array();
            $NewData = array();
            $PSCID = "";
            $ValidDB = array();
            //Category Type validation check
            $ValidDB['CategoryType']['TABLE'] = "tbl_product_category_type";
            $ValidDB['CategoryType']['ErrMsg'] = "Product Category Type name does not exist";
            $ValidDB['CategoryType']['WHERE'][] = array("COLUMN" => "PCTID", "CONDITION" => "=", "VALUE" => $req->PCTID);
            $ValidDB['CategoryType']['WHERE'][] = array("COLUMN" => "DFlag", "CONDITION" => "=", "VALUE" => 0);
            $ValidDB['CategoryType']['WHERE'][] = array("COLUMN" => "ActiveStatus", "CONDITION" => "=", "VALUE" => 'Active');
            //Category
            $ValidDB['Category']['TABLE'] = "tbl_product_category";
            $ValidDB['Category']['ErrMsg'] = "Product Category name does not exist";
            $ValidDB['Category']['WHERE'][] = array("COLUMN" => "PCID", "CONDITION" => "=", "VALUE" => $req->PCategory);
            $ValidDB['Category']['WHERE'][] = array("COLUMN" => "DFlag", "CONDITION" => "=", "VALUE" => 0);
            $ValidDB['Category']['WHERE'][] = array("COLUMN" => "ActiveStatus", "CONDITION" => "=", "VALUE" => 'Active');

            $rules = array(
                'PSCName' => ['required', 'max:50', new ValidUnique(array("TABLE" => "tbl_product_subcategory", "WHERE" => " PSCName='" . $req->PSCName . "'  "), "This Product Sub Category Name is already taken.")],
                'PCTID' => ['required', new ValidDB($ValidDB['CategoryType'])],
                'PCategory' => ['required', new ValidDB($ValidDB['Category'])],
                'PSCNameInTranslation' => 'required',
            );
            $message = array(
                'PSCName.required' => "Sub Category Name is required",
                'PSCName.min' => "Sub Category Name must be greater than 2 characters",
                'PSCName.max' => "Sub Category Name may not be greater than 100 characters",
                'PSCNameInTranslation.required' => "Product Sub Category Name in Translation is required",
                'PSCImage.mimes' => "The category image field must be a file of type: " . implode(", ", $this->FileTypes['category']['Images']) . "."
            );
            if ($req->hasFile('PSCImage')) {
                $rules['PSCImage'] = 'mimes:' . implode(",", $this->FileTypes['category']['Images']);
            }
            $validator = Validator::make($req->all(), $rules, $message);

            if ($validator->fails()) {
                return array('status' => false, 'message' => "Sub Category Create Failed", 'errors' => $validator->errors());
            }
            DB::beginTransaction();
            $images = array();
            try {
                $PSCImage = "";
                $PSCID = DocNum::getDocNum(docTypes::ProductSubCategory->value, "", Helper::getCurrentFY());
                $dir = "uploads/master/product/sub-category/" . $PSCID . "/";
                if (!file_exists($dir)) {
                    mkdir($dir, 0777, true);
                }
                if ($req->hasFile('PSCImage')) {
                    $file = $req->file('PSCImage');
                    $fileName = md5($file->getClientOriginalName() . time());
                    $fileName1 = $fileName . "." . $file->getClientOriginalExtension();
                    $file->move($dir, $fileName1);
                    $PSCImage = $dir . $fileName1;
                } else if (Helper::isJSON($req->PSCImage) == true) {
                    $Img = json_decode($req->PSCImage);
                    if (file_exists($Img->uploadPath)) {
                        $fileName1 = $Img->fileName != "" ? $Img->fileName : Helper::RandomString(10) . "png";
                        copy($Img->uploadPath, $dir . $fileName1);
                        $PSCImage = $dir . $fileName1;
                        unlink($Img->uploadPath);
                    }
                }
                if (file_exists($PSCImage)) {
                    $images = helper::ImageResize($PSCImage, $dir);
                }
                $data = array(
                    "PSCID" => $PSCID,
                    "PSCName" => $req->PSCName,
                    "PSCNameInTranslation" => $req->PSCNameInTranslation,
                    "PCID" => $req->PCategory,
                    "PCTID" => $req->PCTID,
                    "VideoURLs" => serialize(json_decode($req->VideoURLs, true)),
                    'PSCImage' => $PSCImage,
                    "Images" => serialize($images),
                    "ActiveStatus" => $req->ActiveStatus,
                    "CreatedBy" => $this->UserID,
                    "CreatedOn" => date("Y-m-d H:i:s")
                );
                DB::Table('tbl_product_subcategory')->insert($data);
                DocNum::updateDocNum(docTypes::ProductSubCategory->value);
                DB::commit();
                $NewData = DB::table('tbl_product_subcategory')->where('PSCID', $PSCID)->get();
                $logData = array("Description" => "New Sub Category Created ", "ModuleName" => $this->ActiveMenuName, "Action" => cruds::ADD->value, "ReferID" => $PSCID, "OldData" => $OldData, "NewData" => $NewData, "UserID" => $this->UserID, "IP" => $req->ip());
                logs::Store($logData);
                return array('status' => true, 'message' => "Sub Category Created Successfully");
            } catch (Exception $e) {
                logger($e);
                DB::rollback();
                foreach ($images as $KeyName => $Img) {
                    Helper::removeFile($Img['url']);
                }
                return array('status' => false, 'message' => "Sub Category Create Failed");
            }
        } else {
            return array('status' => false, 'message' => 'Access denined');
        }
    }

    public function update(Request $req, $PSCID)
    {
        if ($this->general->isCrudAllow($this->CRUD, "edit") == true) {
            $OldData = $NewData = array();
            $ValidDB = array();
            //Category Type validation check
            $ValidDB['CategoryType']['TABLE'] = "tbl_product_category_type";
            $ValidDB['CategoryType']['ErrMsg'] = "Product Category Type name does not exist";
            $ValidDB['CategoryType']['WHERE'][] = array("COLUMN" => "PCTID", "CONDITION" => "=", "VALUE" => $req->PCTID);
            $ValidDB['CategoryType']['WHERE'][] = array("COLUMN" => "DFlag", "CONDITION" => "=", "VALUE" => 0);
            $ValidDB['CategoryType']['WHERE'][] = array("COLUMN" => "ActiveStatus", "CONDITION" => "=", "VALUE" => 'Active');

            //Category
            $ValidDB['Category']['TABLE'] = "tbl_product_category";
            $ValidDB['Category']['ErrMsg'] = "Category name does not exist";
            $ValidDB['Category']['WHERE'][] = array("COLUMN" => "PCID", "CONDITION" => "=", "VALUE" => $req->PCategory);
            $ValidDB['Category']['WHERE'][] = array("COLUMN" => "DFlag", "CONDITION" => "=", "VALUE" => 0);
            $ValidDB['Category']['WHERE'][] = array("COLUMN" => "ActiveStatus", "CONDITION" => "=", "VALUE" => 'Active');
            $rules = array(
                'PSCName' => ['required', 'max:50', new ValidUnique(array("TABLE" => "tbl_product_subcategory", "WHERE" => " PSCName='" . $req->PSCName . "' and PSCID<>'" . $PSCID . "'  "), "This Sub Category Name is already taken.")],
                'PCategory' => ['required', new ValidDB($ValidDB['Category'])],
                'PCTID' => ['required', new ValidDB($ValidDB['CategoryType'])],
                'PSCNameInTranslation' => 'required',
            );
            $message = array(
                'CName.required' => "Category Name is required",
                'CName.min' => "Category Name must be greater than 2 characters",
                'CName.max' => "Category Name may not be greater than 100 characters",
                'PSCName.required' => "Sub Category Name is required",
                'PSCName.min' => "Sub Category Name must be greater than 2 characters",
                'PSCName.max' => "Sub Category Name may not be greater than 100 characters",
                'PSCNameInTranslation.required' => "Product Sub Category Name in Translation is required",
                'PSCImage.mimes' => "The category image field must be a file of type: " . implode(", ", $this->FileTypes['category']['Images']) . "."
            );
            if ($req->hasFile('PSCImage')) {
                $rules['PSCImage'] = 'mimes:' . implode(",", $this->FileTypes['category']['Images']);
            }
            $validator = Validator::make($req->all(), $rules, $message);

            if ($validator->fails()) {
                return array('status' => false, 'message' => "Sub Category Update Failed", 'errors' => $validator->errors());
            }
            DB::beginTransaction();
            $currPSCImage = array();
            $images = array();
            try {
                $OldData = DB::table('tbl_product_subcategory')->where('PSCID', $PSCID)->first();
                $PSCImage = "";
                $dir = "uploads/master/product/sub-category/" . $PSCID . "/";
                if (!file_exists($dir)) {
                    mkdir($dir, 0777, true);
                }
                if ($req->hasFile('PSCImage')) {
                    $file = $req->file('PSCImage');
                    $fileName = md5($file->getClientOriginalName() . time());
                    $fileName1 = $fileName . "." . $file->getClientOriginalExtension();
                    $file->move($dir, $fileName1);
                    $PSCImage = $dir . $fileName1;
                } else if (Helper::isJSON($req->PSCImage) == true) {
                    $Img = json_decode($req->PSCImage);
                    if (file_exists($Img->uploadPath)) {
                        $fileName1 = $Img->fileName != "" ? $Img->fileName : Helper::RandomString(10) . "png";
                        copy($Img->uploadPath, $dir . $fileName1);
                        $PSCImage = $dir . $fileName1;
                        unlink($Img->uploadPath);
                    }
                }
                if (file_exists($PSCImage)) {
                    $images = helper::ImageResize($PSCImage, $dir);
                }
                if (($PSCImage != "" || intval($req->removePSCImage) == 1) && $OldData) {
                    $currPSCImage = $OldData->Images != "" ? unserialize($OldData->Images) : array();
                }
                $data = array(
                    "PSCName" => $req->PSCName,
                    "PCID" => $req->PCategory,
                    "PCTID" => $req->PCTID,
                    "VideoURLs" => serialize(json_decode($req->VideoURLs, true)),
                    "ActiveStatus" => $req->ActiveStatus,
                    "UpdatedBy" => $this->UserID,
                    "UpdatedOn" => date("Y-m-d H:i:s")
                );

                $newTranslations = json_decode($req->PSCNameInTranslation);
                $existingTranslations = json_decode($OldData->PSCNameInTranslation);
                if (!$existingTranslations) {
                    $existingTranslations = new stdClass();
                }
                foreach ($newTranslations as $lang => $value) {
                    $existingTranslations->$lang = $value;
                }
                $data['PSCNameInTranslation'] = json_encode($existingTranslations);

                if ($PSCImage != "") {
                    $data['PSCImage'] = $PSCImage;
                    $data['Images'] = serialize($images);
                } else if (intval($req->removePSCImage) == 1) {
                    $data['PSCImage'] = "";
                    $data['Images'] = serialize(array());
                }
                DB::Table('tbl_product_subcategory')->where('PSCID', $PSCID)->update($data);
                DB::commit();
                $NewData = DB::table('tbl_product_subcategory')->where('PSCID', $PSCID)->get();
                $logData = array("Description" => "Sub Category Updated ", "ModuleName" => $this->ActiveMenuName, "Action" => cruds::UPDATE->value, "ReferID" => $PSCID, "OldData" => $OldData, "NewData" => $NewData, "UserID" => $this->UserID, "IP" => $req->ip());
                logs::Store($logData);
                foreach ($currPSCImage as $KeyName => $Img) {
                    Helper::removeFile($Img['url']);
                }
                return array('status' => true, 'message' => "Sub Category Updated Successfully");
            } catch (Exception $e) {
                logger($e);
                DB::rollback();
                foreach ($images as $KeyName => $Img) {
                    Helper::removeFile($Img['url']);
                }
                return array('status' => false, 'message' => "Sub Category Update Failed");
            }
        } else {
            return array('status' => false, 'message' => 'Access denined');
        }
    }

    public function Delete(Request $req, $PSCID)
    {
        $OldData = $NewData = array();
        if ($this->general->isCrudAllow($this->CRUD, "delete")) {
            DB::beginTransaction();
            $status = false;
            try {
                $OldData = DB::table('tbl_product_subcategory')->where('PSCID', $PSCID)->get();
                $status = DB::table('tbl_product_subcategory')->where('PSCID', $PSCID)->update(array("DFlag" => 1, "DeletedBy" => $this->UserID, "DeletedOn" => date("Y-m-d H:i:s")));
            } catch (Exception $e) {

            }
            if ($status == true) {
                DB::commit();
                $logData = array("Description" => "Sub Category has been Deleted ", "ModuleName" => $this->ActiveMenuName, "Action" => cruds::DELETE->value, "ReferID" => $PSCID, "OldData" => $OldData, "NewData" => $NewData, "UserID" => $this->UserID, "IP" => $req->ip());
                logs::Store($logData);
                return array('status' => true, 'message' => "Sub Category Deleted Successfully");
            } else {
                DB::rollback();
                return array('status' => false, 'message' => "Sub Category Delete Failed");
            }
        } else {
            return response(array('status' => false, 'message' => "Access Denied"), 403);
        }
    }

    public function Restore(Request $req, $PSCID)
    {
        $OldData = $NewData = array();
        if ($this->general->isCrudAllow($this->CRUD, "restore")) {
            DB::beginTransaction();
            $status = false;
            try {
                $OldData = DB::table('tbl_product_subcategory')->where('PSCID', $PSCID)->get();
                $status = DB::table('tbl_product_subcategory')->where('PSCID', $PSCID)->update(array("DFlag" => 0, "UpdatedBy" => $this->UserID, "UpdatedOn" => date("Y-m-d H:i:s")));
            } catch (Exception $e) {

            }
            if ($status == true) {
                DB::commit();
                $NewData = DB::table('tbl_product_subcategory')->where('PSCID', $PSCID)->get();
                $logData = array("Description" => "Sub Category has been Restored ", "ModuleName" => $this->ActiveMenuName, "Action" => cruds::RESTORE->value, "ReferID" => $PSCID, "OldData" => $OldData, "NewData" => $NewData, "UserID" => $this->UserID, "IP" => $req->ip());
                logs::Store($logData);
                return array('status' => true, 'message' => "Sub Category Restored Successfully");
            } else {
                DB::rollback();
                return array('status' => false, 'message' => "Sub Category Restore Failed");
            }
        } else {
            return response(array('status' => false, 'message' => "Access Denied"), 403);
        }
    }

    public function TableView(Request $request)
    {
        if ($this->general->isCrudAllow($this->CRUD, "Restore")) {
            $columns = array(
                array('db' => 'SC.PSCID', 'dt' => '0'),
                array('db' => 'SC.PSCName', 'dt' => '1'),
                array('db' => 'PCT.PCTName', 'dt' => '2'),
                array('db' => 'C.PCName', 'dt' => '3'),
                array('db' => 'SC.ActiveStatus', 'dt' => '4'),
            );
            $columns1 = array(
                array('db' => 'PSCID', 'dt' => '0'),
                array('db' => 'PSCName', 'dt' => '1'),
                array('db' => 'PCTName', 'dt' => '2'),
                array('db' => 'PCName', 'dt' => '3'),
                array('db' => 'ActiveStatus', 'dt' => '4',
                    'formatter' => function ($d, $row) {
                        if ($d == "Active") {
                            return "<span class='badge badge-success m-1'>Active</span>";
                        } else {
                            return "<span class='badge badge-danger m-1'>Inactive</span>";
                        }
                    }
                ),
                array('db' => 'PSCID', 'dt' => '5',
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
            $data['TABLE'] = 'tbl_product_subcategory as SC LEFT JOIN tbl_product_category as C ON C.PCID=SC.PCID LEFT JOIN tbl_product_category_type as PCT ON PCT.PCTID = C.PCTID';
            $data['PRIMARYKEY'] = 'SC.PSCID';
            $data['COLUMNS'] = $columns;
            $data['COLUMNS1'] = $columns1;
            $data['GROUPBY'] = null;
            $data['WHERERESULT'] = null;
            $data['WHEREALL'] = " SC.DFlag=0 ";
            return SSP::SSP($data);
        } else {
            return response(array('status' => false, 'message' => "Access Denied"), 403);
        }
    }


    public function TrashTableView(Request $request)
    {
        if ($this->general->isCrudAllow($this->CRUD, "restore")) {
            $columns = array(
                array('db' => 'SC.PSCID', 'dt' => '0'),
                array('db' => 'SC.PSCName', 'dt' => '1'),
                array('db' => 'C.PCName', 'dt' => '2'),
                array('db' => 'SC.ActiveStatus', 'dt' => '3'),
                array('db' => 'SC.PSCID', 'dt' => '4')
            );
            $columns1 = array(
                array('db' => 'PSCID', 'dt' => '0'),
                array('db' => 'PSCName', 'dt' => '1'),
                array('db' => 'PCName', 'dt' => '2'),
                array('db' => 'ActiveStatus', 'dt' => '3',
                    'formatter' => function ($d, $row) {
                        if ($d == "Active") {
                            return "<span class='badge badge-success m-1'>Active</span>";
                        } else {
                            return "<span class='badge badge-danger m-1'>Inactive</span>";
                        }
                    }
                ),
                array('db' => 'PSCID', 'dt' => '4',
                    'formatter' => function ($d, $row) {
                        $html = "";
                        if ($this->general->isCrudAllow($this->CRUD, "restore")) {
                            $html .= '<button type="button" data-id="' . $d . '" class="btn btn-outline-success ' . $this->general->UserInfo['Theme']['button-size'] . '  m-2 btnRestore"> <i class="fa fa-repeat" aria-hidden="true"></i> </button>';
                        }
                        return $html;
                    }
                )
            );
            $data = array();
            $data['POSTDATA'] = $request;
            $data['TABLE'] = 'tbl_product_subcategory as SC LEFT JOIN tbl_product_category as C ON C.PCID=SC.PCID';
            $data['PRIMARYKEY'] = 'SC.PSCID';
            $data['COLUMNS'] = $columns;
            $data['COLUMNS1'] = $columns1;
            $data['GROUPBY'] = null;
            $data['WHERERESULT'] = null;
            $data['WHEREALL'] = " SC.DFlag=1 ";
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

    public function GetNewProductSubCategory(Request $req)
    {
        $Theme = $this->getThemesOption();
        $PCategory = ProductCategoryController::GetProductCategory($req);
        $PCategoryType = ProductCategoryTypeController::GetProductCategoryType($req);
        $languages = Language::active()->get();
        return view("app.modals.productSubCategory", array("Theme" => $Theme, "FileTypes" => $this->FileTypes, "PCategoryType" => $PCategoryType, "PCategory" => $PCategory, "PCID" => $req->PCID, "PCTID" => $req->PCTID, "languages" => $languages));
    }

    public function GetProductSubCategory(request $req)
    {
        return DB::Table('tbl_product_subcategory')->where('ActiveStatus', 'Active')->where('DFlag', 0)->where('PCID', $req->PCID)->get();
    }
}

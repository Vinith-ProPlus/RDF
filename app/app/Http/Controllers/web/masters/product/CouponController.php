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
use Illuminate\Validation\Rule;
use Nette\Utils\Random;

class CouponController extends Controller
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
        $this->ActiveMenuName = activeMenuNames::Coupon->value;
        $this->PageTitle = "Coupons";
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
            return view('app.master.product.coupon.view', $FormData);
        } elseif ($this->general->isCrudAllow($this->CRUD, "add")) {
            return Redirect::to('/admin/master/product/coupon/create');
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
            return view('app.master.product.coupon.trash', $FormData);
        } elseif ($this->general->isCrudAllow($this->CRUD, "view")) {
            return Redirect::to('/admin/master/product/coupon/');
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
            return view('app.master.product.coupon.create', $FormData);
        } elseif ($this->general->isCrudAllow($this->CRUD, "view")) {
            return Redirect::to('/admin/master/product/coupon/');
        } else {
            return view('errors.403');
        }
    }

    public function edit(Request $req, $COID)
    {
        if ($this->general->isCrudAllow($this->CRUD, "edit")) {
            $FormData = $this->general->UserInfo;
            $FormData['menus'] = $this->Menus;
            $FormData['crud'] = $this->CRUD;
            $FormData['ActiveMenuName'] = $this->ActiveMenuName;
            $FormData['PageTitle'] = $this->PageTitle;
            $FormData['isEdit'] = true;
            $FormData['FileTypes'] = $this->FileTypes;
            $FormData['EditData'] = DB::Table('tbl_coupons')->where('DFlag', 0)->Where('COID', $COID)->get();
            if (count($FormData['EditData']) > 0) {
                return view('app.master.product.coupon.create', $FormData);
            } else {
                return view('errors.403');
            }
        } elseif ($this->general->isCrudAllow($this->CRUD, "view")) {
            return Redirect::to('/admin/master/product/coupon');
        } else {
            return view('errors.403');
        }
    }

    public function save(Request $req)
    {
        if ($this->general->isCrudAllow($this->CRUD, "add")) {
            $OldData = [];
            $req->validate([
                'type' => ['required', Rule::in(['Percentage', 'Amount'])],
                'value' => [
                    'required',
                    function ($attribute, $value, $fail) use ($req) {
                        if ($req->input('type') === 'Percentage') {
                            if ($value < 0 || $value > 100) {
                                $fail('The Coupon Value must be between 0 and 100 for percentage type.');
                            }
                        } elseif ($req->input('type') === 'Amount') {
                            if ($value <= 0) {
                                $fail('The Coupon Value must be greater than 0 for amount type.');
                            }
                        }
                    },
                ],
            ]);

            DB::beginTransaction();
            try {
                $COID = DocNum::getDocNum(docTypes::Coupon->value, "", Helper::getCurrentFY());
                $data = array(
                    "COID" => $COID,
                    "type" => $req->type,
                    "value" => $req->value,
                    "coupon_code" => helper::generateCoupon(),
                    "ActiveStatus" => $req->ActiveStatus,
                    "UpdatedBy" => $this->UserID,
                    "UpdatedOn" => date("Y-m-d H:i:s")
                );
                DB::Table('tbl_coupons')->insert($data);
                DocNum::updateDocNum(docTypes::Coupon->value);
                DB::commit();
                $NewData = DB::table('tbl_coupons')->where('COID', $COID)->get();
                $logData = array("Description" => "New Coupon Created ", "ModuleName" => $this->ActiveMenuName, "Action" => cruds::ADD->value, "ReferID" => $COID, "OldData" => $OldData, "NewData" => $NewData, "UserID" => $this->UserID, "IP" => $req->ip());
                logController::Store($logData);
                return array('status' => true, 'message' => "Coupon Created Successfully");
            } catch (Exception $e) {
                logger($e);
                DB::rollback();
                return array('status' => false, 'message' => "Coupon Creation Failed");
            }
        } else {
            return array('status' => false, 'message' => 'Access denied');
        }
    }

    public function update(Request $req, $COID)
    {
        if ($this->general->isCrudAllow($this->CRUD, "edit")) {
            $OldData = array();
           $req->validate([
                'type' => ['required', Rule::in(['Percentage', 'Amount'])],
                'value' => [
                    'required',
                    function ($attribute, $value, $fail) use ($req) {
                        if ($req->input('type') === 'Percentage') {
                            if ($value < 0 || $value > 100) {
                                $fail('The Coupon Value must be between 0 and 100 for percentage type.');
                            }
                        } elseif ($req->input('type') === 'Amount') {
                            if ($value <= 0) {
                                $fail('The Coupon Value must be greater than 0 for amount type.');
                            }
                        }
                    },
                ],
            ]);
            DB::beginTransaction();

            try {
                $OldData = DB::table('tbl_coupons')->where('COID', $COID)->get();

                $data = array(
                    "type" => $req->type,
                    "value" => $req->value,
                    "ActiveStatus" => $req->ActiveStatus,
                    "UpdatedBy" => $this->UserID,
                    "UpdatedOn" => date("Y-m-d H:i:s")
                );
                $status = DB::Table('tbl_coupons')->where('COID', $COID)->update($data);
                    DB::commit();
            } catch (Exception $e) {
                logger($e);
                $status = false;
            }

            if ($status) {
                DB::commit();
                $NewData = DB::table('tbl_coupons')->where('COID', $COID)->get();
                $logData = array("Description" => "Coupon Updated ", "ModuleName" => $this->ActiveMenuName, "Action" => cruds::UPDATE->value, "ReferID" => $COID, "OldData" => $OldData, "NewData" => $NewData, "UserID" => $this->UserID, "IP" => $req->ip());
                logController::Store($logData);
                return array('status' => true, 'message' => "Coupon Updated Successfully");
            } else {
                DB::rollback();
                return array('status' => false, 'message' => "Coupon Update Failed");
            }
        } else {
            return array('status' => false, 'message' => 'Access denined');
        }
    }

    public function Delete(Request $req, $COID)
    {
        $OldData = $NewData = array();
        if ($this->general->isCrudAllow($this->CRUD, "delete")) {
            DB::beginTransaction();
            $status = false;
            try {
                $OldData = DB::table('tbl_coupons')->where('COID', $COID)->get();
                $status = DB::table('tbl_coupons')->where('COID', $COID)->update(array("DFlag" => 1, "DeletedBy" => $this->UserID, "DeletedOn" => date("Y-m-d H:i:s")));
            } catch (Exception $e) {

            }
            if ($status) {
                DB::commit();
                $logData = array("Description" => "Coupon has been Deleted ", "ModuleName" => $this->ActiveMenuName, "Action" => cruds::DELETE->value, "ReferID" => $COID, "OldData" => $OldData, "NewData" => $NewData, "UserID" => $this->UserID, "IP" => $req->ip());
                logController::Store($logData);
                return array('status' => true, 'message' => "Coupon Deleted Successfully");
            } else {
                DB::rollback();
                return array('status' => false, 'message' => "Coupon Delete Failed");
            }
        } else {
            return response(array('status' => false, 'message' => "Access Denied"), 403);
        }
    }

    public function Restore(Request $req, $COID)
    {
        $OldData = $NewData = array();
        if ($this->general->isCrudAllow($this->CRUD, "restore")) {
            DB::beginTransaction();
            $status = false;
            try {
                $OldData = DB::table('tbl_coupons')->where('COID', $COID)->get();
                $status = DB::table('tbl_coupons')->where('COID', $COID)->update(array("DFlag" => 0, "UpdatedBy" => $this->UserID, "UpdatedOn" => date("Y-m-d H:i:s")));
            } catch (Exception $e) {

            }
            if ($status) {
                DB::commit();
                $NewData = DB::table('tbl_coupons')->where('COID', $COID)->get();
                $logData = array("Description" => "Coupon has been Restored ", "ModuleName" => $this->ActiveMenuName, "Action" => cruds::RESTORE->value, "ReferID" => $COID, "OldData" => $OldData, "NewData" => $NewData, "UserID" => $this->UserID, "IP" => $req->ip());
                logController::Store($logData);
                return array('status' => true, 'message' => "Coupon Restored Successfully");
            } else {
                DB::rollback();
                return array('status' => false, 'message' => "Coupon Restore Failed");
            }
        } else {
            return response(array('status' => false, 'message' => "Access Denied"), 403);
        }
    }

    public function TableView(Request $request)
    {
        if ($this->general->isCrudAllow($this->CRUD, "view")) {
            $columns = array(
                array('db' => 'COID', 'dt' => '0'),
                array('db' => 'type', 'dt' => '1'),
                array('db' => 'value', 'dt' => '2'),
                array('db' => 'coupon_code', 'dt' => '3'),
                array('db' => 'ActiveStatus', 'dt' => '4',
                    'formatter' => function ($d, $row) {
                        if ($d == "Active") {
                            return "<span class='badge badge-success m-1'>Active</span>";
                        } else {
                            return "<span class='badge badge-danger m-1'>Inactive</span>";
                        }
                    }
                ),
                array('db' => 'COID', 'dt' => '5',
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
            $data['TABLE'] = 'tbl_coupons';
            $data['PRIMARYKEY'] = 'COID';
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
                array('db' => 'COID', 'dt' => '0'),
                array('db' => 'type', 'dt' => '1'),
                array('db' => 'value', 'dt' => '2'),
                array('db' => 'coupon_code', 'dt' => '3'),
                array('db' => 'ActiveStatus', 'dt' => '4',
                    'formatter' => function ($d, $row) {
                        if ($d == "Active") {
                            return "<span class='badge badge-success m-1'>Active</span>";
                        } else {
                            return "<span class='badge badge-danger m-1'>Inactive</span>";
                        }
                    }
                ),
                array(
                    'db' => 'COID',
                    'dt' => '5',
                    'formatter' => function ($d, $row) {
                        $html = '<button type="button" data-id="' . $d . '" class="btn btn-outline-success ' . $this->general->UserInfo['Theme']['button-size'] . '  m-2 btnRestore"> <i class="fa fa-repeat" aria-hidden="true"></i> </button>';
                        return $html;
                    }
                )
            );
            $data = array();
            $data['POSTDATA'] = $request;
            $data['TABLE'] = 'tbl_coupons';
            $data['PRIMARYKEY'] = 'COID';
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
}

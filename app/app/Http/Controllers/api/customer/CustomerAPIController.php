<?php

namespace App\Http\Controllers\api\customer;

use App\helper\helper;
use App\Http\Controllers\Controller;
use App\Http\Controllers\web\logController;
use App\Http\Requests\MobileNoRegistrationRequest;
use App\Models\Customer;
use App\Traits\ApiResponse;
use Exception;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use Laravel\Passport\RefreshToken;
use Laravel\Passport\Token;
use App\Rules\ValidUnique;
use App\Rules\ValidDB;
use App\Models\DocNum;
use App\enums\docTypes;
use Illuminate\Support\Facades\Hash;
use logs;
use Nette\Utils\Random;
use PhpParser\Node\Stmt\If_;

class CustomerAPIController extends Controller{
    use ApiResponse;
    private $generalDB;
    private $tmpDB;
    private $FileTypes;


    public function __construct(){
		$this->generalDB=Helper::getGeneralDB();
		$this->tmpDB=Helper::getTmpDB();
		$this->FileTypes=Helper::getFileTypes(array("category"=>array("Images","Documents")));
    }


    public function login(Request $request)
    {
        $validatedData = Validator::make($request->all(), [
            'mobile_no' => 'required|integer|digits:10'
        ]);

        if ($validatedData->fails()) {
            return $this->errorResponse($validatedData->errors(), 'Validation Error', 422);
        }

        DB::beginTransaction();
        try {
            $customer = Customer::where('MobileNo1', $request->mobile_no)->first();
            $otp = Random::generate(4, '0-9');
            if ($customer){
                $oldCustomer = $customer->replicate();
                $otp = Random::generate(4, '0-9');
                $customer->update(["otp" => $otp, "otp_verified"=> false]);

                $logData = array(
                    "Description" => "Login request",
                    "ModuleName" => "Customer",
                    "Action" => "Update",
                    "ReferID" => $customer->CustomerID,
                    "OldData" => $oldCustomer,
                    "NewData" => $customer->customerData,
                    "UserID" => $customer->CustomerID,
                    "IP" => $request->ip()
                );
            } else {
                $CustomerID = DocNum::getDocNum(docTypes::Customer->value, "", Helper::getCurrentFY());
                $data = [
                    "CustomerID" => $CustomerID,
                    "MobileNo1" => $request->mobile_no,
                    "otp" => $otp,
                    "CreatedOn" => now()
                ];
                $customer = Customer::create($data);
                $logData = array(
                    "Description" => "New Customer Created",
                    "ModuleName" => "Customer",
                    "Action" => "Add",
                    "ReferID" => $CustomerID,
                    "OldData" => [],
                    "NewData" => $customer,
                    "UserID" => $CustomerID,
                    "IP" => $request->ip()
                );
                DocNum::updateDocNum(docTypes::Customer->value);
            }
            logController::Store($logData);
            DB::commit();
            return $this->successResponse(["new_user"=> is_null($customer->api_token), "otp"=> $otp], "Customer OTP Sent Successfully");
        } catch (Exception $e) {
            logger($e);
            DB::rollback();
            return $this->errorResponse($e, "Customer " . (isset($oldCustomer) ? "Login" : "Registration") . " Failed", 500);
        }
    }

    #
    # Customer OTP verification
    # Need to Pass = mobile_no and otp
    #
    public function OtpVerification(Request $request)
    {
        $validatedData = Validator::make($request->all(), [
            'mobile_no' => 'required|integer|digits:10|exists:tbl_customer,MobileNo1',
            'otp' => 'required|digits:4',
            'fcmToken' => 'required|string'
        ]);

        if ($validatedData->fails()) {
            return $this->errorResponse($validatedData->errors(), 'Validation Error', 422);
        }

        DB::beginTransaction();
        try {
            $customer = Customer::where('MobileNo1', $request->mobile_no)->first();
            if (!$customer) {
                return $this->errorResponse([], "Customer not found", 404);
            }

            $oldCustomer = $customer->replicate();
            if ($customer->otp == $request->otp) {
                $token = $customer->api_token ?? Str::random(60);
                $customer->update(["api_token" => $token, "fcmToken" => $request->fcmToken, "otp" => "", "otp_verified" => true]);
            } else {
                return $this->errorResponse([], "Customer OTP is wrong", 422);
            }

            $logData = array(
                "Description" => "Customer OTP Verified",
                "ModuleName" => "Customer",
                "Action" => "Update",
                "ReferID" => $customer->CustomerID,
                "OldData" => $oldCustomer,
                "NewData" => $customer,
                "UserID" => $customer->CustomerID,
                "IP" => $request->ip()
            );
            logController::Store($logData);
            DB::commit();
            return $this->successResponse(["token"=>$token, "customer_data" => $customer], "Customer OTP Verified Successfully");
        } catch (\Exception $e) {
            logger($e);
            DB::rollback();
            return $this->errorResponse($e, "Customer OTP Verification Failed", 500);
        }
    }
    #
    # Customer Nick name Update
    # Need to Pass = nick_name
    #
    public function updateNickName(Request $request): JsonResponse
    {
        $customer = $request->auth_customer;
        $validatedData = Validator::make($request->all(), [
            'nick_name' => 'required|string|min:5|max:25'
        ]);

        if ($validatedData->fails()) {
            return $this->errorResponse($validatedData->errors(), 'Validation Error', 422);
        }

        DB::beginTransaction();
        try {
            $oldCustomer = $customer->replicate();
            $customer->update(["nick_name" => $request->nick_name]);

            $logData = array(
                "Description" => "Customer Nick name",
                "ModuleName" => "Customer",
                "Action" => "Update",
                "ReferID" => $customer->CustomerID,
                "OldData" => $oldCustomer,
                "NewData" => $customer,
                "UserID" => $customer->CustomerID,
                "IP" => $request->ip()
            );
            logController::Store($logData);
            DB::commit();
            return $this->successResponse([], "Customer Nick name updated.");
        } catch (\Exception $e) {
            logger($e);
            DB::rollback();
            return $this->errorResponse($e, "Customer nick name update Failed", 500);
        }
    }
    #
    # Customer Language Update
    # Need to Pass = Language
    #
    public function updateLanguage(Request $request): JsonResponse
    {
        $customer = $request->auth_customer;
        $validatedData = Validator::make($request->all(), [
            'language' => 'required|string|in:en,ta',
        ]);

        if ($validatedData->fails()) {
            return $this->errorResponse($validatedData->errors(), 'Validation Error', 422);
        }

        DB::beginTransaction();
        try {
            $oldCustomer = $customer->replicate();
            $customer->update(["language" => $request->language]);

            $logData = array(
                "Description" => "Customer Language",
                "ModuleName" => "Customer",
                "Action" => "Update",
                "ReferID" => $customer->CustomerID,
                "OldData" => $oldCustomer,
                "NewData" => $customer,
                "UserID" => $customer->CustomerID,
                "IP" => $request->ip()
            );
            logController::Store($logData);
            DB::commit();
            return $this->successResponse([], "Customer language updated.");
        } catch (\Exception $e) {
            logger($e);
            DB::rollback();
            return $this->errorResponse($e, "Customer Language update Failed", 500);
        }
    }

    #
    # Customer profile Update
    #
    public function profileUpdate(Request $request): JsonResponse
    {
        $customer = $request->auth_customer;
        $validatedData = Validator::make($request->all(), [
            'nick_name' => 'required|string|min:5|max:25',
            "full_name" => 'required|string|min:5|max:255',
            "Email" => 'required|email|min:5|max:40',
            "mobile_number" => 'required|numeric',
            "Address" => 'required|string|min:5|max:255',
            "PostalCodeID" => 'required|string|min:5|max:25',
            "CityID" => 'required|string|min:5|max:25',
            "DistrictID" => 'required|string|min:5|max:25',
            "StateID" => 'required|string|min:5|max:25',
        ]);

        if ($validatedData->fails()) {
            return $this->errorResponse($validatedData->errors(), 'Validation Error', 422);
        }

        DB::beginTransaction();
        try {
            $oldCustomer = $customer->replicate();
            $CustomerImage="";
            $dir="uploads/user-and-permissions/customers/".$customer->CustomerID."/";
            if (!file_exists( $dir)) {mkdir( $dir, 0777, true);}

            if($request->CustomerImage && Helper::isJSON($request->CustomerImage)==true){
                $Img=json_decode($request->CustomerImage);
                if (isset($Img->uploadPath) && file_exists($Img->uploadPath)) {
                    $fileName1=$Img->fileName!=""?$Img->fileName:Helper::RandomString(10)."png";
                    copy($Img->uploadPath,$dir.$fileName1);
                    $CustomerImage=$dir.$fileName1;
                    // unlink($Img->uploadPath);
                }
            }
            $data=[
                "nick_name" => $request->nick_name,
                "CustomerName" => $request->full_name,
                "Email" => $request->Email,
                "MobileNo1" => $request->mobile_number,
                "Address" => $request->address,
                "PostalCodeID" => $request->PostalCodeID,
                "CityID" => $request->CityID,
                "DistrictID" => $request->DistrictID,
                "StateID" => $request->StateID,
                "UpdatedOn"=>date("Y-m-d H:i:s")
            ];
            if($CustomerImage){
                $data['CustomerImage']=$CustomerImage;
            }
            $customer->update($data);

            $logData = array(
                "Description" => "Customer profile update",
                "ModuleName" => "Customer",
                "Action" => "Update",
                "ReferID" => $customer->CustomerID,
                "OldData" => $oldCustomer,
                "NewData" => $customer,
                "UserID" => $customer->CustomerID,
                "IP" => $request->ip()
            );
            logController::Store($logData);
            DB::commit();
            return $this->successResponse($customer, "Customer profile updated.");
        } catch (\Exception $e) {
            logger($e);
            DB::rollback();
            return $this->errorResponse($e, "Customer profile update Failed", 500);
        }
    }

    public function homeSearch(Request $req){
            if($req->SearchText){
                $PCategories = DB::table('tbl_product_category as PC')
                    ->where('PC.PCName', 'like', '%' . $req->SearchText . '%')
                    ->groupBy('PC.PCID', 'PC.PCName')
                    ->select('PC.PCID', 'PC.PCName')->take(3)->get();

                $PSCategories = DB::table('tbl_product_subcategory as PSC')
                    ->leftJoin('tbl_product_category as PC', 'PC.PCID', 'PSC.PCID')
                    ->where('PSC.PSCName', 'like', '%' . $req->SearchText . '%')
                    ->groupBy('PC.PCID', 'PC.PCName', 'PSC.PSCID', 'PSC.PSCName')
                    ->select('PC.PCID', 'PC.PCName', 'PSC.PSCID', 'PSC.PSCName')->take(3)->get();

                $Products = DB::table('tbl_products as P')
                    ->leftJoin('tbl_product_subcategory as PSC', 'P.SCID', 'PSC.PSCID')
                    ->leftJoin('tbl_product_category as PC', 'PC.PCID', 'PSC.PCID')
                    ->where('P.ProductName', 'like', '%' . $req->SearchText . '%')
                    ->groupBy('P.ProductID', 'P.ProductName', 'PC.PCID', 'PC.PCName', 'PSC.PSCID', 'PSC.PSCName')
                    ->select('P.ProductID', 'P.ProductName', 'PC.PCID', 'PC.PCName', 'PSC.PSCID', 'PSC.PSCName')->take(3)->get();

                $ProductData = ['PCategories'=>$PCategories,'PSCategories'=>$PSCategories,'Products'=>$Products];

                return response()->json(['status' => true, 'data' => $ProductData ]);
            } else{
                return response()->json(['status' => false, 'message' => "search text is empty"]);
            }
    }
}

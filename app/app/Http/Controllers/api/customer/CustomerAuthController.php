<?php

namespace App\Http\Controllers\api\customer;

use App\helper\helper;
use App\Http\Controllers\Controller;
use App\Http\Controllers\web\logController;
use App\Models\CustomerCart;
use App\Models\Wishlist;
use App\Traits\ApiResponse;
use Exception;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Laravel\Passport\RefreshToken;
use Laravel\Passport\Token;
use App\enums\activeMenuNames;
use App\Rules\ValidUnique;
use App\Rules\ValidDB;
use App\Models\DocNum;
use App\enums\docTypes;
use logs;

use function Laravel\Prompts\select;

class CustomerAuthController extends Controller{
    use ApiResponse;
    private $generalDB;
    private $tmpDB;
    private $ActiveMenuName;
    private $FileTypes;

    public function __construct(){
		$this->generalDB=Helper::getGeneralDB();
		$this->tmpDB=Helper::getTmpDB();
        $this->ActiveMenuName=activeMenuNames::ManageCustomers->value;
		$this->FileTypes=Helper::getFileTypes(array("category"=>array("Images","Documents")));
    }

    public function RegisteredDetails(request $req){

        $Data = DB::Table('tbl_customer')->where('ActiveStatus','Active')->where('CustomerID',$this->ReferID)->where('DFlag',0)
        ->select('CustomerID','CustomerName','DOB','MobileNo1','Email','CustomerImage','CusTypeID','ConTypeIDs','GenderID','Address','CityID','TalukID','DistrictID','StateID','CountryID','PostalCodeID')
        ->first();
        $CustomerImagePath = $Data->CustomerImage;
        $CustomerImageURL = file_exists($CustomerImagePath) ? url('/') . '/' . $Data->CustomerImage : url('/') . '/assets/images/no-image-b.png';
        $Data->CustomerImage = $CustomerImageURL;
        $Data->ConTypeIDs = unserialize($Data->ConTypeIDs);
        $return = [
			'status' => true,
			'data' => $Data,
		];
        return response()->json($return);
	}

    public function getConstructionType(request $req){
		$return = [
			'status' => true,
			'data' => DB::Table('tbl_construction_type')->where('ActiveStatus','Active')->where('DFlag',0)
            ->select('ConTypeID', 'ConTypeName', DB::raw('IF(ConTypeLogo IS NOT NULL AND ConTypeLogo != "", CONCAT("' . url('/') . '/", ConTypeLogo), "") AS ConTypeLogo'))

            ->get(),
		];
        return $return;
	}
    public function getCustomerType(request $req){
		$return = [
			'status' => true,
			'data' => DB::Table('tbl_customer_type')->where('ActiveStatus','Active')->where('DFlag',0)->select('CusTypeID', 'CusTypeName')->get(),
		];
        return $return;
	}
    public function GetCategory(Request $req){
        $pageNo = $req->PageNo ?? 1;
        $perPage = 15;

        $Category = DB::table('tbl_product_category')->where('ActiveStatus', 'Active')->where('DFlag', 0);

        if ($req->has('SearchText') && !empty($req->SearchText)) {
            $Category->where('PCName', 'like', '%' . $req->SearchText . '%');
        }

        $result = $Category->select('PCName', 'PCID', DB::raw('CONCAT("' . url('/') . '/", COALESCE(NULLIF(PCImage, ""), "assets/images/no-image-b.png")) AS CategoryImage'))->paginate($perPage, ['*'], 'page', $pageNo);

        return response()->json([
            'status' => true,
            'data' => $result->items(),
            'CurrentPage' => $result->currentPage(),
            'LastPage' => $result->lastPage(),
        ]);
    }
	public function GetSubCategory(request $req){
		$PCID = $req->PCID;
        $PCIDs = is_array($PCID) ? $PCID : [$PCID];

        $pageNo = $req->PageNo ?? 1;
        $perPage = 15;

		$SubCategory = DB::table('tbl_product_subcategory as PSC')->join('tbl_product_category as PC','PC.PCID','PSC.PCID')
        ->where('PSC.ActiveStatus', 'Active')->where('PSC.DFlag', 0)->where('PC.ActiveStatus', 'Active')->where('PC.DFlag', 0)->whereIn('PSC.PCID', $PCIDs);
        if ($req->has('SearchText') && !empty($req->SearchText)) {
            $SubCategory->where('PSC.PSCName', 'like', '%' . $req->SearchText . '%');
        }
        $result = $SubCategory->select('PSC.PSCName', 'PSC.PSCID','PC.PCID','PC.PCName', DB::raw('CONCAT("' . url('/') . '/", COALESCE(NULLIF(PSC.PSCImage, ""), "assets/images/no-image-b.png")) AS SubCategoryImage'))->paginate($perPage, ['*'], 'page', $pageNo);

		return response()->json([
            'status' => true,
            'data' => $result->items(),
            'CurrentPage' => $result->currentPage(),
            'LastPage' => $result->lastPage(),
        ]);
	}
    public function GetProducts(Request $req){
        $PCID = $req->PCID;
        $PSCID = $req->PSCID;
        $PCIDs = is_array($PCID) ? $PCID : [$PCID];
        $PSCIDs = is_array($PSCID) ? $PSCID : [$PSCID];

        $pageNo = $req->PageNo ?? 1;
        $perPage = 15;

        $products = DB::table('tbl_products as P')->join('tbl_product_category as PC', 'PC.PCID', 'P.CID')->join('tbl_product_subcategory as PSC', 'PSC.PSCID', 'P.SCID')->join('tbl_uom as U', 'U.UID', 'P.UID')
            ->where('P.ActiveStatus', 'Active')->where('P.DFlag', 0)->where('PC.ActiveStatus', 'Active')->where('PC.DFlag', 0)->where('PSC.ActiveStatus', 'Active')->where('PSC.DFlag', 0)
            ->whereIn('P.CID', $PCIDs)->whereIn('P.SCID', $PSCIDs);

        if ($req->has('SearchText') && !empty($req->SearchText)) {
            $products->where('P.ProductName', 'like', '%' . $req->SearchText . '%');
        }

        $products = $products->select('P.ProductName', 'P.ProductID', 'PC.PCName', 'PC.PCID', 'PSC.PSCName', 'PSC.PSCID','U.UName','U.UCode','U.UID', DB::raw('CONCAT("' . url('/') . '/", COALESCE(NULLIF(P.ProductImage, ""), "assets/images/no-image-b.png")) AS ProductImage'))
            ->paginate($perPage, ['*'], 'page', $pageNo);

        foreach ($products as $row) {
            $row->GalleryImages = DB::table('tbl_products_gallery')
                ->where('ProductID', $row->ProductID)
                ->pluck(DB::raw('CONCAT("' . url('/') . '/", COALESCE(NULLIF(gImage, ""), "assets/images/no-image-b.png")) AS gImage'))
                ->toArray();
        }

        return response()->json([
            'status' => true,
            'data' => $products->items(),
            'CurrentPage' => $products->currentPage(),
            'LastPage' => $products->lastPage(),
        ]);
    }
    public function getCart(Request $req){
        $customer = $req->auth_customer;
        $totalAmount = 0;
        $Cart = DB::table('tbl_customer_cart as C')
            ->leftJoin('tbl_products_variation as PV', 'PV.VariationID', 'C.ProductVariationID')
            ->join('tbl_products as P', 'P.ProductID', '=', 'C.ProductID')
            ->join('tbl_product_category_type as PCT', 'PCT.PCTID', '=', 'P.CTID')
            ->join('tbl_product_category as PC', 'PC.PCID', '=', 'P.CID')
            ->join('tbl_product_subcategory as PSC', 'PSC.PSCID', '=', 'P.SCID')
            ->join('tbl_uom as U', 'U.UID', '=', 'P.UID')
            ->where('C.CustomerID', $customer->CustomerID)
            ->where('P.ActiveStatus', 'Active')
            ->where('P.DFlag', 0)
            ->where('PC.ActiveStatus', 'Active')
            ->where('PC.DFlag', 0)
            ->where('PSC.ActiveStatus', 'Active')
            ->where('PSC.DFlag', 0)
            ->select(
                'P.ProductName as product_name',
                'P.ProductID',
                'P.PRate as PRate',
                'P.SRate as SRate',
                'PV.VariationID as product_variation_id',
                'C.Qty',
                'PCT.PCTName',
                'PCT.PCTID',
                'PC.PCName',
                'PC.PCID',
                'PSC.PSCName',
                'U.UName',
                'U.UCode',
                'U.UID',
                'PSC.PSCID',
                'PV.Title as variation_title',
                'PV.PRate as variation_PRate',
                'PV.SRate as variation_SRate',
                'PV.VImage as variation_image',
                DB::raw('CONCAT("' . config('app.url') . '/", COALESCE(NULLIF(P.ProductImage, ""), "assets/images/no-image-b.png")) AS ProductImage')
            )
            ->get();

        foreach ($Cart as $item) {
            if ($item->product_variation_id) {
                $item->product_name = $item->variation_title;
                $item->PRate = $item->variation_PRate;
                $item->SRate = $item->variation_SRate;
                $item->ProductImage = $item->variation_image ? url($item->variation_image) : url("assets/images/no-image-b.png");
            }
            $product_rate = $item->SRate * $item->Qty;
            $item->PTotalRate = Helper::formatAmount($product_rate);
            $item->PRate = Helper::formatAmount($item->PRate);
            $item->SRate = Helper::formatAmount($item->SRate);
            $totalAmount += $product_rate;
            unset($item->variation_title, $item->variation_PRate, $item->variation_SRate, $item->variation_image);
        }

        return response()->json(['status' => true, 'total_amount' => Helper::formatAmount($totalAmount),'total_product_count' => $Cart->count(), 'data' => $Cart]);
    }

    public function AddCart(Request $request){
        $customer = $request->auth_customer;
        DB::beginTransaction();
        try {
            $validatedData = Validator::make($request->all(), [
                'ProductID' => 'required|string|exists:tbl_products,ProductID',
                'ProductVariationID' => 'nullable|string|exists:tbl_products_variation,VariationID',
            ]);

            if ($validatedData->fails()) {
                return $this->errorResponse($validatedData->errors(), 'Validation Error', 422);
            }

            $ProductID = $request->ProductID;
            $ProductVariationID = $request->ProductVariationID;
            $CustomerID = $customer->CustomerID;
            $cart = CustomerCart::firstOrCreate(['CustomerID' => $CustomerID, 'ProductID' => $ProductID,
                'ProductVariationID' => $ProductVariationID]);
            DB::commit();
            if ($cart->wasRecentlyCreated) {
                return $this->successResponse([], "Product added to Cart Successfully");
            }
            return $this->errorResponse([], "Product already exists!", 422);
        }catch(Exception $e) {
            logger($e);
            DB::rollback();
            return response()->json(['status' => false,'message' => "Product add to Cart Failed!"]);
        }
    }
    public function UpdateCart(Request $request){
        $customer = $request->auth_customer;
        DB::beginTransaction();
        try {
            $validatedData = Validator::make($request->all(), [
                'Qty' => 'required|integer',
                'ProductID' => 'required|string|exists:tbl_products,ProductID',
                'ProductVariationID' => 'nullable|string|exists:tbl_products_variation,VariationID',
            ]);

            if ($validatedData->fails()) {
                return $this->errorResponse($validatedData->errors(), 'Validation Error', 422);
            }

            $Qty = $request->Qty;
            $ProductID = $request->ProductID;
            $ProductVariationID = $request->ProductVariationID;
            $CustomerID = $customer->CustomerID;

            $cart = CustomerCart::where('CustomerID', $CustomerID)
                ->where('ProductID', $ProductID);
            if (isset($ProductVariationID)){
                $updated = $cart->where('ProductVariationID', $ProductVariationID)->update(["Qty" => $Qty]);
            } else {
                $updated = $cart->where('ProductVariationID', null)->update(["Qty" => $Qty]);
            }
            DB::commit();
            if ($updated) {
                return $this->successResponse([], "Product Update Successfully");
            } else {
                return $this->errorResponse([], "Product not exists!", 422);
            }
        }catch(Exception $e) {
            logger($e);
            DB::rollback();
            return response()->json([
                'status' => false,
                'message' => "Product Update Failed!",
            ]);
        }
    }

    public function DeleteCart(Request $request): JsonResponse
    {
        $customer = $request->auth_customer;
        DB::beginTransaction();
        try {
            $validatedData = Validator::make($request->all(), [
                'ProductID' => 'required|string|exists:tbl_products,ProductID',
                'ProductVariationID' => 'nullable|string|exists:tbl_products_variation,VariationID',
            ]);

            if ($validatedData->fails()) {
                return $this->errorResponse($validatedData->errors(), 'Validation Error', 422);
            }

            $ProductID = $request->ProductID;
            $ProductVariationID = $request->ProductVariationID;
            $CustomerID = $customer->CustomerID;

            $cart = CustomerCart::where('CustomerID', $CustomerID)
                ->where('ProductID', $ProductID);
            if (isset($ProductVariationID)){
                $deleted = $cart->where('ProductVariationID', $ProductVariationID)->delete();
            } else {
                $deleted = $cart->where('ProductVariationID', null)->delete();
            }
            DB::commit();
            if ($deleted) {
                return $this->successResponse([], "Product Deleted Successfully");
            } else {
                return $this->errorResponse([], "This Product was not listed in your cart", 422);
            }
        } catch (Exception $e) {
            logger($e);
            DB::rollBack();
            return $this->errorResponse($e, "Product Deleted Failed!", 422);
        }
    }

    public function getSAddress(Request $req){
        $customer = $req->auth_customer;
        $CustomerID = $customer->CustomerID;
        $SAddress = DB::table('tbl_customer_address as CA')->where('CA.CustomerID',$CustomerID)->where('CA.DFlag',0)
            ->leftJoin($this->generalDB.'tbl_postalcodes as PC', 'PC.PID', 'CA.PostalCodeID')
            ->leftJoin($this->generalDB.'tbl_cities as CI', 'CI.CityID', 'CA.CityID')
            ->leftJoin($this->generalDB.'tbl_districts as D', 'D.DistrictID', 'PC.DistrictID')
            ->leftJoin($this->generalDB.'tbl_states as S', 'S.StateID', 'D.StateID')
            ->leftJoin($this->generalDB.'tbl_countries as C','C.CountryID','S.CountryID')
            ->orderBy('CA.CreatedOn','desc')
            ->select('CA.AID', 'CA.ReceiverName', 'CA.ReceiverEmail', 'CA.ReceiverMobile', 'CA.Address', 'CA.isDefault', 'CA.StateID', 'S.StateName', 'CA.DistrictID', 'D.DistrictName', 'CA.CityID', 'CI.CityName', 'CA.PostalCodeID', 'PC.PostalCode', 'CA.CompleteAddress','CA.AddressType')
            ->get();

        return response()->json(['status' => true,'data' => $SAddress]);
    }
    public function createSAddress(Request $req){
        $customer = $req->auth_customer;
        $CustomerID = $customer->CustomerID;
        $OldData=$NewData=[];
        $OldData=DB::table('tbl_customer_address')->where('CustomerID',$CustomerID)->get();
        $status=false;
        try {
            $validatedData = Validator::make($req->all(), [
                'ReceiverName' => 'required|string',
                'ReceiverEmail' => 'required|email',
                'ReceiverMobile' => 'required|string',
                'AddressType' => 'required|string',
                'PostalCodeID' => 'required|exists:'.$this->generalDB.'tbl_postalcodes,PID',
                'CityID' => 'required|exists:'.$this->generalDB.'tbl_cities,CityID',
                'DistrictID' => 'required|exists:'.$this->generalDB.'tbl_districts,DistrictID',
                'StateID' => 'required|exists:'.$this->generalDB.'tbl_states,StateID',
            ]);

            if ($validatedData->fails()) {
                return $this->errorResponse($validatedData->errors(), 'Validation Error', 422);
            }

            DB::beginTransaction();
                $AID=DocNum::getDocNum(docTypes::CustomerAddress->value,"",Helper::getCurrentFY());
            $city = DB::table($this->generalDB.'tbl_cities')->where('CityID', $req->CityID)->value('CityName');
            $district = DB::table($this->generalDB.'tbl_districts')->where('DistrictID', $req->DistrictID)->value('DistrictName');
            $state = DB::table($this->generalDB.'tbl_states')->where('StateID', $req->StateID)->value('StateName');
            $postalCode = DB::table($this->generalDB.'tbl_postalcodes')->where('PID', $req->PostalCodeID)->value('PostalCode');

            $completeAddress = $req->Address . ', ' . $city . ', ' . $district . ', ' . $state . ', ' . $postalCode;

            $data=array(
                    "AID"=>$AID,
                    "CustomerID"=>$CustomerID,
                    "ReceiverName"=>$req->ReceiverName,
                    "ReceiverEmail"=>$req->ReceiverEmail,
                    "ReceiverMobile"=>$req->ReceiverMobile,
                    "CompleteAddress"=> $completeAddress,
                    "Address"=>$req->Address,
                    "AddressType"=>$req->AddressType,
                    "PostalCodeID"=>$req->PostalCodeID,
                    "CityID"=>$req->CityID,
                    "DistrictID"=>$req->DistrictID,
                    "StateID"=>$req->StateID,
                    "isDefault"=>1,
                    "CreatedOn"=>date("Y-m-d H:i:s")
                );
                $status=DB::Table('tbl_customer_address')->insert($data);
                if($status==true){
                    DB::Table('tbl_customer_address')->where('CustomerID',$CustomerID)->whereNot('AID',$AID)->update(['isDefault' =>0]);
                    DocNum::updateDocNum(docTypes::CustomerAddress->value);
                }
        }catch(Exception $e) {
            logger($e);
            $status=false;
        }
        if($status==true){
            DB::commit();
            $NewData=DB::table('tbl_customer_address')->where('CustomerID',$CustomerID)->get();
            $logData=array("Description"=>"Shipping Address Created","ModuleName"=>"Customer","Action"=>"Update","ReferID"=>$AID,"OldData"=>$OldData,"NewData"=>$NewData,"UserID"=>$CustomerID,"IP"=>$req->ip());
            logs::Store($logData);
            return response()->json(['status' => true,'message' => "Shipping Address Created Successfully"]);
        }else{
            DB::rollback();
            return response()->json(['status' => false,'message' => "Shipping Address Creation Failed"]);
        }
    }

    public function updateSAddress(Request $req)
    {
        $customer = $req->auth_customer;
        $CustomerID = $customer->CustomerID;
        $OldData = $NewData = [];
        $OldData = DB::table('tbl_customer_address')->where('CustomerID', $CustomerID)->get();
        $status = false;
        try {
            $validatedData = Validator::make($req->all(), [
                'AID' => 'required|exists:tbl_customer_address,AID',
                'ReceiverName' => 'required|string',
                'ReceiverEmail' => 'required|email',
                'ReceiverMobile' => 'required|string',
                'AddressType' => 'required|string',
                'PostalCodeID' => 'required|exists:' . $this->generalDB . 'tbl_postalcodes,PID',
                'CityID' => 'required|exists:' . $this->generalDB . 'tbl_cities,CityID',
                'DistrictID' => 'required|exists:' . $this->generalDB . 'tbl_districts,DistrictID',
                'StateID' => 'required|exists:' . $this->generalDB . 'tbl_states,StateID',
            ]);

            if ($validatedData->fails()) {
                return $this->errorResponse($validatedData->errors(), 'Validation Error', 422);
            }

            DB::beginTransaction();
            $city = DB::table($this->generalDB . 'tbl_cities')->where('CityID', $req->CityID)->value('CityName');
            $district = DB::table($this->generalDB . 'tbl_districts')->where('DistrictID', $req->DistrictID)->value('DistrictName');
            $state = DB::table($this->generalDB . 'tbl_states')->where('StateID', $req->StateID)->value('StateName');
            $postalCode = DB::table($this->generalDB . 'tbl_postalcodes')->where('PID', $req->PostalCodeID)->value('PostalCode');

            $completeAddress = $req->Address . ', ' . $city . ', ' . $district . ', ' . $state . ', ' . $postalCode;

            $data = array(
                "CustomerID" => $CustomerID,
                "ReceiverName" => $req->ReceiverName,
                "ReceiverEmail" => $req->ReceiverEmail,
                "ReceiverMobile" => $req->ReceiverMobile,
                "CompleteAddress" => $completeAddress,
                "Address" => $req->Address,
                "AddressType" => $req->AddressType,
                "PostalCodeID" => $req->PostalCodeID,
                "CityID" => $req->CityID,
                "DistrictID" => $req->DistrictID,
                "StateID" => $req->StateID,
                "isDefault" => 1,
                "CreatedOn" => date("Y-m-d H:i:s")
            );
            $status = DB::Table('tbl_customer_address')->where('CustomerID', $CustomerID)->where('AID', $req->AID)->update($data);

            if ($status == true) {
                DB::Table('tbl_customer_address')->where('CustomerID', $CustomerID)->whereNot('AID', $req->AID)->update(['isDefault' => 0]);
            }
        } catch (Exception $e) {
            logger($e);
            $status = false;
        }
        if ($status == true) {
            DB::commit();
            $NewData = DB::table('tbl_customer_address')->where('CustomerID', $CustomerID)->get();
            $logData = array("Description" => "Shipping Address updated", "ModuleName" => "Customer", "Action" => "Update", "ReferID" => $req->AID, "OldData" => $OldData, "NewData" => $NewData, "UserID" => $CustomerID, "IP" => $req->ip());
            logs::Store($logData);
            return response()->json(['status' => true, 'message' => "Shipping Address Updated Successfully"]);
        } else {
            DB::rollback();
            return response()->json(['status' => false, 'message' => "Shipping Address Updation Failed"]);
        }
    }
    public function SetDefault(Request $req){
        $customer = $req->auth_customer;
        $CustomerID = $customer->CustomerID;
        DB::beginTransaction();
        $status=false;
        try {
            $status=DB::Table('tbl_customer_address')->where('CustomerID',$CustomerID)->whereNot('AID',$req->AID)->update(['isDefault' =>0]);
            $status=DB::Table('tbl_customer_address')->where('CustomerID',$CustomerID)->where('AID',$req->AID)->update(['isDefault' =>1,'UpdatedBy'=>$CustomerID,'UpdatedOn'=>date("Y-m-d H:i:s")]);
        }catch(Exception $e) {
            $status=false;
        }
        if($status==true){
            DB::commit();
            DB::Table('tbl_customer_cart')->where('CustomerID',$CustomerID)->delete();
            return response()->json(['status' => true,'message' => "Default Address Set Successfully"]);
        }else{
            DB::rollback();
            return response()->json(['status' => false,'message' => "Default Address Set Failed!"]);
        }
    }

    public function DeleteSAddress(Request $req){
        $customer = $req->auth_customer;
        $CustomerID = $customer->CustomerID;
        DB::beginTransaction();
        $status=false;
        try {
            $isDefault=DB::Table('tbl_customer_address')->where('CustomerID',$CustomerID)->where('AID',$req->AID)->where('isDefault',1)->exists();
            if($isDefault){
                return response()->json(['status' => false,'message' => "Default Address cannot be deleted!"]);
            }else{
                $status=DB::Table('tbl_customer_address')->where('CustomerID',$CustomerID)->where('AID',$req->AID)->update(['DFlag'=>1,'UpdatedBy'=>$CustomerID,'UpdatedOn'=>date('Y-m-d H:i:s')]);
            }
        }catch(Exception $e) {
            $status=false;
        }
        if($status==true){
            DB::commit();
            return response()->json(['status' => true,'message' => "Shipping Address Deleted Successfully"]);
        }else{
            DB::rollback();
            return response()->json(['status' => false,'message' => "Shipping Address Deleted Failed!"]);
        }
    }
}

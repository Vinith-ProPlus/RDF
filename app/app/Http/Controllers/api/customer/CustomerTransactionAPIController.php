<?php

namespace App\Http\Controllers\api\customer;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Redirect;
use DB;
use Auth;
use Helper;
use Laravel\Passport\RefreshToken;
use Laravel\Passport\Token;
use ValidUnique;
use ValidDB;
use DocNum;
use docTypes;
use logs;

class CustomerTransactionAPIController extends Controller{
    private $generalDB;
    private $logDB;
    private $tmpDB;
    private $FileTypes;
	private $UserID;
	private $ReferID;

    public function __construct(){
		$this->generalDB=Helper::getGeneralDB();
		$this->logDB=Helper::getLogDB();
		$this->tmpDB=Helper::getTmpDB();
		$this->FileTypes=Helper::getFileTypes(array("category"=>array("Images","Documents")));
        $this->middleware('auth:api');
        $this->middleware(function ($request, $next) {
			$this->UserID=auth()->user()->UserID;
			$this->ReferID=auth()->user()->ReferID;
			return $next($request);
		});
    }

    public function PlaceOrder(Request $req){
        DB::beginTransaction();
        $status=false;
        $CustomerID=$this->ReferID;
        try {
            $CustomerData = DB::table('tbl_customer')->where('CustomerID',$CustomerID)->first();
            $EnqID = DocNum::getDocNum(docTypes::Enquiry->value,$this->logDB,Helper::getCurrentFY());
            $BuildingImage = "";
            if($req->BuildingImage != null) {
                $dir = "uploads/transaction/enquiry/" . $EnqID . "/";
                if (!file_exists($dir)) {
                    mkdir($dir, 0777, true);
                }
                if ($req->hasFile('BuildingImage')) {
                    $file = $req->file('BuildingImage');
                    $fileName = md5($file->getClientOriginalName() . time());
                    $fileName1 = $fileName . "." . $file->getClientOriginalExtension();
                    $file->move($dir, $fileName1);
                    $BuildingImage = $dir . $fileName1;
                } else if (Helper::isJSON($req->BuildingImage) == true) {
                    $Img = json_decode($req->BuildingImage);
                    if (file_exists($Img->uploadPath)) {
                        $fileName1 = $Img->fileName != "" ? $Img->fileName : Helper::RandomString(10) . "png";
                        copy($Img->uploadPath, $dir . $fileName1);
                        $BuildingImage = $dir . $fileName1;
                        // unlink($Img->uploadPath);
                    }
                }
            }
            $data=[
                'EnqID' => $EnqID,
                'EnqNo' =>DocNum::getInvNo("Quote-Enquiry"),
                'EnqDate' => date('Y-m-d'),
                'EnqExpiryDate' => date('Y-m-d', strtotime('+15 days')),
                'CustomerID' => $CustomerID,
                'ReceiverName' => $req->ReceiverName,
                'ReceiverMobNo' => $req->ReceiverMobNo,
                'ExpectedDeliveryDate' => $req->ExpectedDeliveryDate,
                'Address' => $req->Address,
                'CountryID' => $req->CountryID,
                'StateID' => $req->StateID,
                'DistrictID' => $req->DistrictID,
                'TalukID' => $req->TalukID,
                'CityID' => $req->CityID,
                'PostalCodeID' => $req->PostalCodeID,
                'DAddress' => $req->Address,
                'DCountryID' => $req->CountryID,
                'DStateID' => $req->StateID,
                'DDistrictID' => $req->DistrictID,
                'DTalukID' => $req->TalukID,
                'DCityID' => $req->CityID,
                'DPostalCodeID' => $req->PostalCodeID,
                'StageID' => $req->StageID,
                'BuildingMeasurementID' => $req->BuildingMeasurementID,
                'BuildingMeasurement' => $req->BuildingMeasurement,
                'BuildingImage' => $BuildingImage,
                'CreatedOn' => date('Y-m-d H:i:s'),
                'CreatedBy' => $CustomerID,
            ];
            $status=DB::table($this->logDB.'tbl_enquiry')->insert($data);
            if($status){
                $ProductData = json_decode($req->ProductData,true);
                foreach($ProductData as $item){
                    $EnquiryDetailID = DocNum::getDocNum(docTypes::EnquiryDetails->value,$this->logDB,Helper::getCurrentFY());
                    $data1=[
                        'DetailID' => $EnquiryDetailID,
                        'EnqID'=>$EnqID,
                        'CID'=>$item['PCID'],
                        'SCID'=>$item['PSCID'],
                        'ProductID'=>$item['ProductID'],
                        'Qty'=>$item['Qty'],
                        'UOMID'=>$item['UID'],
                        'CreatedOn'=>date('Y-m-d H:i:s'),
                        'CreatedBy'=>$CustomerID,
                    ];
                    $status = DB::table($this->logDB.'tbl_enquiry_details')->insert($data1);
                    if($status){
                        DocNum::updateDocNum(docTypes::EnquiryDetails->value,$this->logDB);
                    }
                }
                DocNum::updateDocNum(docTypes::Enquiry->value,$this->logDB);
            }
        }catch(Exception $e) {
            $status=false;
        }
        if($status==true){
            DB::commit();
            DocNum::updateInvNo("Quote-Enquiry");
            DB::table('tbl_customer_cart')->where('CustomerID',$CustomerID)->delete();
            return response()->json(['status' => true,'message' => "Order Placed Successfully"]);
        }else{
            DB::rollback();
            return response()->json(['status' => false,'message' => "Order Placing Failed!"]);
        }
    }

    public function getQuoteEnquiry(Request $req){
        $query = DB::table($this->logDB.'tbl_enquiry')->where('CustomerID',$this->ReferID);
        if($req->has('Status')){
            $query->where('Status',$req->Status);
        }
        $QuoteEnq=$query->get();
        
        foreach($QuoteEnq as $quote){
            $quote->ProductData = DB::table($this->logDB.'tbl_enquiry_details')->where('EnqID',$quote->EnqID)->get();
        }
        return response()->json(['status' => true,'data' => $QuoteEnq]);
    }
    

}

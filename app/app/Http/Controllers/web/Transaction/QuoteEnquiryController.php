<?php
namespace App\Http\Controllers\web\Transaction;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Redirect;
use DocNum;
use general;
use SSP;
// use App\Models\ServerSideProcess
use DB;
use Auth;
use Helper;
use ValidUnique;
use logs;
use activeMenuNames;
use docTypes;
use cruds;

class QuoteEnquiryController extends Controller{
	private $general;
	private $UserID;
	private $ActiveMenuName;
	private $PageTitle;
	private $CRUD;
	private $Settings;
    private $Menus;
	private $generalDB;
	private $logDB;

    public function __construct(){
		$this->ActiveMenuName=activeMenuNames::QuoteEnquiry->value;
		$this->PageTitle="Quote Enquiry";
        $this->middleware('auth');    
		$this->middleware(function ($request, $next) {
			$this->UserID=auth()->user()->UserID;
			$this->general=new general($this->UserID,$this->ActiveMenuName);
			$this->Menus=$this->general->loadMenu();
			$this->CRUD=$this->general->getCrudOperations($this->ActiveMenuName);
			$this->Settings=$this->general->getSettings();
			$this->generalDB=Helper::getGeneralDB();
			$this->logDB=Helper::getlogDB();
			return $next($request);
		});
    }
    public function view(Request $req){
        if($this->general->isCrudAllow($this->CRUD,"view")==true){
            $FormData=$this->general->UserInfo;
            $FormData['menus']=$this->Menus;
            $FormData['crud']=$this->CRUD;
			$FormData['ActiveMenuName']=$this->ActiveMenuName;
			$FormData['PageTitle']=$this->PageTitle;
            return view('app.transaction.quote-enquiry.view',$FormData);
        }elseif($this->general->isCrudAllow($this->CRUD,"add")==true){
			return Redirect::to('admin/transaction/quote-enquiry/create');
        }else{
            return view('errors.403');
        }
    }
    public function TrashView(Request $req){
        if($this->general->isCrudAllow($this->CRUD,"restore")==true){
            $FormData=$this->general->UserInfo;
            $FormData['menus']=$this->Menus;
            $FormData['crud']=$this->CRUD;
			$FormData['ActiveMenuName']=$this->ActiveMenuName;
			$FormData['PageTitle']=$this->PageTitle;
            return view('app.transaction.quote-enquiry.trash',$FormData);
        }elseif($this->general->isCrudAllow($this->CRUD,"view")==true){
			return Redirect::to('admin/transaction/quote-enquiry/');
        }else{
            return view('errors.403');
        }
    }

    public function create(Request $req){
        if($this->general->isCrudAllow($this->CRUD,"add")==true){
            $FormData=$this->general->UserInfo;
            $FormData['menus']=$this->Menus;
            $FormData['crud']=$this->CRUD;
			$FormData['ActiveMenuName']=$this->ActiveMenuName;
			$FormData['PageTitle']=$this->PageTitle;
			$FormData['isEdit']=false;
			$FormData['QNo']=DocNum::getInvNo($this->ActiveMenuName);
            return view('app.transaction.quote-enquiry.quote',$FormData);
        }elseif($this->general->isCrudAllow($this->CRUD,"view")==true){
            return Redirect::to('/admin/transaction/quote-enquiry/');
        }else{
            return view('errors.403');
        }
    }
    public function edit(Request $req,$QID){
        if($this->general->isCrudAllow($this->CRUD,"edit")==true){
            $FormData=$this->general->UserInfo;
            $FormData['menus']=$this->Menus;
            $FormData['crud']=$this->CRUD;
			$FormData['ActiveMenuName']=$this->ActiveMenuName;
			$FormData['PageTitle']=$this->PageTitle;
			$FormData['isEdit']=true;
			$FormData['EditData']=DB::Table('tbl_quotation')->where('DFlag',0)->Where('QID',$QID)->get();
			if(count($FormData['EditData'])>0){
				return view('app.transaction.quote-enquiry.quote',$FormData);
			}else{
				return view('errors.403');
			}
        }elseif($this->general->isCrudAllow($this->CRUD,"view")==true){
            return Redirect::to('admin/transaction/quote-enquiry/');
        }else{
            return view('errors.403');
        }
    }
    public function QuoteView(Request $req,$EnqID){
        if($this->general->isCrudAllow($this->CRUD,"edit")==true){
            $FormData=$this->general->UserInfo;
            $FormData['menus']=$this->Menus;
            $FormData['crud']=$this->CRUD;
			$FormData['ActiveMenuName']=$this->ActiveMenuName;
			$FormData['PageTitle']=$this->PageTitle;
			$FormData['isEdit']=false;
			$FormData['Settings']=$this->Settings;
			$EnqData=DB::Table($this->logDB.'tbl_enquiry as E')
			->join($this->generalDB.'tbl_countries as C','C.CountryID','E.CountryID')
			->join($this->generalDB.'tbl_states as S', 'S.StateID', 'E.StateID')
			->join($this->generalDB.'tbl_districts as D', 'D.DistrictID', 'E.DistrictID')
			->join($this->generalDB.'tbl_taluks as T', 'T.TalukID', 'E.TalukID')
			->join($this->generalDB.'tbl_cities as CI', 'CI.CityID', 'E.CityID')
			->join($this->generalDB.'tbl_postalcodes as PC', 'PC.PID', 'E.PostalCodeID')
			->join($this->generalDB.'tbl_countries as DC','DC.CountryID','E.DCountryID')
			->join($this->generalDB.'tbl_states as DS', 'DS.StateID', 'E.DStateID')
			->join($this->generalDB.'tbl_districts as DD', 'DD.DistrictID', 'E.DDistrictID')
			->join($this->generalDB.'tbl_taluks as DT', 'DT.TalukID', 'E.DTalukID')
			->join($this->generalDB.'tbl_cities as DCI', 'DCI.CityID', 'E.DCityID')
			->join($this->generalDB.'tbl_postalcodes as DPC', 'DPC.PID', 'E.DPostalCodeID')
			->join('tbl_customer as CU', 'CU.CustomerID', 'E.CustomerID')
			->whereNot('E.Status','Cancelled')->Where('E.EnqID',$EnqID)
			->select('EnqID','EnqNo','EnqDate','VendorIDs','Status','ReceiverName','ReceiverMobNo','ExpectedDeliveryDate','CU.Email','DPostalCodeID','E.PostalCodeID','E.Address','C.CountryName','S.StateName','D.DistrictName','T.TalukName','CI.CityName','PC.PostalCode','DAddress','DC.CountryName as DCountryName','DS.StateName as DStateName','DD.DistrictName as DDistrictName','DT.TalukName as DTalukName','DCI.CityName as DCityName','DPC.PostalCode as DPostalCode')
			->first();
			$FormData['EnqData']=$EnqData;
			if($EnqData){
				$VendorQuote = [];
				$AllocatedEnqData = [];
				$PData=DB::table($this->logDB.'tbl_enquiry_details as ED')->join('tbl_products as P','P.ProductID','ED.ProductID')->join('tbl_uom as UOM','UOM.UID','ED.UOMID')->where('ED.EnqID',$EnqID)->select('ED.ProductID','ED.CID','ED.SCID','ED.Qty','P.ProductName','UOM.UID','UOM.UName','UOM.UCode')->get();
				if(count($PData) > 0){
					foreach($PData as $row){
						$row->AvailableVendors=[];
						$AllVendors = DB::table('tbl_vendors as V')->join('tbl_vendors_service_locations as VSL','V.VendorID','VSL.VendorID')->leftJoin('tbl_vendor_ratings as VR','VR.VendorID','V.VendorID')->where('V.ActiveStatus',"Active")->where('V.isApproved',1)->where('V.DFlag',0)->where('VSL.PostalCodeID',$FormData['EnqData']->DPostalCodeID)->select('V.VendorID','V.VendorName','VR.OverAll')->get();
						if(count($AllVendors)>0){
							foreach($AllVendors as $item){
								$isProductAvailable= DB::Table('tbl_vendors_product_mapping')->where('Status',1)->Where('VendorID',$item->VendorID)->where('ProductID',$row->ProductID)->first();
									if($isProductAvailable){
										$row->AvailableVendors[] = [
											"VendorID" => $item->VendorID,
											"VendorName" => $item->VendorName,
											"OverAll" => $item->OverAll,
											"ProductID" => $isProductAvailable->ProductID,
										];
									}
							}
						}
					}
				}
				if($EnqData->Status == "Quote Requested" && $EnqData->VendorIDs && count(unserialize($EnqData->VendorIDs)) > 0){
					$VendorIDs = unserialize($FormData['EnqData']->VendorIDs);
					// $VendorQuote = DB::Table($this->logDB.'tbl_vendor_quotation_details as VQD')->join($this->logDB.'tbl_vendor_quotation as VQ','VQ.VQuoteID','VQD.VQuoteID')->join('tbl_vendors as V','V.VendorID','VQ.VendorID')/* ->where('VQ.Status','Sent')->where('VQD.Status','Price Sent') */->select('ProductID','VQ.VendorID','Amount','V.VendorName','VQ.VQuoteID','VQD.DetailID')->get();
					$VendorQuote = DB::Table($this->logDB.'tbl_vendor_quotation as VQ')->join('tbl_vendors as V','V.VendorID','VQ.VendorID')/* ->where('VQ.Status','Sent') */->where('VQ.EnqID',$EnqID)->select('VQ.VendorID','V.VendorName','VQ.VQuoteID','VQ.Status')->get();
					foreach($VendorQuote as $row){
						$row->ProductData = DB::table($this->logDB.'tbl_vendor_quotation_details as VQD')->where('VQuoteID',$row->VQuoteID)
						->select('DetailID','ProductID','Price','VQuoteID')
						->get();
						/* if(!$isQIDExists){
							$QuoteSentID = DocNum::getDocNum(docTypes::QuoteSent->value, $this->logDB);
							$totalTaxable = 0;
							$totalTaxAmount = 0;
							$totalCGST = 0;
							$totalSGST = 0;
							$totalIGST = 0;
							$totalQuoteValue = 0;
							$data = [
								"QuoteSentID" => $QuoteSentID,
								"QuoteReqID" => $ReqEnqData[0]->QuoteReqID,
								"QID" => $ReqEnqData[0]->QID,
								"VendorID" => $ReqEnqData[0]->VendorID,
								"Date" => date('Y-m-d'),
								"CreatedBy" => $this->UserID,
								"CreatedOn" => date("Y-m-d H:i:s"),
							];
							$status = DB::table($this->logDB . 'tbl_quotation_sent')->insert($data);
							if ($status) {
								foreach ($ReqEnqData as $item) {
									$ProductDetails = DB::table($this->logDB . 'tbl_vendors_product_mapping as VPM')->join('tbl_products as P', 'P.ProductID', 'VPM.ProductID')->join('tbl_tax as T', 'T.TaxID', 'P.TaxID')->where('VPM.ProductID', $item->ProductID)->where('VPM.Status', 1)->select('VPM.VendorPrice', 'P.TaxType', 'T.TaxPercentage','P.TaxID')->first();
									$Amt = $item->Qty * $ProductDetails->VendorPrice;
									if($ProductDetails->TaxType == 'Include'){
										$taxAmount =  $Amt * ($ProductDetails->TaxPercentage / 100);
										$taxableAmount = $Amt - $taxAmount;
									}else{
										$taxAmount =  $Amt * ($ProductDetails->TaxPercentage / 100);
										$taxableAmount = $Amt;
									}
		
									$cgstPercentage = $sgstPercentage = $ProductDetails->TaxPercentage / 2;
		
									$cgstAmount = $taxAmount / 2;
									$sgstAmount = $taxAmount / 2;
		
									$totalAmount = $taxableAmount + $taxAmount;
		
									$totalTaxable += $taxableAmount;
									$totalTaxAmount += $taxAmount;
									$totalCGST += $cgstAmount;
									$totalSGST += $sgstAmount;
									$totalQuoteValue += $totalAmount;
								
									$DetailID = DocNum::getDocNum(docTypes::QuoteSentDetails->value, $this->logDB);
									$data1 = [
										"DetailID" => $DetailID,
										"QuoteSentID" => $QuoteSentID,
										"ProductID" => $item->ProductID,
										"CID" => $item->CID,
										"SCID" => $item->SCID,
										"UOMID" => $item->UOMID,
										"TaxID" => $ProductDetails->TaxID,
										"TaxType" => $ProductDetails->TaxType,
										"Qty" => $item->Qty,
										"Price" => $ProductDetails->VendorPrice,
										"TaxAmount" => $taxAmount,
										"Taxable" => $taxableAmount,
										"CGSTPer" => $cgstPercentage,
										"SGSTPer" => $sgstPercentage,
										"CGSTAmount" => $cgstAmount,
										"SGSTAmount" => $sgstAmount,
										"Amount" => $totalAmount,
									];
								
									$status = DB::table($this->logDB . 'tbl_quotation_sent_details')->insert($data1);
								
									if ($status) {
										DocNum::updateDocNum(docTypes::QuoteSentDetails->value, $this->logDB);
									}
								}
								
								DB::table($this->logDB . 'tbl_quotation_sent')->where('QuoteSentID', $QuoteSentID)->update([
									'SubTotal' => $totalTaxable,
									'TaxAmt' => $totalTaxAmount,
									'CGSTAmt' => $totalCGST,
									'SGSTAmt' => $totalSGST,
									'IGSTAmt' => $totalIGST,
									'TotalAmount' => $totalQuoteValue,
								]);
								DocNum::updateDocNum(docTypes::QuoteSent->value, $this->logDB);
							}
						} */
					}
				}/* elseif($EnqData->Status == "Allocated"){
					$AllocatedEnqData = DB::Table($this->logDB.'tbl_quotation_details as QD')->join($this->logDB.'tbl_quotation as Q','E.QID','QD.QID')->join('tbl_vendors as V','V.VendorID','QD.VendorID')->join('tbl_products as P','P.ProductID','QD.ProductID')->join('tbl_uom as UOM','UOM.UID','QD.UOMID')->where('QD.QID',$QID)->get();
				} */
				
				$FormData['PData'] = $PData;
				$FormData['VendorQuote'] = $VendorQuote;
				$FormData['AllocatedEnqData'] = $AllocatedEnqData;
				// return $FormData['VendorQuote'];	
				return view('app.transaction.quote-enquiry.quote-view', $FormData);
			}else{
				return view('errors.403');
			}
        }elseif($this->general->isCrudAllow($this->CRUD,"view")==true){
            return Redirect::to('admin/transaction/quote-enquiry/');
        }else{
            return view('errors.403');
        }
    }

    public function RequestQuote(Request $req,$EnqID){
		if($this->general->isCrudAllow($this->CRUD,"add")==true){
			$OldData=$NewData=[];
			DB::beginTransaction();
			$status=false;
			try {
				DB::beginTransaction();
				$SelectedVendors = json_decode($req->SelectedVendors, true);
				foreach ($SelectedVendors as $VendorID) {
					$status = DB::statement("CREATE TABLE IF NOT EXISTS {$this->logDB}tbl_vendor_quotation (
						`VQuoteID` VARCHAR(50) PRIMARY KEY,
						`VendorID` VARCHAR(50) NULL,
						`EnqID` VARCHAR(50) NULL,
						`QReqOn` DATE,
						`QReqBy` VARCHAR(50) NULL,
						`QSentOn` DATE,
						`QSelectedOn` DATE,
						`QSelectedBy` VARCHAR(50) NULL,
						`Status` enum('Requested','Sent','Selected') DEFAULT 'Requested',
						`CreatedOn` timestamp NOT NULL DEFAULT current_timestamp(),
						`CreatedBy` VARCHAR(50) NULL,
						`UpdatedOn` timestamp DEFAULT NULL,
						`UpdatedBy` varchar(50) DEFAULT NULL
					)");
					$status = DB::statement("CREATE TABLE IF NOT EXISTS {$this->logDB}tbl_vendor_quotation_details (
						`DetailID` varchar(50) PRIMARY KEY,
						`VQuoteID` varchar(50) DEFAULT NULL,
						`CID` varchar(50) DEFAULT NULL,
						`SCID` varchar(50) DEFAULT NULL,
						`ProductID` varchar(50) DEFAULT NULL,
						`Description` text DEFAULT NULL,
						`Qty` double DEFAULT 0,
						`Price` double DEFAULT NULL,
						`UOMID` varchar(50) DEFAULT NULL,
						`TaxType` enum('Exclude','Include') DEFAULT NULL,
						`TaxID` varchar(50) DEFAULT NULL,
						`TaxPer` double DEFAULT 0,
						`Taxable` double NOT NULL DEFAULT 0,
						`DiscountType` varchar(50) DEFAULT NULL,
						`DiscountPer` double NOT NULL DEFAULT 0,
						`DiscountAmount` double NOT NULL DEFAULT 0,
						`TaxAmount` double NOT NULL DEFAULT 0,
						`CGSTPer` double NOT NULL DEFAULT 0,
						`SGSTPer` double DEFAULT 0,
						`IGSTPer` double NOT NULL DEFAULT 0,
						`CGSTAmount` double NOT NULL DEFAULT 0,
						`SGSTAmount` double NOT NULL DEFAULT 0,
						`IGSTAmount` double NOT NULL DEFAULT 0,
						`Amount` double NOT NULL DEFAULT 0,
						`Status` enum('Selected','Rejected') DEFAULT NULL,
						`SelectedBy` VARCHAR(50) NULL,
						`SelectedOn` DATE,
						`CreatedOn` timestamp NOT NULL DEFAULT current_timestamp(),
						`CreatedBy` varchar(50) DEFAULT NULL,
						`UpdatedOn` timestamp DEFAULT NULL,
						`UpdatedBy` varchar(50) DEFAULT NULL
					)");
					$isQuoteRequested =  DB::table($this->logDB . 'tbl_vendor_quotation')->where('VendorID',$VendorID)->where('EnqID',$EnqID)->first();
					if(!$isQuoteRequested){
						$VQuoteID = DocNum::getDocNum(docTypes::VendorQuotation->value, $this->logDB,Helper::getCurrentFy());
						$data = [
							"VQuoteID" => $VQuoteID,
							"EnqID" => $EnqID,
							"VendorID" => $VendorID,
							"QReqOn" => date('Y-m-d'),
							"QReqBy" => $this->UserID,
							"CreatedBy" => $this->UserID,
							"CreatedOn" => date("Y-m-d H:i:s"),
						];
						$status = DB::table($this->logDB . 'tbl_vendor_quotation')->insert($data);
						if ($status) {
							$ProductDetails = json_decode($req->ProductDetails);
							foreach ($ProductDetails as $item) {
								$isProductMapped = DB::table('tbl_vendors_product_mapping')->where('ProductID', $item->ProductID)->where('VendorID', $VendorID)->where('Status', 1)->exists();
								if ($isProductMapped) {
									$DetailID = DocNum::getDocNum(docTypes::VendorQuotationDetails->value, $this->logDB, Helper::getCurrentFy());
									$data1 = [
										"DetailID" => $DetailID,
										"VQuoteID" => $VQuoteID,
										"ProductID" => $item->ProductID,
										"CID" => $item->PCID,
										"SCID" => $item->PSCID,
										"UOMID" => $item->UOMID,
										"Qty" => $item->Qty,
									];
									$status = DB::table($this->logDB . 'tbl_vendor_quotation_details')->insert($data1);
									if ($status) {
										DocNum::updateDocNum(docTypes::VendorQuotationDetails->value, $this->logDB);
									}
								}
							}
							DocNum::updateDocNum(docTypes::VendorQuotation->value, $this->logDB);
						}
					}
				}
				$status = DB::table($this->logDB.'tbl_enquiry')->where('EnqID',$EnqID)->update(['Status'=>'Quote Requested','VendorIDs'=>serialize($SelectedVendors),"UpdatedBy"=>$this->UserID,"UpdatedOn"=>date("Y-m-d H:i:s")]);
			}catch(Exception $e) {
				$status=false;
			}
			if($status==true){
				DB::commit();
				$NewData=DB::table($this->logDB.'tbl_vendor_quotation as VQ')->join($this->logDB.'tbl_vendor_quotation_details as VQD','VQD.VQuoteID','VQ.VQuoteID')->where('VQ.EnqID',$EnqID)->get();
				$logData=array("Description"=>"Quotation Request Sent","ModuleName"=>$this->ActiveMenuName,"Action"=>cruds::ADD->value,"ReferID"=>$EnqID,"OldData"=>$OldData,"NewData"=>$NewData,"UserID"=>$this->UserID,"IP"=>$req->ip());
				logs::Store($logData);
				return array('status'=>true,'message'=>"Quotation Request Sent Successfully");
			}else{
				DB::rollback();
				return array('status'=>false,'message'=>"Quotation Request Failed");
			}
		}else{
			return array('status'=>false,'message'=>'Access denined');
		}
	}
	
    public function QuoteConvert(Request $req,$EnqID){
		if($this->general->isCrudAllow($this->CRUD,"edit")==true){
			$OldData=array();$NewData=array();
			try {
				$status = DB::statement("CREATE TABLE IF NOT EXISTS {$this->logDB}`tbl_quotation` (
					`QID` varchar(50) PRIMARY KEY NOT NULL,
					`EnqID` varchar(50) DEFAULT NULL,
					`QNo` varchar(50) DEFAULT NULL,
					`QDate` date DEFAULT NULL,
					`QExpiryDate` date DEFAULT NULL,
					`CustomerID` varchar(50) DEFAULT NULL,
					`ReceiverName` varchar(150) DEFAULT NULL,
					`ReceiverMobNo` varchar(15) DEFAULT NULL,
					`ExpectedDeliveryDate` date DEFAULT NULL,
					`Remarks` text DEFAULT NULL,
					`Address` text DEFAULT NULL,
					`CountryID` varchar(50) DEFAULT NULL,
					`StateID` varchar(50) DEFAULT NULL,
					`DistrictID` varchar(50) DEFAULT NULL,
					`TalukID` varchar(50) DEFAULT NULL,
					`CityID` varchar(50) DEFAULT NULL,
					`PostalCodeID` varchar(50) DEFAULT NULL,
					`DAddress` varchar(50) DEFAULT NULL,
					`DCountryID` varchar(50) DEFAULT NULL,
					`DStateID` varchar(50) DEFAULT NULL,
					`DDistrictID` varchar(50) DEFAULT NULL,
					`DTalukID` varchar(50) DEFAULT NULL,
					`DCityID` varchar(50) DEFAULT NULL,
					`DPostalCodeID` varchar(50) DEFAULT NULL,
					`Status` enum('New','Quote Requested','Quote Received','Allocated','Cancelled') NOT NULL DEFAULT 'New',
					`VendorID` varchar(50) DEFAULT NULL,
					`AllocationDate` date DEFAULT NULL,
					`VendorIDs` text DEFAULT NULL,
					`TaxAmt` double DEFAULT 0,
					`SubTotal` double NOT NULL DEFAULT 0,
					`DiscountType` varchar(50) DEFAULT NULL,
					`DiscountPer` double NOT NULL DEFAULT 0,
					`DiscountAmount` double NOT NULL DEFAULT 0,
					`CGSTAmt` double NOT NULL DEFAULT 0,
					`SGSTAmt` double NOT NULL DEFAULT 0,
					`IGSTAmt` double NOT NULL DEFAULT 0,
					`TotalAmount` double NOT NULL DEFAULT 0,
					`DFlag` int(1) DEFAULT 0,
					`CreatedOn` timestamp NOT NULL DEFAULT current_timestamp(),
					`UpdatedOn` timestamp NULL DEFAULT NULL,
					`DeletedOn` timestamp NULL DEFAULT NULL,
					`CreatedBy` varchar(50) DEFAULT NULL,
					`UpdatedBy` varchar(50) DEFAULT NULL,
					`DeletedBy` varchar(50) DEFAULT NULL
				)");

				$status = DB::statement("CREATE TABLE IF NOT EXISTS {$this->logDB}`tbl_quotation_details` (
					`DetailID` varchar(50) PRIMARY KEY NOT NULL,
					`QID` varchar(50) DEFAULT NULL,
					`CID` varchar(50) DEFAULT NULL,
					`SCID` varchar(50) DEFAULT NULL,
					`ProductID` varchar(50) DEFAULT NULL,
					`Description` text DEFAULT NULL,
					`Qty` double DEFAULT 0,
					`Price` double DEFAULT NULL,
					`UOMID` varchar(50) DEFAULT NULL,
					`TaxType` varchar(50) DEFAULT NULL,
					`TaxID` varchar(50) DEFAULT NULL,
					`TaxPer` double DEFAULT 0,
					`Taxable` double NOT NULL DEFAULT 0,
					`DiscountType` varchar(50) DEFAULT NULL,
					`DiscountPer` double NOT NULL DEFAULT 0,
					`DiscountAmount` double NOT NULL DEFAULT 0,
					`TaxAmount` double NOT NULL DEFAULT 0,
					`CGSTPer` double NOT NULL DEFAULT 0,
					`SGSTPer` double DEFAULT 0,
					`IGSTPer` double NOT NULL DEFAULT 0,
					`CGSTAmount` double NOT NULL DEFAULT 0,
					`SGSTAmount` double NOT NULL DEFAULT 0,
					`IGSTAmount` double NOT NULL DEFAULT 0,
					`Amount` double NOT NULL DEFAULT 0,
					`VendorID` varchar(50) DEFAULT NULL,
					`CreatedOn` timestamp NOT NULL DEFAULT current_timestamp(),
					`CreatedBy` varchar(50) DEFAULT NULL,
					`UpdatedOn` timestamp NULL DEFAULT NULL,
					`UpdatedBy` varchar(50) DEFAULT NULL
				)");
				$EnqData = DB::table($this->logDB.'tbl_enquiry_details as ED')->join($this->logDB.'tbl_enquiry as E','E.EnqID','ED.EnqID')->where('ED.EnqID',$EnqID)->get();
				
				$isEnqIDExists = DB::table($this->logDB.'tbl_quotation')->where('EnqID',$EnqID)->exists();
				if(!$isEnqIDExists){
					$QID = DocNum::getDocNum(docTypes::Quotation->value, $this->logDB,Helper::getCurrentFy());
					$data=[
						'QID' => $QID,
						'EnqID' => $EnqID,
						'QNo' =>DocNum::getInvNo("Quotation"),
						'QDate' => date('Y-m-d'),
						'QExpiryDate' => date('Y-m-d', strtotime('+15 days')),
						'CustomerID' => $EnqData[0]->CustomerID,
						'ReceiverName' => $EnqData[0]->ReceiverName,
						'ReceiverMobNo' => $EnqData[0]->ReceiverMobNo,
						'ExpectedDeliveryDate' => $EnqData[0]->ExpectedDeliveryDate,
						'Address' => $EnqData[0]->Address,
						'CountryID' => $EnqData[0]->CountryID,
						'StateID' => $EnqData[0]->StateID,
						'DistrictID' => $EnqData[0]->DistrictID,
						'TalukID' => $EnqData[0]->TalukID,
						'CityID' => $EnqData[0]->CityID,
						'PostalCodeID' => $EnqData[0]->PostalCodeID,
						'DAddress' => $EnqData[0]->DAddress,
						'DCountryID' => $EnqData[0]->DCountryID,
						'DStateID' => $EnqData[0]->DStateID,
						'DDistrictID' => $EnqData[0]->DDistrictID,
						'DTalukID' => $EnqData[0]->DTalukID,
						'DCityID' => $EnqData[0]->DCityID,
						'DPostalCodeID' => $EnqData[0]->DPostalCodeID,
						'CreatedOn' => date('Y-m-d'),
						'CreatedBy' => $this->UserID,
					];
					$status=DB::table($this->logDB.'tbl_quotation')->insert($data);
					if($status){
						foreach($EnqData as $item){
							$QuotationDetailID = DocNum::getDocNum(docTypes::QuotationDetails->value, $this->logDB,Helper::getCurrentFy());
							$data1=[
								'DetailID' => $QuotationDetailID,
								'QID'=>$QID,
								'CID'=>$item->CID,
								'SCID'=>$item->SCID,
								'ProductID'=>$item->ProductID,
								'Qty'=>$item->Qty,
								'UOMID'=>$item->UOMID,
								'CreatedOn'=>date('Y-m-d'),
								'CreatedBy'=>$this->UserID,
							];
							$status = DB::table($this->logDB.'tbl_quotation_details')->insert($data1);
							if($status){
								DocNum::updateDocNum(docTypes::QuotationDetails->value);
							}
						}
						DocNum::updateDocNum(docTypes::Quotation->value);
					}
				}
				$status = DB::table($this->logDB.'tbl_enquiry')->where('EnqID',$EnqID)->update(['Status'=>'Converted to Quotation','UpdatedOn'=>date('Y-m-d'),'UpdatedBy'=>$this->UserID]);

			}catch(Exception $e) {
				$status=false;
			}
			if($status==true){
				DB::commit();
				$NewData=DB::table('tbl_quotation')->get();
				$logData=array("Description"=>"Quotation Allocated","ModuleName"=>$this->ActiveMenuName,"Action"=>cruds::UPDATE->value,"ReferID"=>$QID,"OldData"=>$OldData,"NewData"=>$NewData,"UserID"=>$this->UserID,"IP"=>$req->ip());
				logs::Store($logData);
				return array('status'=>true,'message'=>"Quotation Allocated Successfully");
			}else{
				DB::rollback();
				return array('status'=>false,'message'=>"Quotation Allocate Failed");
			}
		}else{
			return array('status'=>false,'message'=>'Access denined');
		}
	}
	
	public function Delete(Request $req,$QID){
		$OldData=$NewData=array();
		if($this->general->isCrudAllow($this->CRUD,"delete")==true){
			DB::beginTransaction();
			$status=false;
			try{
				$OldData=DB::table('tbl_quotation')->where('QID',$QID)->get();
				$status=DB::table('tbl_quotation')->where('QID',$QID)->update(array("Status"=>"Cancelled","DeletedBy"=>$this->UserID,"DeletedOn"=>date("Y-m-d H:i:s")));
			}catch(Exception $e) {
				
			}
			if($status==true){
				DB::commit();
				$logData=array("Description"=>"Quotation has been Cancelled ","ModuleName"=>$this->ActiveMenuName,"Action"=>cruds::DELETE->value,"ReferID"=>$QID,"OldData"=>$OldData,"NewData"=>$NewData,"UserID"=>$this->UserID,"IP"=>$req->ip());
				logs::Store($logData);
				return array('status'=>true,'message'=>"Quotation Cancelled Successfully");
			}else{
				DB::rollback();
				return array('status'=>false,'message'=>"Quotation Cancelled Failed");
			}
		}else{
			return response(array('status'=>false,'message'=>"Access Denied"), 403);
		}
	}
	public function Restore(Request $req,$QID){
		$OldData=$NewData=array();
		if($this->general->isCrudAllow($this->CRUD,"restore")==true){
			DB::beginTransaction();
			$status=false;
			try{
				$OldData=DB::table('tbl_quotation')->where('QID',$QID)->get();
				$status=DB::table('tbl_quotation')->where('QID',$QID)->update(array("Status"=>"New","UpdatedBy"=>$this->UserID,"UpdatedOn"=>date("Y-m-d H:i:s")));
			}catch(Exception $e) {
				
			}
			if($status==true){
				DB::commit();
				$NewData=DB::table('tbl_quotation')->where('QID',$QID)->get();
				$logData=array("Description"=>"Quotation has been Restored ","ModuleName"=>$this->ActiveMenuName,"Action"=>cruds::RESTORE->value,"ReferID"=>$QID,"OldData"=>$OldData,"NewData"=>$NewData,"UserID"=>$this->UserID,"IP"=>$req->ip());
				logs::Store($logData);
				return array('status'=>true,'message'=>"Quotation Restored Successfully");
			}else{
				DB::rollback();
				return array('status'=>false,'message'=>"Quotation Restore Failed");
			}
		}else{
			return response(array('status'=>false,'message'=>"Access Denied"), 403);
		}
	}

	public function TableView(Request $request){
		if($this->general->isCrudAllow($this->CRUD,"view")==true){
			$columns = array(
				array( 'db' => 'EnqNo', 'dt' => '0' ),
				array( 'db' => 'EnqDate', 'dt' => '1','formatter' => function( $d, $row ) {return date($this->Settings['DATE-FORMAT'],strtotime($d));}),
				array( 'db' => 'ReceiverName', 'dt' => '2' ),
				array( 'db' => 'ReceiverMobNo', 'dt' => '3' ),
				array( 'db' => 'ExpectedDeliveryDate', 'dt' => '4','formatter' => function( $d, $row ) {return date($this->Settings['DATE-FORMAT'],strtotime($d));}),
				array( 'db' => 'CustomerID', 'dt' => '5',
					'formatter' => function( $d, $row ) {
						return DB::table('tbl_customer')->where('CustomerID',$d)->value('Email');
					} 
				),
				array( 'db' => 'Status','dt' => '6',
					'formatter' => function( $d, $row ) {
						$html = "";
						if($d=="New"){
							$html="<span class='badge badge-info m-1'>".$d."</span>";
						}elseif($d=="Allocated"){
							$html="<span class='badge badge-secondary m-1'>".$d."</span>";
						}elseif($d=="Quote Requested"){
							$html="<span class='badge badge-success m-1'>".$d."</span>";
						}
						return $html;
					} 
				),
				array( 
						'db' => 'EnqID', 
						'dt' => '7',
						'formatter' => function( $d, $row ) {
							$html='';
							/* if($this->general->isCrudAllow($this->CRUD,"edit")==true){
								$html.='<button type="button" data-id="'.$d.'" class="btn  btn-outline-success '.$this->general->UserInfo['Theme']['button-size'].'  mr-10 btnEdit" data-original-title="Edit"><i class="fa fa-pencil"></i></button>';
							} */
							if($this->general->isCrudAllow($this->CRUD,"view")==true){
								// $html.='<button type="button" data-id="'.$d.'" class="btn  btn-outline-info '.$this->general->UserInfo['Theme']['button-size'].'  mr-10 btnView" data-original-title="View Quotation"><i class="fa fa-eye"></i></button>';
								$html.='<button type="button" data-id="'.$d.'" class="btn btn-outline-info '.$this->general->UserInfo['Theme']['button-size'].'  mr-10 btnView">View Enquiry</button>';
							}
							if($this->general->isCrudAllow($this->CRUD,"delete")==true && $row['Status'] !== "Allocated"){
								$html.='<button type="button" data-id="'.$d.'" class="btn btn-outline-danger '.$this->general->UserInfo['Theme']['button-size'].'  btnDelete" data-original-title="Delete">Cancel</button>';
							}
							return $html;
						} 
				)
			);
			$data=array();
			$data['POSTDATA']=$request;
			$data['TABLE']=$this->logDB . 'tbl_enquiry';
			$data['PRIMARYKEY']='EnqID';
			$data['COLUMNS']=$columns;
			$data['COLUMNS1']=$columns;
			$data['GROUPBY']=null;
			$data['WHERERESULT']=null;
			$data['WHEREALL']=" Status != 'Cancelled'";
			return SSP::SSP( $data);
		}else{
			return response(array('status'=>false,'message'=>"Access Denied"), 403);
		}
	}
	public function QTableView(Request $request){
		if($this->general->isCrudAllow($this->CRUD,"view")==true){
			$columns = array(
				array( 'db' => 'QNo', 'dt' => '0' ),
				array( 'db' => 'QDate', 'dt' => '1','formatter' => function( $d, $row ) {return date($this->Settings['DATE-FORMAT'],strtotime($d));}),
				array( 'db' => 'CustomerName', 'dt' => '2' ),
				array( 'db' => 'MobileNo1', 'dt' => '3' ),
				array( 'db' => 'MobileNo2', 'dt' => '4' ),
				array( 'db' => 'Email', 'dt' => '5' ),
				array( 'db' => 'Status','dt' => '6',
					'formatter' => function( $d, $row ) {
						$html = "";
						if($d=="New"){
							$html="<span class='badge badge-info m-1'>".$d."</span>";
						}elseif($d=="Allocated"){
							$html="<span class='badge badge-secondary m-1'>".$d."</span>";
						}elseif($d=="Quote Requested"){
							$html="<span class='badge badge-success m-1'>".$d."</span>";
						}
						return $html;
					} 
				),
				array( 'db' => 'VendorID','dt' => '7',
					'formatter' => function( $d, $row ) {
						if($d){
							return DB::table('tbl_vendors')->where('VendorID',$d)->value('VendorName');
						}else{
							return "--";
						}
					}
				),
				array( 
						'db' => 'QID', 
						'dt' => '8',
						'formatter' => function( $d, $row ) {
							$html='';
							/* if($this->general->isCrudAllow($this->CRUD,"edit")==true){
								$html.='<button type="button" data-id="'.$d.'" class="btn  btn-outline-success '.$this->general->UserInfo['Theme']['button-size'].'  mr-10 btnEdit" data-original-title="Edit"><i class="fa fa-pencil"></i></button>';
							} */
							if($this->general->isCrudAllow($this->CRUD,"view")==true){
								// $html.='<button type="button" data-id="'.$d.'" class="btn  btn-outline-info '.$this->general->UserInfo['Theme']['button-size'].'  mr-10 btnView" data-original-title="View Quotation"><i class="fa fa-eye"></i></button>';
								$html.='<button type="button" data-id="'.$d.'" class="btn btn-outline-info '.$this->general->UserInfo['Theme']['button-size'].'  mr-10 btnView">View Enquiry</button>';
							}
							if($this->general->isCrudAllow($this->CRUD,"delete")==true && $row['Status'] !== "Allocated"){
								$html.='<button type="button" data-id="'.$d.'" class="btn btn-outline-danger '.$this->general->UserInfo['Theme']['button-size'].'  btnDelete" data-original-title="Delete">Cancel</button>';
							}
							return $html;
						} 
				)
			);
			$data=array();
			$data['POSTDATA']=$request;
			$data['TABLE']=$this->logDB . 'tbl_quotation';
			$data['PRIMARYKEY']='QID';
			$data['COLUMNS']=$columns;
			$data['COLUMNS1']=$columns;
			$data['GROUPBY']=null;
			$data['WHERERESULT']=null;
			$data['WHEREALL']=" Status != 'Cancelled'";
			return SSP::SSP( $data);
		}else{
			return response(array('status'=>false,'message'=>"Access Denied"), 403);
		}
	}
	public function TrashTableView(Request $request){
		if($this->general->isCrudAllow($this->CRUD,"view")==true){
			$columns = array(
				array( 'db' => 'QNo', 'dt' => '0' ),
				array( 'db' => 'QDate', 'dt' => '1','formatter' => function( $d, $row ) {return date($this->Settings['DATE-FORMAT'],strtotime($d));}),
				array( 'db' => 'CustomerName', 'dt' => '2' ),
				array( 'db' => 'MobileNo1', 'dt' => '3' ),
				array( 'db' => 'MobileNo2', 'dt' => '4' ),
				array( 'db' => 'Email', 'dt' => '5' ),
				array( 'db' => 'Status','dt' => '6',
					'formatter' => function( $d, $row ) {
						return "<span class='badge badge-danger m-1'>".$d."</span>";
					} 
				),
				array( 'db' => 'VendorID','dt' => '7',
					'formatter' => function( $d, $row ) {
						if($d){
							return DB::table('tbl_vendors')->where('VendorID',$d)->value('VendorName');
						}else{
							return "--";
						}
					}
				),
				array( 
						'db' => 'QID', 
						'dt' => '8',
						'formatter' => function( $d, $row ) {
							$html='';
							if($this->general->isCrudAllow($this->CRUD,"restore")==true){
								$html='<button type="button" data-id="'.$d.'" class="btn btn-outline-success btn-sm  m-2 btnRestore"> <i class="fa fa-repeat" aria-hidden="true"></i> </button>';
							}
							return $html;
						} 
				)
			);
			$data=array();
			$data['POSTDATA']=$request;
			$data['TABLE']=$this->logDB . 'tbl_quotation';
			$data['PRIMARYKEY']='QID';
			$data['COLUMNS']=$columns;
			$data['COLUMNS1']=$columns;
			$data['GROUPBY']=null;
			$data['WHERERESULT']=null;
			$data['WHEREALL']=" Status = 'Cancelled'";
			return SSP::SSP( $data);
		}else{
			return response(array('status'=>false,'message'=>"Access Denied"), 403);
		}
	}

	public function GetCustomers(Request $req){
		$Customers = DB::Table('tbl_customer as CU')
			->join($this->generalDB.'tbl_countries as C','C.CountryID','CU.CountryID')
			->join($this->generalDB.'tbl_states as S', 'S.StateID', 'CU.StateID')
			->join($this->generalDB.'tbl_districts as D', 'D.DistrictID', 'CU.DistrictID')
			->join($this->generalDB.'tbl_taluks as T', 'T.TalukID', 'CU.TalukID')
			->join($this->generalDB.'tbl_cities as CI', 'CI.CityID', 'CU.CityID')
			->join($this->generalDB.'tbl_postalcodes as PC', 'PC.PID', 'CU.PostalCodeID')
			->where('CU.DFlag', 0)->where('CU.ActiveStatus', 'Active')
			->select('CU.*','C.CountryName','S.StateName','D.DistrictName','T.TalukName','CI.CityName','PC.PostalCode')
			->get();
	
			foreach($Customers as $customer){
				$billingAddressParts = array_map('trim', [
					$customer->Address,
					$customer->CityName,
					$customer->TalukName,
					$customer->DistrictName,
					$customer->StateName,
					$customer->CountryName,
					$customer->PostalCode
				]);
				$customer->BillingAddress = json_encode($billingAddressParts);
			
				$customer->DeliverAddress = [];
				$ShippingAddresses = DB::table('tbl_customer_address as CA')
					->join($this->generalDB.'tbl_countries as C','C.CountryID','CA.CountryID')
					->join($this->generalDB.'tbl_states as S', 'S.StateID', 'CA.StateID')
					->join($this->generalDB.'tbl_districts as D', 'D.DistrictID', 'CA.DistrictID')
					->join($this->generalDB.'tbl_taluks as T', 'T.TalukID', 'CA.TalukID')
					->join($this->generalDB.'tbl_cities as CI', 'CI.CityID', 'CA.CityID')
					->join($this->generalDB.'tbl_postalcodes as PC', 'PC.PID', 'CA.PostalCodeID')
					->where('CA.CustomerID', $customer->CustomerID)
					->select('CA.*','C.CountryName','S.StateName','D.DistrictName','T.TalukName','CI.CityName','PC.PostalCode')
					->get();
			
				foreach($ShippingAddresses as $shippingAddress){
					$addressParts = array_map('trim', [
						$shippingAddress->Address,
						$shippingAddress->CityName,
						$shippingAddress->TalukName,
						$shippingAddress->DistrictName,
						$shippingAddress->StateName,
						$shippingAddress->CountryName,
						$shippingAddress->PostalCode
					]);
					$customer->DeliverAddress[] = json_encode($addressParts);
				}
			
				$customer->DeliverAddress = count($customer->DeliverAddress) > 0 ? json_encode($customer->DeliverAddress) : [];
			}
	
		return $Customers;
	}
	
	public function GetVendorQuoteDetails(request $req){
		$VendorDB = Helper::getVendorDB($req->VendorID, $this->UserID);
		return DB::Table($VendorDB.'tbl_quotation_sent_details as QSD')->join('tbl_products as P','P.ProductID','QSD.ProductID')->join('tbl_uom as UOM','UOM.UID','QSD.UOMID')->where('QSD.QuoteSentID',$req->QuoteSentID)
		->select('QSD.Amount','QSD.Price','QSD.TaxAmount','QSD.Taxable','QSD.TaxType','QSD.CGSTPer','QSD.SGSTPer','QSD.CGSTAmount','QSD.SGSTAmount','QSD.Qty','P.ProductName','UOM.UCode','UOM.UName')->get();
	}
	public function GetVendorRatings(request $req){
		return DB::Table('tbl_vendor_ratings as VR')->join('tbl_vendors as V','V.VendorID','VR.VendorID')
				->join($this->generalDB.'tbl_states as S','S.StateID','V.StateID')
				->join($this->generalDB.'tbl_districts as D','D.DistrictID','V.DistrictID')
				->join($this->generalDB.'tbl_taluks as T','T.TalukID','V.TalukID')
				->join($this->generalDB.'tbl_cities as C','C.CityID','V.CityID')
				->join($this->generalDB.'tbl_postalcodes as P','P.PID','V.PostalCode')
				->where('VR.VendorID',$req->VendorID)->first();
	}

}

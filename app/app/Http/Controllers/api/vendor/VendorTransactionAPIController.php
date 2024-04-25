<?php

namespace App\Http\Controllers\api\vendor;

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
use activeMenuNames;
use ValidUnique;
use ValidDB;
use DocNum;
use docTypes;
use logs;

class VendorTransactionAPIController extends Controller{
    private $generalDB;
    private $logDB;
    private $tmpDB;
    private $ActiveMenuName;
    private $FileTypes;
	private $UserID;
	private $ReferID;

    public function __construct(){
		$this->generalDB=Helper::getGeneralDB();
		$this->logDB=Helper::getLogDB();
		$this->tmpDB=Helper::getTmpDB();
        $this->ActiveMenuName=activeMenuNames::Vendors->value;
		$this->FileTypes=Helper::getFileTypes(array("category"=>array("Images","Documents")));
        $this->middleware('auth:api');
        $this->middleware(function ($request, $next) {
			$this->UserID=auth()->user()->UserID;
			$this->ReferID=auth()->user()->ReferID;
			return $next($request);
		});
    }

    public function getQuoteRequest(Request $req){
        $VendorID = $this->ReferID;

        $pageNo = $req->PageNo ?? 1;
        $perPage = 10;

        $QuoteReqData = DB::table($this->logDB.'tbl_vendor_quotation as VQ')->join($this->logDB.'tbl_enquiry as E','E.EnqID','VQ.EnqID')
        ->where('VQ.VendorID',$VendorID)->where('VQ.Status','Requested')
        ->select('VQ.VQuoteID','E.EnqNo')
        ->paginate($perPage, ['*'], 'page', $pageNo);

        foreach($QuoteReqData as $row){
            $row->ProductData = DB::table($this->logDB.'tbl_vendor_quotation_details as VQD')->leftJoin('tbl_vendors_product_mapping as VPM','VPM.ProductID','VQD.ProductID')
            ->join('tbl_products as P','P.ProductID','VQD.ProductID')
            ->join('tbl_tax as T', 'T.TaxID', 'P.TaxID')
            ->join('tbl_product_category as PC', 'PC.PCID', 'P.CID')
            ->join('tbl_product_subcategory as PSC', 'PSC.PSCID', 'P.SCID')
            ->join('tbl_uom as U', 'U.UID', 'P.UID')
            ->where('P.ActiveStatus', 'Active')->where('P.DFlag', 0)->where('PC.ActiveStatus', 'Active')->where('PC.DFlag', 0)->where('PSC.ActiveStatus', 'Active')->where('PSC.DFlag', 0)
            ->where('VQD.VQuoteID',$row->VQuoteID)->where('VQD.Status',NULL)
            ->where('VPM.VendorID',$VendorID)
            ->select('VQD.DetailID','P.ProductName','P.ProductID','VQD.Qty', 'PC.PCName', 'PC.PCID', 'PSC.PSCName','U.UName','U.UCode','U.UID', 'PSC.PSCID','VPM.VendorPrice','P.TaxType','P.TaxID','T.TaxPercentage','T.TaxName')
            ->get();
        }
        
        return response()->json([
            'status' => true,
            'data' => $QuoteReqData->items(),
            'CurrentPage' => $QuoteReqData->currentPage(),
            'LastPage' => $QuoteReqData->lastPage(),
        ]);
    }

    public function AddQuotePrice(Request $req){ 
        $VendorID = $this->ReferID;
		DB::beginTransaction();
        try {
            $OldData=$NewData=[];
            $ProductData = json_decode($req->ProductData);
            // return $ProductData;
            foreach($ProductData as $item){
                $status = DB::Table($this->logDB.'tbl_vendor_quotation_details')->where('DetailID',$item->DetailID)->where('ProductID',$item->ProductID)->update(['Price'=>$item->VendorPrice,'Status'=>'Price Sent']);
            }
            $status = DB::Table($this->logDB.'tbl_vendor_quotation')->where('VendorID',$VendorID)->where('VQuoteID',$req->VQuoteID)->update(['Status' => 'Sent', 'QSentOn'=>date('Y-m-d'),'UpdatedOn'=>date('Y-m-d H:i:s')]);
        }catch(Exception $e) {
            $status=false;
        }
        if($status==true){
            DB::commit();
            $NewData=DB::table($this->logDB.'tbl_vendor_quotation_details')->where('VQuoteID',$req->VQuoteID)->get();
            $logData=array("Description"=>"Vendor Quote Price Updated","ModuleName"=>"Vendor Product Mapping","Action"=>"Add","ReferID"=>$VendorID,"OldData"=>$OldData,"NewData"=>$NewData,"UserID"=>$VendorID,"IP"=>$req->ip());
            logs::Store($logData);
            return response()->json(['status' => true ,'message' => "Quote Price Updated Successfully!"]);
        }else{
            DB::rollback();
            return response()->json(['status' => false,'message' => "Quote Price Update Failed!"]);
        }
	}

    public function getAllQuotations(Request $req){
        $VendorID = $this->ReferID;

        $pageNo = $req->PageNo ?? 1;
        $perPage = 10;

        $query = DB::table($this->logDB.'tbl_vendor_quotation as VQ')->join($this->logDB.'tbl_enquiry as E','E.EnqID','VQ.EnqID')
        ->where('VQ.VendorID',$VendorID);
        if($req->has('Status')){
            $query->where('VQ.Status',$req->Status);
        }
        $QuoteReqData = $query->select('VQ.VQuoteID','E.EnqNo')
        ->paginate($perPage, ['*'], 'page', $pageNo);

        foreach($QuoteReqData as $row){
            $row->ProductData = DB::table($this->logDB.'tbl_vendor_quotation_details as VQD')->leftJoin('tbl_vendors_product_mapping as VPM','VPM.ProductID','VQD.ProductID')
            ->join('tbl_products as P','P.ProductID','VQD.ProductID')
            ->join('tbl_tax as T', 'T.TaxID', 'P.TaxID')
            ->join('tbl_product_category as PC', 'PC.PCID', 'P.CID')
            ->join('tbl_product_subcategory as PSC', 'PSC.PSCID', 'P.SCID')
            ->join('tbl_uom as U', 'U.UID', 'P.UID')
            ->where('P.ActiveStatus', 'Active')->where('P.DFlag', 0)->where('PC.ActiveStatus', 'Active')->where('PC.DFlag', 0)->where('PSC.ActiveStatus', 'Active')->where('PSC.DFlag', 0)
            ->where('VQD.VQuoteID',$row->VQuoteID)
            ->where('VPM.VendorID',$VendorID)
            ->select('VQD.DetailID','P.ProductName','P.ProductID','VQD.Qty', 'PC.PCName', 'PC.PCID', 'PSC.PSCName','U.UName','U.UCode','U.UID', 'PSC.PSCID','VPM.VendorPrice','VQD.Price','P.TaxType','P.TaxID','T.TaxPercentage','T.TaxName')
            ->get();
        }
        
        return response()->json([
            'status' => true,
            'data' => $QuoteReqData->items(),
            'CurrentPage' => $QuoteReqData->currentPage(),
            'LastPage' => $QuoteReqData->lastPage(),
        ]);
    }

}

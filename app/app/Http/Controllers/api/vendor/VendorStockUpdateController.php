<?php

namespace App\Http\Controllers\api\vendor;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Http\JsonResponse;
use DB;
use Auth;
use cruds;
use Helper;
use Laravel\Passport\RefreshToken;
use Laravel\Passport\Token;
use activeMenuNames;
use App\Traits\ResponseTrait;
use Illuminate\Http\Response;
use Illuminate\Pagination\Paginator;
use ValidUnique;
use ValidDB;
use DocNum;
use general;
use docTypes;
use logs;

class VendorStockUpdateController extends Controller
{
	use ResponseTrait;
	private $general;
	private $DocNum;
	private $UserID;
	private $ActiveMenuName;
	private $PageTitle;
	private $CRUD;
	private $Settings;
	private $Menus;

	public function __construct(){
	// 	$this->ActiveMenuName=activeMenuNames::VendorProductMapping->value;
	// 	$this->PageTitle="Vendor Product Mapping";
	//     // $this->middleware('auth');
		$this->middleware(function ($request, $next) {
			// $this->UserID=auth()->user()->UserID;
			$this->general= new general($this->UserID,$this->ActiveMenuName);
			// $this->Menus=$this->general->loadMenu();
			// $this->CRUD=$this->general->getCrudOperations($this->ActiveMenuName);
			$this->Settings=$this->general->getSettings();
			return $next($request);
		});
	}

	public function index(Request $req)
	{
		$perPage = $req->input('per_page');
		$nextPage = $req->input('next_page');

		if ($nextPage) {
			Paginator::currentPageResolver(function () use ($nextPage) {
				return $nextPage;
			});
		}

		$offset = ($nextPage - 1) * $perPage;

		$VendorDB= Helper::getVendorDB($req->VendorID,"2");
		$query  = DB::table($VendorDB .'tbl_vendors_stock_update')
		->join('tbl_product_category', 'tbl_vendors_stock_update.PCID', '=', 'tbl_product_category.PCID')
		->join('tbl_product_subcategory', 'tbl_vendors_stock_update.PSCID', '=', 'tbl_product_subcategory.PSCID')
		->select('tbl_vendors_stock_update.*','tbl_product_category.PCName as category_name','tbl_product_subcategory.PSCName as subcategory_name'
		);

		$vendorData = $query->skip($offset)->take($perPage)->get();

		$totalRecords = $query->count();

		$nextPage = $totalRecords > $offset + $perPage ? $nextPage + 1 : null;


		return response()->json([
			'data' => $vendorData,
			'next_page' => $nextPage,
			'total_records' => $totalRecords
		]);
	}

	public function update(Request $req){
		
			$OldData=$NewData=[];
			DB::beginTransaction();
			try {
				$VendorDB= Helper::getVendorDB($req->VendorID,2);
				$status = DB::statement("CREATE TABLE IF NOT EXISTS {$VendorDB}tbl_docnum (SLNO INT AUTO_INCREMENT PRIMARY KEY,DocType VARCHAR(50) NULL,Prefix VARCHAR(5) NULL,Length INT(11) NULL,CurrNum INT(11) NULL,Suffix VARCHAR(10),Year VARCHAR(10) NULL)");
				if($status){
					Helper::addVendorDocNum($VendorDB,'tbl_docnum',docTypes::VendorStockUpdate->value,"VSU",8,1);
					$status = DB::statement("CREATE TABLE IF NOT EXISTS {$VendorDB}tbl_vendors_stock_update (DetailID VARCHAR(50) PRIMARY KEY,Date DATE,VendorID VARCHAR(50) NULL,StockPointID VARCHAR(50) NULL,ProductID VARCHAR(50) NULL,PCID VARCHAR(50) NULL,PSCID VARCHAR(50) NULL,UOMID VARCHAR(50) NULL,Price DOUBLE,Qty DOUBLE,CreatedBy VARCHAR(50) NULL,CreatedOn TIMESTAMP NULL)");
				}
				$OldData=DB::table($VendorDB.'tbl_vendors_stock_update')->where('VendorID',$req->VendorID)->where('Date',date("Y-m-d"))->get();
				$StockData=$req->StockData;
				$ProductIDs=[];
				foreach($StockData as $data){
					$ProductIDs[]=$data['ProductID'];
					$t=DB::Table($VendorDB.'tbl_vendors_stock_update')->where('VendorID',$req->VendorID)->Where('ProductID',$data['ProductID'])->Where('StockPointID',$data['StockPointID'])->where('Date',date("Y-m-d"))->first();
					if(!$t){
						$DetailID = DocNum::getDocNum(docTypes::VendorStockUpdate->value,$VendorDB);
						$tdata=array(
							"DetailID"=>$DetailID,
							"Date"=>date("Y-m-d"),
							"VendorID"=>$req->VendorID,
							"StockPointID"=>$data['StockPointID'],
							"ProductID"=>$data['ProductID'],
							"PCID"=>$data['PCID'],
							"PSCID"=>$data['PSCID'],
							"Qty"=>$data['Qty'],
							"Price"=>$data['Price'],
							"UOMID"=>$data['UOMID'],
							"CreatedBy"=>$this->UserID,
							"CreatedOn"=>date("Y-m-d H:i:s")
						);
						$status=DB::Table($VendorDB.'tbl_vendors_stock_update')->insert($tdata);
						if($status){
							DocNum::updateDocNum(docTypes::VendorStockUpdate->value,$VendorDB);
						}
					}else{
						$ExistingPrice=DB::Table($VendorDB.'tbl_vendors_stock_update')->where('VendorID',$req->VendorID)->Where('ProductID',$data['ProductID'])->Where('StockPointID',$data['StockPointID'])->where('Date',date("Y-m-d"))->value('Price');
						if($ExistingPrice != $data['Price']){
							$status=DB::Table($VendorDB.'tbl_vendors_stock_update')->where('VendorID',$req->VendorID)->Where('ProductID',$data['ProductID'])->Where('StockPointID',$data['StockPointID'])->where('Date',date("Y-m-d"))->update(['Price' => $data['Price']]);
						}
						$ExistingQty=DB::Table($VendorDB.'tbl_vendors_stock_update')->where('VendorID',$req->VendorID)->Where('ProductID',$data['ProductID'])->Where('StockPointID',$data['StockPointID'])->where('Date',date("Y-m-d"))->value('Qty');
						if($ExistingQty != $data['Qty']){
							$status=DB::Table($VendorDB.'tbl_vendors_stock_update')->where('VendorID',$req->VendorID)->Where('ProductID',$data['ProductID'])->Where('StockPointID',$data['StockPointID'])->where('Date',date("Y-m-d"))->update(['Qty' => $data['Qty']]);
						}
					}
				}
				/* if(count($ProductIDs)>0){
					DB::Table($VendorDB.'tbl_vendors_stock_update')->where('VendorID',$req->VendorID)->WhereIn('ProductID',$ProductIDs)->update(['Status'=>1,'UpdatedOn'=>date('Y-m-d H:i:s'),'UpdatedBy'=>$this->UserID]);
					DB::Table($VendorDB.'tbl_vendors_stock_update')->where('VendorID',$req->VendorID)->WhereNotIn('ProductID',$ProductIDs)->update(['Status'=>0,'UpdatedOn'=>date('Y-m-d H:i:s'),'UpdatedBy'=>$this->UserID]);
				} */
				$status=true;
			}catch(Exception $e) {
				$status=false;
			}
			if($status==true){
				// DB::commit();
				$NewData=DB::table($VendorDB.'tbl_vendors_stock_update')->where('VendorID',$req->VendorID)->where('Date',date("Y-m-d"))->get();
				$logData=array("Description"=>"Vendor Stock Updated","ModuleName"=>$this->ActiveMenuName,"Action"=>cruds::UPDATE->value,"ReferID"=>$req->VendorID,"OldData"=>$OldData,"NewData"=>$NewData,"UserID"=>$this->UserID,"IP"=>$req->ip());
				logs::Store($logData);
				return $this->responseSuccess(null, 'Vendor Stock Updated Successfully!');

			}else{
				DB::rollback();
				return $this->responseError(null, 'Vendor Stock Updated Failed !',Response::HTTP_INTERNAL_SERVER_ERROR);
			}
		
	}
	
	public function delete(Request $req)
	{
		try {
			$VendorDB = Helper::getVendorDB($req->VendorID, $this->UserID);
			$query  = DB::table($VendorDB . 'tbl_vendors_stock_update')->where('ProductID', $req->ProductID)->where('status',1)->first();

			if ($query) {

				DB::table($VendorDB . 'tbl_vendors_stock_update')
					->where('ProductID', $req->ProductID)
					->update(['status' => 0]);


				$updatedRecord = DB::table($VendorDB . 'tbl_vendors_stock_update')
					->where('ProductID', $req->ProductID)
					->first();

				return $this->responseSuccess($updatedRecord, 'Product deleted Successfully!');
			} else {
				return $this->responseError('Record not found', '', Response::HTTP_INTERNAL_SERVER_ERROR);
			}
		} catch (\Exception $e) {
			return $this->responseError(null, $e->getMessage(), Response::HTTP_INTERNAL_SERVER_ERROR);
		}
	}

	public function getVendorProducts(Request $req)
	{
		
		$VendorDB= Helper::getVendorDB($req->VendorID,$this->UserID);
		$TableName="tbl_vendors_product_mapping";
		$VendorData=[];
		if(Helper::checkTableExists($VendorDB,$TableName)){
			$VendorData= DB::Table($VendorDB.'tbl_vendors_product_mapping as VPM')
			->join('tbl_products as P','P.ProductID','VPM.ProductID')
			->join('tbl_vendors as V','V.VendorID','VPM.VendorID')
			->join('tbl_product_category as PC','PC.PCID','P.CID')
			->join('tbl_product_subcategory as PSC','PSC.PSCID','P.SCID')
			->join('tbl_uom as UOM','UOM.UID','P.UID')
			->where('VPM.Status',1)->where('P.DFlag',0)->where('P.ActiveStatus','Active')->where('VPM.VendorID',$req->VendorID)
			// ->select('VPM.VendorPrice','PSC.PSCName')
			->get();
		}

		$VendorData = $VendorData->map(function ($item) {
			$item->Images = unserialize($item->Images);
			unset($item->Attributes);
			unset($item->AdditionalSetting);
			return $item;
		});
		$result=[];
		if(count($VendorData)>0){
			foreach($VendorData as $row){
				$result[$row->PSCName][]=$row;
			}
		}

		$VendorStockPoints= DB::table('tbl_vendors_stock_point')->where('DFlag',0)->where('VendorID',$req->VendorID)->select('DetailID as StockPointID','PointName')->get();
		foreach($VendorStockPoints as $row){
			// dd($row->ProductData[]="test");
			$row->ProductData[]=$result;
		}
		// dd();
		$data = array();
		$data['VendorStockPoints'] = $VendorStockPoints;
		// $data['ProductData'] = $result;
		return $this->responseSuccess($data, 'Vendor Stock Details!');
	}


}

<?php

namespace App\Http\Controllers\web\masters\general;

use App\Http\Controllers\Controller;
use App\Models\Language;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Redirect;
use App\Models\DocNum;
use App\Models\general;
use SSP;
use Illuminate\Support\Facades\DB;
use Auth;
use Hash;
use App\enums\cruds;
use App\Rules\ValidUnique;
use stdClass;
use ValidDB;
use logs;
use App\helper\Helper;
use App\enums\activeMenuNames;
use App\enums\docTypes;
use Exception;

class CityController extends Controller{
	private $general;
	private $UserID;
	private $ActiveMenuName;
	private $PageTitle;
	private $CRUD;
	private $Settings;
    private $Menus;
	private $generalDB;
    public function __construct(){
		$this->ActiveMenuName=activeMenuNames::City->value;
		$this->PageTitle="City";
        $this->middleware('auth');
		$this->generalDB=Helper::getGeneralDB();
		$this->middleware(function ($request, $next) {
			$this->UserID=auth()->user()->UserID;
			$this->general=new general($this->UserID,$this->ActiveMenuName);
			$this->Menus=$this->general->loadMenu();
			$this->CRUD=$this->general->getCrudOperations($this->ActiveMenuName);
			$this->Settings=$this->general->getSettings();
			return $next($request);
		});
    }
	public function view(Request $req){

		if($this->general->isCrudAllow($this->CRUD,"view")){
			$FormData=$this->general->UserInfo;
			$FormData['ActiveMenuName']=$this->ActiveMenuName;
			$FormData['PageTitle']=$this->PageTitle;
			$FormData['menus']=$this->Menus;
			$FormData['crud']=$this->CRUD;
			return view('app.master.general.city.view',$FormData);
		}elseif($this->general->isCrudAllow($this->CRUD,"Add")){
			return Redirect::to('/admin/master/general/city/create');
		}else{
			return view('errors.403');
		}
	}

    public function TrashView(Request $req){
        if($this->general->isCrudAllow($this->CRUD,"restore")){
            $FormData=$this->general->UserInfo;
            $FormData['menus']=$this->Menus;
            $FormData['crud']=$this->CRUD;
			$FormData['ActiveMenuName']=$this->ActiveMenuName;
			$FormData['PageTitle']=$this->PageTitle;
            return view('app.master.general.city.trash',$FormData);
        }elseif($this->general->isCrudAllow($this->CRUD,"view")){
			return Redirect::to('/admin/master/general/city/');
        }else{
            return view('errors.403');
        }
    }
    public function create(Request $req){
        if($this->general->isCrudAllow($this->CRUD,"add")){
			$OtherCruds=array(
				"Country"=>$this->general->getCrudOperations(activeMenuNames::Country->value),
				"States"=>$this->general->getCrudOperations(activeMenuNames::States->value),
				"Districts"=>$this->general->getCrudOperations(activeMenuNames::Districts->value),
				"Taluks"=>$this->general->getCrudOperations(activeMenuNames::Taluks->value),
				"PostalCodes"=>$this->general->getCrudOperations(activeMenuNames::PostalCodes->value),
			);
            $FormData=$this->general->UserInfo;
			$FormData['OtherCruds']=$OtherCruds;
            $FormData['menus']=$this->Menus;
            $FormData['crud']=$this->CRUD;
			$FormData['ActiveMenuName']=$this->ActiveMenuName;
			$FormData['PageTitle']=$this->PageTitle;
			$FormData['isEdit']=false;
            $FormData['languages'] = Language::active()->get();
            return view('app.master.general.city.create',$FormData);
        }elseif($this->general->isCrudAllow($this->CRUD,"view")){
            return Redirect::to('/admin/master/general/city/');
        }else{
            return view('errors.403');
        }
    }
    public function edit(Request $req,$CityID){
        if($this->general->isCrudAllow($this->CRUD,"edit")){
			$OtherCruds=array(
				"Country"=>$this->general->getCrudOperations(activeMenuNames::Country->value),
				"States"=>$this->general->getCrudOperations(activeMenuNames::States->value),
				"Districts"=>$this->general->getCrudOperations(activeMenuNames::Districts->value),
				"Taluks"=>$this->general->getCrudOperations(activeMenuNames::Taluks->value),
				"PostalCodes"=>$this->general->getCrudOperations(activeMenuNames::PostalCodes->value),
			);
            $FormData=$this->general->UserInfo;
			$FormData['OtherCruds']=$OtherCruds;
            $FormData['menus']=$this->Menus;
            $FormData['crud']=$this->CRUD;
			$FormData['ActiveMenuName']=$this->ActiveMenuName;
			$FormData['PageTitle']=$this->PageTitle;
			$FormData['isEdit']=true;
			$FormData['CityID']=$CityID;
            $FormData['languages'] = Language::active()->get();
			$FormData['EditData']=DB::Table($this->generalDB.'tbl_cities')->where('DFlag',0)->Where('CityID',$CityID)->get();
			if(count($FormData['EditData'])>0){
                $FormData['EditData'][0]->CityNameInTranslation = json_decode($FormData['EditData'][0]->CityNameInTranslation);
                return view('app.master.general.city.create',$FormData);
			}else{
				return view('errors.403');
			}
        }elseif($this->general->isCrudAllow($this->CRUD,"view")){
            return Redirect::to('/admin/master/general/city/');
        }else{
            return view('errors.403');
        }
    }
	public function getTaluk(request $req){
		return DB::Table($this->generalDB.'tbl_taluks')->where('ActiveStatus','Active')->where('DFlag',0)->get();
	}
    public function save(Request $req){
		if($this->general->isCrudAllow($this->CRUD,"add")){
			$OldData=array();$NewData=array();$CityID="";
			$ValidDB=array();
			$ValidDB['Country']['TABLE']=$this->generalDB."tbl_countries";
			$ValidDB['Country']['ErrMsg']="Country name does not exist";
			$ValidDB['Country']['WHERE'][]=array("COLUMN"=>"CountryID","CONDITION"=>"=","VALUE"=>$req->CountryID);
			$ValidDB['Country']['WHERE'][]=array("COLUMN"=>"ActiveStatus","CONDITION"=>"=","VALUE"=>1);
			$ValidDB['Country']['WHERE'][]=array("COLUMN"=>"DFlag","CONDITION"=>"=","VALUE"=>0);

			$ValidDB['State']['TABLE']=$this->generalDB."tbl_states";
			$ValidDB['State']['ErrMsg']="State name does not exist";
			$ValidDB['State']['WHERE'][]=array("COLUMN"=>"CountryID","CONDITION"=>"=","VALUE"=>$req->CountryID);
			$ValidDB['State']['WHERE'][]=array("COLUMN"=>"StateID","CONDITION"=>"=","VALUE"=>$req->StateID);
			$ValidDB['State']['WHERE'][]=array("COLUMN"=>"ActiveStatus","CONDITION"=>"=","VALUE"=>1);
			$ValidDB['State']['WHERE'][]=array("COLUMN"=>"DFlag","CONDITION"=>"=","VALUE"=>0);

			$ValidDB['District']['TABLE']=$this->generalDB."tbl_districts";
			$ValidDB['District']['ErrMsg']="District name does not exist";
			$ValidDB['District']['WHERE'][]=array("COLUMN"=>"CountryID","CONDITION"=>"=","VALUE"=>$req->CountryID);
			$ValidDB['District']['WHERE'][]=array("COLUMN"=>"StateID","CONDITION"=>"=","VALUE"=>$req->StateID);
			$ValidDB['District']['WHERE'][]=array("COLUMN"=>"DistrictID","CONDITION"=>"=","VALUE"=>$req->DistrictID);
			$ValidDB['District']['WHERE'][]=array("COLUMN"=>"ActiveStatus","CONDITION"=>"=","VALUE"=>1);
			$ValidDB['District']['WHERE'][]=array("COLUMN"=>"DFlag","CONDITION"=>"=","VALUE"=>0);

			$ValidDB['Taluk']['TABLE']=$this->generalDB."tbl_taluks";
			$ValidDB['Taluk']['ErrMsg']="Taluk name does not exist";
			$ValidDB['Taluk']['WHERE'][]=array("COLUMN"=>"CountryID","CONDITION"=>"=","VALUE"=>$req->CountryID);
			$ValidDB['Taluk']['WHERE'][]=array("COLUMN"=>"StateID","CONDITION"=>"=","VALUE"=>$req->StateID);
			$ValidDB['Taluk']['WHERE'][]=array("COLUMN"=>"DistrictID","CONDITION"=>"=","VALUE"=>$req->DistrictID);
			$ValidDB['Taluk']['WHERE'][]=array("COLUMN"=>"TalukID","CONDITION"=>"=","VALUE"=>$req->TalukID);
			$ValidDB['Taluk']['WHERE'][]=array("COLUMN"=>"ActiveStatus","CONDITION"=>"=","VALUE"=>1);
			$ValidDB['Taluk']['WHERE'][]=array("COLUMN"=>"DFlag","CONDITION"=>"=","VALUE"=>0);

			$ValidDB['PostalCode']['TABLE']=$this->generalDB."tbl_postalcodes";
			$ValidDB['PostalCode']['ErrMsg']="Postal Code does not exist";
			$ValidDB['PostalCode']['WHERE'][]=array("COLUMN"=>"CountryID","CONDITION"=>"=","VALUE"=>$req->CountryID);
			$ValidDB['PostalCode']['WHERE'][]=array("COLUMN"=>"StateID","CONDITION"=>"=","VALUE"=>$req->StateID);
			$ValidDB['PostalCode']['WHERE'][]=array("COLUMN"=>"DistrictID","CONDITION"=>"=","VALUE"=>$req->DistrictID);
			$ValidDB['PostalCode']['WHERE'][]=array("COLUMN"=>"PID","CONDITION"=>"=","VALUE"=>$req->PostalCodeID);
			$ValidDB['PostalCode']['WHERE'][]=array("COLUMN"=>"ActiveStatus","CONDITION"=>"=","VALUE"=>1);
			$ValidDB['PostalCode']['WHERE'][]=array("COLUMN"=>"DFlag","CONDITION"=>"=","VALUE"=>0);

			$rules=array(
				'CountryID' =>['required',$ValidDB['Country']],
				'StateID' =>['required',$ValidDB['State']],
				'DistrictID' =>['required',$ValidDB['District']],
				'TalukID' =>['required',$ValidDB['Taluk']],
				'PostalCodeID' =>['required',$ValidDB['PostalCode']],
				'CityName' =>['required','min:3','max:100',new ValidUnique(array("TABLE"=>$this->generalDB."tbl_cities","WHERE"=>" CityName='".$req->CityName."' and CountryID='".$req->CountryID."' and StateID='".$req->StateID."' and DistrictID='".$req->DistrictID."' and TalukID='".$req->TalukID."' "),"This City Name is already taken.")],
                'CityNameInTranslation' => 'required',
			);
			$message=array();
			$validator = Validator::make($req->all(), $rules,$message);

			if ($validator->fails()) {
				return array('status'=>false,'message'=>"City Create Failed",'errors'=>$validator->errors());
			}
			DB::beginTransaction();
			try {
				$CityID=DocNum::getDocNum(docTypes::City->value,"",Helper::getCurrentFY());
				$data=array(
					"CityID"=>$CityID,
					"CityName"=>$req->CityName,
                    "CityNameInTranslation"=>$req->CityNameInTranslation,
					"TalukID"=>$req->TalukID,
					"DistrictID"=>$req->DistrictID,
					"StateID"=>$req->StateID,
					"CountryID"=>$req->CountryID,
					"PostalID"=>$req->PostalCodeID,
					"ActiveStatus"=>$req->ActiveStatus,
					"CreatedBy"=>$this->UserID,
					"CreatedOn"=>date("Y-m-d H:i:s")
				);
				DB::Table($this->generalDB.'tbl_cities')->insert($data);
                DB::commit();
                DocNum::updateDocNum(docTypes::City->value);
                $NewData=DB::table($this->generalDB.'tbl_cities')->where('CityID',$CityID)->get();
                $logData=array("Description"=>"New City Created","ModuleName"=>$this->ActiveMenuName,"Action"=>cruds::ADD->value,"ReferID"=>$CityID,"OldData"=>$OldData,"NewData"=>$NewData,"UserID"=>$this->UserID,"IP"=>$req->ip());
                logs::Store($logData);
                return array('status'=>true,'message'=>"City Created Successfully");
            }catch(Exception $e) {
                logger($e);
                DB::rollback();
                return array('status'=>false,'message'=>"City Create Failed");
			}
		}else{
			return array('status'=>false,'message'=>'Access denied');
		}
	}
    public function update(Request $req,$CityID){
		if($this->general->isCrudAllow($this->CRUD,"edit")){
			$OldData=array();$NewData=array();
			$ValidDB=array();
			$ValidDB['Country']['TABLE']=$this->generalDB."tbl_countries";
			$ValidDB['Country']['ErrMsg']="Country name does not exist";
			$ValidDB['Country']['WHERE'][]=array("COLUMN"=>"CountryID","CONDITION"=>"=","VALUE"=>$req->CountryID);
			$ValidDB['Country']['WHERE'][]=array("COLUMN"=>"ActiveStatus","CONDITION"=>"=","VALUE"=>1);
			$ValidDB['Country']['WHERE'][]=array("COLUMN"=>"DFlag","CONDITION"=>"=","VALUE"=>0);

			$ValidDB['State']['TABLE']=$this->generalDB."tbl_states";
			$ValidDB['State']['ErrMsg']="State name does not exist";
			$ValidDB['State']['WHERE'][]=array("COLUMN"=>"CountryID","CONDITION"=>"=","VALUE"=>$req->CountryID);
			$ValidDB['State']['WHERE'][]=array("COLUMN"=>"StateID","CONDITION"=>"=","VALUE"=>$req->StateID);
			$ValidDB['State']['WHERE'][]=array("COLUMN"=>"ActiveStatus","CONDITION"=>"=","VALUE"=>1);
			$ValidDB['State']['WHERE'][]=array("COLUMN"=>"DFlag","CONDITION"=>"=","VALUE"=>0);

			$ValidDB['District']['TABLE']=$this->generalDB."tbl_districts";
			$ValidDB['District']['ErrMsg']="District name does not exist";
			$ValidDB['District']['WHERE'][]=array("COLUMN"=>"CountryID","CONDITION"=>"=","VALUE"=>$req->CountryID);
			$ValidDB['District']['WHERE'][]=array("COLUMN"=>"StateID","CONDITION"=>"=","VALUE"=>$req->StateID);
			$ValidDB['District']['WHERE'][]=array("COLUMN"=>"DistrictID","CONDITION"=>"=","VALUE"=>$req->DistrictID);
			$ValidDB['District']['WHERE'][]=array("COLUMN"=>"ActiveStatus","CONDITION"=>"=","VALUE"=>1);
			$ValidDB['District']['WHERE'][]=array("COLUMN"=>"DFlag","CONDITION"=>"=","VALUE"=>0);

			$ValidDB['Taluk']['TABLE']=$this->generalDB."tbl_taluks";
			$ValidDB['Taluk']['ErrMsg']="Taluk name does not exist";
			$ValidDB['Taluk']['WHERE'][]=array("COLUMN"=>"CountryID","CONDITION"=>"=","VALUE"=>$req->CountryID);
			$ValidDB['Taluk']['WHERE'][]=array("COLUMN"=>"StateID","CONDITION"=>"=","VALUE"=>$req->StateID);
			$ValidDB['Taluk']['WHERE'][]=array("COLUMN"=>"DistrictID","CONDITION"=>"=","VALUE"=>$req->DistrictID);
			$ValidDB['Taluk']['WHERE'][]=array("COLUMN"=>"TalukID","CONDITION"=>"=","VALUE"=>$req->TalukID);
			$ValidDB['Taluk']['WHERE'][]=array("COLUMN"=>"ActiveStatus","CONDITION"=>"=","VALUE"=>1);
			$ValidDB['Taluk']['WHERE'][]=array("COLUMN"=>"DFlag","CONDITION"=>"=","VALUE"=>0);

			$ValidDB['PostalCode']['TABLE']=$this->generalDB."tbl_postalcodes";
			$ValidDB['PostalCode']['ErrMsg']="Postal Code does not exist";
			$ValidDB['PostalCode']['WHERE'][]=array("COLUMN"=>"CountryID","CONDITION"=>"=","VALUE"=>$req->CountryID);
			$ValidDB['PostalCode']['WHERE'][]=array("COLUMN"=>"StateID","CONDITION"=>"=","VALUE"=>$req->StateID);
			$ValidDB['PostalCode']['WHERE'][]=array("COLUMN"=>"DistrictID","CONDITION"=>"=","VALUE"=>$req->DistrictID);
			$ValidDB['PostalCode']['WHERE'][]=array("COLUMN"=>"PID","CONDITION"=>"=","VALUE"=>$req->PostalCodeID);
			$ValidDB['PostalCode']['WHERE'][]=array("COLUMN"=>"ActiveStatus","CONDITION"=>"=","VALUE"=>1);
			$ValidDB['PostalCode']['WHERE'][]=array("COLUMN"=>"DFlag","CONDITION"=>"=","VALUE"=>0);

			$rules=array(
				'CountryID' =>['required',$ValidDB['Country']],
				'StateID' =>['required',$ValidDB['State']],
				'DistrictID' =>['required',$ValidDB['District']],
				'TalukID' =>['required',$ValidDB['Taluk']],
				'PostalCodeID' =>['required',$ValidDB['PostalCode']],
				'CityName' =>['required','min:3','max:100',new ValidUnique(array("TABLE"=>$this->generalDB."tbl_cities","WHERE"=>" CityName='".$req->CityName."' and CountryID='".$req->CountryID."' and StateID='".$req->StateID."' and DistrictID='".$req->DistrictID."' and TalukID='".$req->TalukID."' and CityID<>'".$CityID."' "),"This City Name is already taken.")],
                'CityNameInTranslation.required' => "City Name in Translation is required",
			);
			$message=array();
			$validator = Validator::make($req->all(), $rules,$message);

			if ($validator->fails()) {
				return array('status'=>false,'message'=>"City Update Failed",'errors'=>$validator->errors());
			}
			DB::beginTransaction();
			try {
				$OldData=DB::table($this->generalDB.'tbl_cities')->where('CityID',$CityID)->first();
				$data=array(
					"CityName"=>$req->CityName,
					"TalukID"=>$req->TalukID,
					"DistrictID"=>$req->DistrictID,
					"StateID"=>$req->StateID,
					"CountryID"=>$req->CountryID,
					"PostalID"=>$req->PostalCodeID,
					"ActiveStatus"=>$req->ActiveStatus,
					"UpdatedBy"=>$this->UserID,
					"UpdatedOn"=>date("Y-m-d H:i:s")
				);

                $newTranslations = json_decode($req->CityNameInTranslation);
                $existingTranslations = json_decode($OldData->CityNameInTranslation);
                if (!$existingTranslations) {
                    $existingTranslations = new stdClass();
                }
                foreach ($newTranslations as $lang => $value) {
                    $existingTranslations->$lang = $value;
                }
                $data['CityNameInTranslation'] = json_encode($existingTranslations);

                DB::Table($this->generalDB.'tbl_cities')->where('CityID',$CityID)->update($data);
                $NewData=DB::table($this->generalDB.'tbl_cities')->where('CityID',$CityID)->get();
                $logData=array("Description"=>"City Updated ","ModuleName"=>$this->ActiveMenuName,"Action"=>cruds::UPDATE->value,"ReferID"=>$CityID,"OldData"=>$OldData,"NewData"=>$NewData,"UserID"=>$this->UserID,"IP"=>$req->ip());
                logs::Store($logData);
                DB::commit();
                return array('status'=>true,'message'=>"City Updated Successfully");
            }catch(Exception $e) {
                logger($e);
                DB::rollback();
                return array('status'=>false,'message'=>"City Update Failed");
			}
		}else{
			return array('status'=>false,'message'=>'Access denied');
		}
	}

	public function Delete(Request $req,$CityID){
		$OldData=$NewData=array();
		if($this->general->isCrudAllow($this->CRUD,"delete")){
			DB::beginTransaction();
			$status=false;
			try{
				$OldData=DB::table($this->generalDB.'tbl_cities')->where('CityID',$CityID)->get();
				$status=DB::table($this->generalDB.'tbl_cities')->where('CityID',$CityID)->update(array("DFlag"=>1,"DeletedBy"=>$this->UserID,"DeletedOn"=>date("Y-m-d H:i:s")));
			}catch(Exception $e) {

			}
			if($status==true){
				DB::commit();
				$logData=array("Description"=>"City has been Deleted ","ModuleName"=>$this->ActiveMenuName,"Action"=>cruds::DELETE->value,"ReferID"=>$CityID,"OldData"=>$OldData,"NewData"=>$NewData,"UserID"=>$this->UserID,"IP"=>$req->ip());
				logs::Store($logData);
				return array('status'=>true,'message'=>"City Deleted Successfully");
			}else{
				DB::rollback();
				return array('status'=>false,'message'=>"City Delete Failed");
			}
		}else{
			return response(array('status'=>false,'message'=>"Access Denied"), 403);
		}
	}
	public function Restore(Request $req,$CityID){
		$OldData=$NewData=array();
		if($this->general->isCrudAllow($this->CRUD,"restore")){
			DB::beginTransaction();
			$status=false;
			try{
				$OldData=DB::table($this->generalDB.'tbl_cities')->where('CityID',$CityID)->get();
				$status=DB::table($this->generalDB.'tbl_cities')->where('CityID',$CityID)->update(array("DFlag"=>0,"UpdatedBy"=>$this->UserID,"UpdatedOn"=>date("Y-m-d H:i:s")));
			}catch(Exception $e) {

			}
			if($status==true){
				DB::commit();
				$NewData=DB::table($this->generalDB.'tbl_cities')->where('CityID',$CityID)->get();
				$logData=array("Description"=>"City has been Restored ","ModuleName"=>$this->ActiveMenuName,"Action"=>cruds::RESTORE->value,"ReferID"=>$CityID,"OldData"=>$OldData,"NewData"=>$NewData,"UserID"=>$this->UserID,"IP"=>$req->ip());
				logs::Store($logData);
				return array('status'=>true,'message'=>"City Restored Successfully");
			}else{
				DB::rollback();
				return array('status'=>false,'message'=>"City Restore Failed");
			}
		}else{
			return response(array('status'=>false,'message'=>"Access Denied"), 403);
		}
	}
	public function TableView(Request $req){
		if($this->general->isCrudAllow($this->CRUD,"view")){
			$columns = array(
				array( 'db' => 'CI.CityID', 'dt' => '0' ),
				array( 'db' => 'CI.CityName', 'dt' => '1' ),
				array( 'db' => 'T.TalukName', 'dt' => '2' ),
				array( 'db' => 'D.DistrictName', 'dt' => '3' ),
				array( 'db' => 'S.StateName', 'dt' => '4' ),
				array( 'db' => 'C.CountryName', 'dt' => '5' ),
				array( 'db' => 'CI.ActiveStatus', 'dt' => '6'),
			);
			$columns1 = array(
				array( 'db' => 'CityID', 'dt' => '0' ),
				array( 'db' => 'CityName', 'dt' => '1' ),
				array( 'db' => 'TalukName', 'dt' => '2' ),
				array( 'db' => 'DistrictName', 'dt' => '3' ),
				array( 'db' => 'StateName', 'dt' => '4' ),
				array( 'db' => 'CountryName', 'dt' => '5' ),
				array( 'db' => 'ActiveStatus', 'dt' => '6',
					'formatter' => function( $d, $row ) {
						if($d=="Active"){
							return "<span class='badge badge-success m-1'>Active</span>";
						}else{
							return "<span class='badge badge-danger m-1'>Inactive</span>";
						}
					}
				),
				array( 'db' => 'CityID', 'dt' => '7',
					'formatter' => function( $d, $row ) {
						$html='';
						if($this->general->isCrudAllow($this->CRUD,"edit")){
							$html.='<button type="button" data-id="'.$d.'" class="btn  btn-outline-success '.$this->general->UserInfo['Theme']['button-size'].' m-5 mr-10 btnEdit" data-original-title="Edit"><i class="fa fa-pencil"></i></button>';
						}
						if($this->general->isCrudAllow($this->CRUD,"delete")){
							$html.='<button type="button" data-id="'.$d.'" class="btn  btn-outline-danger '.$this->general->UserInfo['Theme']['button-size'].' m-5 btnDelete" data-original-title="Delete"><i class="fa fa-trash" aria-hidden="true"></i></button>';
						}
						return $html;
					}
				)
			);
			$Where = " CI.DFlag=0 and CI.CountryID = '$req->CountryID' and CI.StateID = '$req->StateID'";
			if($req->DistrictID!=""){
					$Where.=" and CI.DistrictID = '$req->DistrictID'";
			}
			if($req->TalukID!=""){
					$Where.=" and CI.TalukID = '$req->TalukID'";
			}
			if($req->ActiveStatus != ""){
				$Where.=" and CI.ActiveStatus = '$req->ActiveStatus'";
			}
			$data=array();
			$data['POSTDATA']=$req;
			$data['TABLE']=$this->generalDB.'tbl_cities as CI LEFT JOIN '.$this->generalDB.'tbl_taluks as T ON T.TalukID = CI.TalukID LEFT JOIN '.$this->generalDB.'tbl_districts as D ON D.DistrictID = CI.DistrictID LEFT JOIN '.$this->generalDB.'tbl_states as S ON S.StateID = CI.StateID LEFT JOIN '.$this->generalDB.'tbl_countries as C ON C.CountryID = CI.CountryID';
			$data['PRIMARYKEY']='CityID';
			$data['COLUMNS']=$columns;
			$data['COLUMNS1']=$columns1;
			$data['GROUPBY']=null;
			$data['WHERERESULT']=null;
			$data['WHEREALL']=$Where;
			return SSP::SSP( $data);
		}else{
			return response(array('status'=>false,'message'=>"Access Denied"), 403);
		}
	}
	public function TrashTableView(Request $request){
		if($this->general->isCrudAllow($this->CRUD,"restore")){
			$columns = array(
				array( 'db' => 'C.CityID', 'dt' => '0' ),
				array( 'db' => 'C.CityName', 'dt' => '1' ),
				array( 'db' => 'T.TalukName', 'dt' => '2' ),
				array( 'db' => 'C.ActiveStatus', 'dt' => '3'),
			);
			$columns1 = array(
				array( 'db' => 'CityID', 'dt' => '0' ),
				array( 'db' => 'CityName', 'dt' => '1' ),
				array( 'db' => 'TalukName', 'dt' => '2' ),
				array( 'db' => 'ActiveStatus', 'dt' => '3',
					'formatter' => function( $d, $row ) {
						if($d=="Active"){
							return "<span class='badge badge-success m-1'>Active</span>";
						}else{
							return "<span class='badge badge-danger m-1'>Inactive</span>";
						}
					}
				),
				array( 'db' => 'CityID', 'dt' => '4',
					'formatter' => function( $d, $row ) {
						$html='<button type="button" data-id="'.$d.'" class="btn btn-outline-success '.$this->general->UserInfo['Theme']['button-size'].'  m-2 btnRestore"> <i class="fa fa-repeat" aria-hidden="true"></i> </button>';
						return $html;
					}
				)
			);
			$data=array();
			$data['POSTDATA']=$request;
			$data['TABLE']=$this->generalDB.'tbl_cities as C LEFT JOIN '.$this->generalDB.'tbl_taluks as T ON T.TalukID = C.TalukID';
			$data['PRIMARYKEY']='CityID';
			$data['COLUMNS']=$columns;
			$data['COLUMNS1']=$columns1;
			$data['GROUPBY']=null;
			$data['WHERERESULT']=null;
			$data['WHEREALL']=" C.DFlag=1 ";
			return SSP::SSP( $data);
		}else{
			return response(array('status'=>false,'message'=>"Access Denied"), 403);
		}
	}
}

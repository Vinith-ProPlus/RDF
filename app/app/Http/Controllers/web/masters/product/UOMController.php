<?php
namespace App\Http\Controllers\web\masters\product;

use App\Http\Controllers\Controller;
use App\Models\Language;
use App\Rules\ValidUnique;
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
use logs;
use Helper;
use App\enums\activeMenuNames;
use App\enums\docTypes;
use App\enums\cruds;
use stdClass;

class UOMController extends Controller{
	private $general;
	private $DocNum;
	private $UserID;
	private $ActiveMenuName;
	private $PageTitle;
	private $CRUD;
	private $logs;
	private $Settings;
    private $Menus;
    public function __construct(){
		$this->ActiveMenuName=activeMenuNames::UOM->value;
		$this->PageTitle="Unit of Measurement";
        $this->middleware('auth');

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

        if($this->general->isCrudAllow($this->CRUD, "view")){
            $FormData=$this->general->UserInfo;
            $FormData['menus']=$this->Menus;
            $FormData['crud']=$this->CRUD;
			$FormData['ActiveMenuName']=$this->ActiveMenuName;
			$FormData['PageTitle']=$this->PageTitle;
            return view('app.master.product.uom.view',$FormData);
        }elseif($this->general->isCrudAllow($this->CRUD,"add")==true){
			return Redirect::to('/admin/master/product/unit-of-measurement/create');
        }else{
            return view('errors.403');
        }
    }
    public function TrashView(Request $req){
        if($this->general->isCrudAllow($this->CRUD, "restore")){
            $FormData=$this->general->UserInfo;
            $FormData['menus']=$this->Menus;
            $FormData['crud']=$this->CRUD;
			$FormData['ActiveMenuName']=$this->ActiveMenuName;
			$FormData['PageTitle']=$this->PageTitle;
            return view('app.master.product.uom.trash',$FormData);
        }elseif($this->general->isCrudAllow($this->CRUD, "view")){
			return Redirect::to('/admin/master/product/unit-of-measurement/');
        }else{
            return view('errors.403');
        }
    }
    public function create(Request $req){
        if($this->general->isCrudAllow($this->CRUD, "add")){
            $FormData=$this->general->UserInfo;
            $FormData['menus']=$this->Menus;
            $FormData['crud']=$this->CRUD;
			$FormData['ActiveMenuName']=$this->ActiveMenuName;
			$FormData['PageTitle']=$this->PageTitle;
			$FormData['isEdit']=false;
            $FormData['languages'] = Language::active()->get();
            return view('app.master.product.uom.uom',$FormData);
        }elseif($this->general->isCrudAllow($this->CRUD, "view")){
            return Redirect::to('/admin/master/product/unit-of-measurement/');
        }else{
            return view('errors.403');
        }
    }
    public function edit(Request $req,$UomID){
        if($this->general->isCrudAllow($this->CRUD, "edit")){
            $FormData=$this->general->UserInfo;
            $FormData['menus']=$this->Menus;
            $FormData['crud']=$this->CRUD;
			$FormData['ActiveMenuName']=$this->ActiveMenuName;
			$FormData['PageTitle']=$this->PageTitle;
			$FormData['isEdit']=true;
            $FormData['languages'] = Language::active()->get();
			$FormData['EditData']=DB::Table('tbl_uom')->where('DFlag',0)->Where('UID',$UomID)->get();
			if(count($FormData['EditData'])>0){
                $FormData['EditData'][0]->UNameInTranslation = json_decode($FormData['EditData'][0]->UNameInTranslation);
				return view('app.master.product.uom.uom',$FormData);
			}else{
				return view('errors.403');
			}
        }elseif($this->general->isCrudAllow($this->CRUD, "view")){
            return Redirect::to('/admin/master/product/unit-of-measurement/');
        }else{
            return view('errors.403');
        }
    }
    public function save(Request $req){
		if($this->general->isCrudAllow($this->CRUD, "add")){
			$OldData=array();$NewData=array();$UomID="";
			$rules=array(
				'UCode' =>['required','max:50',new ValidUnique(array("TABLE"=>"tbl_uom","WHERE"=>" UCode='".$req->UCode."'"),"This Ucode  is already taken.")],
                'UName' =>['required','max:50',new ValidUnique(array("TABLE"=>"tbl_uom","WHERE"=>" UName='".$req->UName."'"),"This UName  is already taken.")],
                'UNameInTranslation' => 'required',
			)				;
			$message=array(
				'UCode.required'=>"UOM code is required",
				'UCode.min'=>"UOM code must be greater than 1 characters",
				'UCode.max'=>"UOM code Name may not be greater than 100 characters",
                'UName.required'=>"UOM Name is required",
				'UName.min'=>"UOM Name must be greater than 3 characters",
				'UName.max'=>"UOM Name may not be greater than 100 characters",
                'UNameInTranslation.required' => "UOM Name in Translation is required"
			);
			$validator = Validator::make($req->all(), $rules,$message);

			if ($validator->fails()) {
				return array('status'=>false,'message'=>"UOM Create Failed",'errors'=>$validator->errors());
			}
			DB::beginTransaction();
			try {
				$UomID=DocNum::getDocNum(docTypes::UOM->value,"",Helper::getCurrentFY());
				$data=array(
					"UID"=>$UomID,
					"UCode"=>$req->UCode,
					'UName'=>$req->UName,
                    "UNameInTranslation" => $req->UNameInTranslation,
					"ActiveStatus"=>$req->ActiveStatus,
					"CreatedBy"=>$this->UserID,
					"CreatedOn"=>date("Y-m-d H:i:s")
				);
				DB::Table('tbl_uom')->insert($data);
                $NewData=DB::table('tbl_uom')->where('UID',$UomID)->first();
                DocNum::updateDocNum(docTypes::UOM->value);
                DB::commit();
                $logData=array("Description"=>"New UOM Created ","ModuleName"=>$this->ActiveMenuName,"Action"=>cruds::ADD->value,"ReferID"=>$UomID,"OldData"=>$OldData,"NewData"=>$NewData,"UserID"=>$this->UserID,"IP"=>$req->ip());
                logs::Store($logData);
                return array('status'=>true,'message'=>"Uom Created Successfully");
            }catch(Exception $e) {
                logger($e);
                DB::rollback();
                return array('status'=>false,'message'=>"Uom Create Failed");
            }
		}else{
			return array('status'=>false,'message'=>'Access denined');
		}
	}
    public function update(Request $req,$UID){
		if($this->general->isCrudAllow($this->CRUD, "edit")){
			$rules=array(
				'UCode' =>['required','max:50',new ValidUnique(array("TABLE"=>"tbl_uom","WHERE"=>" UCode='".$req->UCode."' and UID<>'".$UID."' "),"This Ucode is already taken.")],
                'UName' =>['required','max:50',new ValidUnique(array("TABLE"=>"tbl_uom","WHERE"=>" UName='".$req->UName."' and UID<>'".$UID."'"),"This Uname is already taken.")],
                'UNameInTranslation' => 'required'
			);
            $message=array(
                'UCode.required'=>"UOM code is required",
                'UCode.min'=>"UOM code must be greater than 1 characters",
                'UCode.max'=>"UOM code Name may not be greater than 100 characters",
                'UName.required'=>"UOM Name is required",
                'UName.min'=>"UOM Name must be greater than 3 characters",
                'UName.max'=>"UOM Name may not be greater than 100 characters",
                'UNameInTranslation.required' => "UOM Name in Translation is required"
            );
			$validator = Validator::make($req->all(), $rules,$message);

			if ($validator->fails()) {
				return array('status'=>false,'message'=>"UOM Update Failed",'errors'=>$validator->errors());
			}
			DB::beginTransaction();
			try {
				$OldData=DB::table('tbl_uom')->where('UID',$UID)->first();

				$data=array(
					"UID"=>$UID,
					"UCode"=>$req->UCode,
					'UName'=>$req->UName,
					"ActiveStatus"=>$req->ActiveStatus,
					"UpdatedBy"=>$this->UserID,
					"UpdatedOn"=>date("Y-m-d H:i:s")
				);

                $newTranslations = json_decode($req->UNameInTranslation);
                $existingTranslations = json_decode($OldData->UNameInTranslation);
                if (!$existingTranslations) {
                    $existingTranslations = new stdClass();
                }
                foreach ($newTranslations as $lang => $value) {
                    $existingTranslations->$lang = $value;
                }
                $data['UNameInTranslation'] = json_encode($existingTranslations);

                DB::Table('tbl_uom')->where('UID',$UID)->update($data);
                DB::commit();
                $NewData=DB::table('tbl_uom')->where('UID',$UID)->first();
                $logData=array("Description"=>"UOM Updated ","ModuleName"=>$this->ActiveMenuName,"Action"=>cruds::UPDATE->value,"ReferID"=>$UID,"OldData"=>$OldData,"NewData"=>$NewData,"UserID"=>$this->UserID,"IP"=>$req->ip());
                logs::Store($logData);
                return array('status'=>true,'message'=>"UOM Updated Successfully");
            }catch(Exception $e) {
                logger($e);
                DB::rollback();
                return array('status'=>false,'message'=>"UOM Update Failed");
            }
		}else{
			return array('status'=>false,'message'=>'Access denied');
		}
	}

	public function GetUID(request $req)
    {
        return DB::table('tbl_uom')->where('ActiveStatus',1)->where('DFlag',0)->orderBy('UID','asc')->get();
	}

	public function Delete(Request $req,$UomID){
		if($this->general->isCrudAllow($this->CRUD, "delete")){
			DB::beginTransaction();
			try{
				$OldData=DB::table('tbl_uom')->where('UID',$UomID)->get();
				DB::table('tbl_uom')->where('UID',$UomID)->update(array("DFlag"=>1,"DeletedBy"=>$this->UserID,"DeletedOn"=>date("Y-m-d H:i:s")));
                DB::commit();
                $logData=array("Description"=>"Uom has been Deleted ","ModuleName"=>$this->ActiveMenuName,"Action"=>"Delete","ReferID"=>$UomID,"OldData"=>$OldData,"NewData"=>[],"UserID"=>$this->UserID,"IP"=>$req->ip());
                logs::Store($logData);
                return array('status'=>true,'message'=>"Uom Deleted Successfully");
            }catch(Exception $e) {
                logger($e);
                DB::rollback();
                return array('status'=>false,'message'=>"Uom Delete Failed");
            }
		}else{
			return response(array('status'=>false,'message'=>"Access Denied"), 403);
		}
	}
	public function Restore(Request $req,$UomID){
		$OldData=$NewData=array();
		if($this->general->isCrudAllow($this->CRUD, "restore")){
			DB::beginTransaction();
			$status=false;
			try{
				$OldData=DB::table('tbl_uom')->where('UID',$UomID)->get();
				$status=DB::table('tbl_uom')->where('UID',$UomID)->update(array("DFlag"=>0,"UpdatedBy"=>$this->UserID,"UpdatedOn"=>date("Y-m-d H:i:s")));
			}catch(Exception $e) {

			}
			if($status==true){
				DB::commit();
				$NewData=DB::table('tbl_uom')->where('UID',$UomID)->get();
				$logData=array("Description"=>"Uom has been Restored ","ModuleName"=>$this->ActiveMenuName,"Action"=>cruds::RESTORE->value,"ReferID"=>$UomID,"OldData"=>$OldData,"NewData"=>$NewData,"UserID"=>$this->UserID,"IP"=>$req->ip());
				logs::Store($logData);
				return array('status'=>true,'message'=>"Uom Restored Successfully");
			}else{
				DB::rollback();
				return array('status'=>false,'message'=>"Uom Restore Failed");
			}
		}else{
			return response(array('status'=>false,'message'=>"Access Denied"), 403);
		}
	}

	public function TableView(Request $request){
		if($this->general->isCrudAllow($this->CRUD, "view")){
			$columns = array(
				array( 'db' => 'UID', 'dt' => '0' ),
				array( 'db' => 'UName', 'dt' => '1' ),
                array( 'db' => 'UCode', 'dt' => '2' ),

				array(
						'db' => 'ActiveStatus',
						'dt' => '3',
						'formatter' => function( $d, $row ) {
							if($d=="Active"){
								return "<span class='badge badge-success m-1'>Active</span>";
							}else{
								return "<span class='badge badge-danger m-1'>Inactive</span>";
							}
						}
                    ),
				array(
						'db' => 'UID',
						'dt' => '4',
						'formatter' => function( $d, $row ) {
							$html='';
							if($this->general->isCrudAllow($this->CRUD,"edit")==true){
								$html.='<button type="button" data-id="'.$d.'" class="btn  btn-outline-success '.$this->general->UserInfo['Theme']['button-size'].'  mr-10 btnEdit" data-original-title="Edit"><i class="fa fa-pencil"></i></button>';
							}
							if($this->general->isCrudAllow($this->CRUD,"delete")==true){
								$html.='<button type="button" data-id="'.$d.'" class="btn  btn-outline-danger '.$this->general->UserInfo['Theme']['button-size'].' btnDelete" data-original-title="Delete"><i class="fa fa-trash" aria-hidden="true"></i></button>';
							}
							return $html;
						}
				)
			);
			$data=array();
			$data['POSTDATA']=$request;
			$data['TABLE']='tbl_uom';
			$data['PRIMARYKEY']='UID';
			$data['COLUMNS']=$columns;
			$data['COLUMNS1']=$columns;
			$data['GROUPBY']=null;
			$data['WHERERESULT']=null;
			$data['WHEREALL']=" DFlag=0 ";
			return SSP::SSP( $data);
		}else{
			return response(array('status'=>false,'message'=>"Access Denied"), 403);
		}
	}
	public function TrashTableView(Request $request){
		if($this->general->isCrudAllow($this->CRUD, "view")){
			$columns = array(
				array( 'db' => 'UID', 'dt' => '0' ),
				array( 'db' => 'UName', 'dt' => '1' ),
                array( 'db' => 'UCode', 'dt' => '2' ),

				array(
						'db' => 'ActiveStatus',
						'dt' => '3',
						'formatter' => function( $d, $row ) {
							if($d=="Active"){
								return "<span class='badge badge-success m-1'>Active</span>";
							}else{
								return "<span class='badge badge-danger m-1'>Inactive</span>";
							}
						}
                    ),
					array(
						'db' => 'UID',
						'dt' => '4',
						'formatter' => function( $d, $row ) {
							$html='<button type="button" data-id="'.$d.'" class="btn btn-outline-success '.$this->general->UserInfo['Theme']['button-size'].' m-2 btnRestore"> <i class="fa fa-repeat" aria-hidden="true"></i> </button>';
							return $html;
						}
				)
			);
			$data=array();
			$data['POSTDATA']=$request;
			$data['TABLE']='tbl_uom';
			$data['PRIMARYKEY']='UID';
			$data['COLUMNS']=$columns;
			$data['COLUMNS1']=$columns;
			$data['GROUPBY']=null;
			$data['WHERERESULT']=null;
			$data['WHEREALL']=" DFlag=1 ";
			return SSP::SSP( $data);
		}else{
			return response(array('status'=>false,'message'=>"Access Denied"), 403);
		}
	}

	public static function GetUOM(request $req){
		return DB::Table('tbl_uom')->where('ActiveStatus','Active')->where('DFlag',0)->get();
	}
}

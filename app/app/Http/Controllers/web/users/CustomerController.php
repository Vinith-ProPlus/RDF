<?php
namespace App\Http\Controllers\web\users;

use App\helper\helper;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Redirect;
use DocNum;
use general;
use SSP;
use DB;
use Auth;
use cruds;
use ValidUnique;
use logs;
use activeMenuNames;
use docTypes;

class CustomerController extends Controller{
    private $general;
    private $DocNum;
    private $UserID;
    private $ActiveMenuName;
    private $PageTitle;
    private $CRUD;
    private $logs;
    private $Settings;
    private $Menus;
    private $generalDB;
    private $FileTypes;

    public function __construct(){
        $this->ActiveMenuName=activeMenuNames::ManageCustomers->value;
        $this->PageTitle="Manage Customers";
        $this->middleware('auth');
        $this->middleware(function ($request, $next) {
            $this->UserID=auth()->user()->UserID;
            $this->general=new general($this->UserID,$this->ActiveMenuName);
            $this->Menus=$this->general->loadMenu();
            $this->CRUD=$this->general->getCrudOperations($this->ActiveMenuName);
            $this->Settings=$this->general->getSettings();
            $this->generalDB=Helper::getGeneralDB();
            $this->FileTypes=Helper::getFileTypes(array("category"=>array("Images")));
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
            $FormData['SETTINGS']=$this->Settings;
            return view('app.users.manage-customer.view',$FormData);
        }elseif($this->general->isCrudAllow($this->CRUD,"add")==true){
            return Redirect::to('/admin/users-and-permissions/manage-customers/customer/');
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
            return view('app.users.manage-customer.trash',$FormData);
        }elseif($this->general->isCrudAllow($this->CRUD,"view")==true){
            return Redirect::to('/admin/users-and-permissions/manage-customers/');
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
            $FormData['SETTINGS']=$this->Settings;
            $FormData['isEdit']=false;
            $FormData['FileTypes']=$this->FileTypes;
            return view('app.users.manage-customer.customer',$FormData);
        }elseif($this->general->isCrudAllow($this->CRUD,"view")==true){
            return Redirect::to('/admin/users-and-permissions/manage-customers/');
        }else{
            return view('errors.403');
        }
    }
    public function edit(Request $req,$CID){
        if($this->general->isCrudAllow($this->CRUD,"edit")==true){
            $FormData=$this->general->UserInfo;
            $FormData['menus']=$this->Menus;
            $FormData['crud']=$this->CRUD;
            $FormData['ActiveMenuName']=$this->ActiveMenuName;
            $FormData['PageTitle']=$this->PageTitle;
            $FormData['isEdit']=true;
            $FormData['SETTINGS']=$this->Settings;
            $FormData['CustomerID']=$CID;
            $FormData['FileTypes']=$this->FileTypes;
            $FormData['EditData'] = DB::table('tbl_customer')->where('DFlag',0)->Where('CustomerID',$CID)->first();
            if($FormData['EditData']){
//                if(isset($FormData['EditData']->PostalCodeID)) {
//                    $FormData['EditData']->PostalCode = DB::table($this->generalDB . 'tbl_postalcodes as P')->where('PID', $FormData['EditData']->PostalCodeID)->value('PostalCode');
                    $FormData['EditData']->SAddress = DB::table('tbl_customer_address as CA')->where('CustomerID', $CID)
                        ->join($this->generalDB . 'tbl_countries as C', 'C.CountryID', 'CA.CountryID')
                        ->join($this->generalDB . 'tbl_states as S', 'S.StateID', 'CA.StateID')
                        ->join($this->generalDB . 'tbl_districts as D', 'D.DistrictID', 'CA.DistrictID')
//				->join($this->generalDB.'tbl_taluks as T', 'T.TalukID', 'CA.TalukID')
                        ->join($this->generalDB . 'tbl_cities as CI', 'CI.CityID', 'CA.CityID')
                        ->join($this->generalDB . 'tbl_postalcodes as PC', 'PC.PID', 'CA.PostalCodeID')
                        ->select('CA.AID as AID', 'CA.Address', 'CA.isDefault', 'CA.CountryID', 'C.CountryName', 'CA.StateID', 'S.StateName', 'CA.DistrictID', 'D.DistrictName', 'CA.CityID', 'CI.CityName', 'CA.PostalCodeID', 'PC.PostalCode')
                        ->get();
//                }
                return view('app.users.manage-customer.customer',$FormData);
            }else{
                return view('errors.403');
            }
        }elseif($this->general->isCrudAllow($this->CRUD,"view")==true){
            return Redirect::to('/admin/users-and-permissions/manage-customers/edit');
        }else{
            return view('errors.403');
        }
    }

    public function getCustomerType(request $req){
        return DB::Table('tbl_customer_type')->where('ActiveStatus',"Active")->where('DFlag',0)->get();
    }
    public function getCustomerCategory(request $req){
        return DB::Table('tbl_customer_category')->where('ActiveStatus',"Active")->where('DFlag',0)->get();
    }
    public function getCustomerSubCategory(request $req){
        return DB::Table('tbl_customer_subcategory')->where('CID',$req->CID)->where('ActiveStatus',"Active")->where('DFlag',0)->get();
    }
    public function getLeadSource(request $req){
        return DB::Table('tbl_leadsource')->where('ActiveStatus',"Active")->where('DFlag',0)->get();
    }
    public function Save(Request $req){
        if($this->general->isCrudAllow($this->CRUD,"add")==true){
            $OldData=array();$NewData=array();$CustomerID="";
            $ValidDB=array();

            $rules=array(
                'MobileNo1' =>['required','max:10',new ValidUnique(array("TABLE"=>"tbl_customer","WHERE"=>" MobileNo1='".$req->MobileNo1."'  "),"This Mobile Number is already taken.")],
                'Email' =>['required','max:50',new ValidUnique(array("TABLE"=>"tbl_customer","WHERE"=>" Email='".$req->Email."'  "),"This Email is already taken.")],
            );
            if($req->hasFile('CustomerImage')){
                $rules['CustomerImage']='mimes:'.implode(",",$this->FileTypes['category']['Images']);
            }

            $message=array(
                'CustomerImage.mimes'=>"The Customer Image field must be a file of type: ".implode(", ",$this->FileTypes['category']['Images'])."."
            );
            $validator = Validator::make($req->all(), $rules,$message);

            if ($validator->fails()) {
                return array('status'=>false,'message'=>"Customer Create Failed",'errors'=>$validator->errors());
            }
            DB::beginTransaction();
            $status=false;
            try {
                $SAddress=json_decode($req->SAddress,true);
                $CustomerID=DocNum::getDocNum(docTypes::Customer->value,"",Helper::getCurrentFY());
                $CustomerImage="";
                $dir="uploads/user-and-permissions/customers/".$CustomerID."/";
                if (!file_exists( $dir)) {mkdir( $dir, 0777, true);}
                if($req->hasFile('CustomerImage')){
                    $file = $req->file('CustomerImage');
                    $fileName=md5($file->getClientOriginalName() . time());
                    $fileName1 =  $fileName. "." . $file->getClientOriginalExtension();
                    $file->move($dir, $fileName1);
                    $CustomerImage=$dir.$fileName1;
                }else if(Helper::isJSON($req->CustomerImage)==true){
                    $Img=json_decode($req->CustomerImage);
                    if(file_exists($Img->uploadPath)){
                        $fileName1=$Img->fileName!=""?$Img->fileName:Helper::RandomString(10)."png";
                        copy($Img->uploadPath,$dir.$fileName1);
                        $CustomerImage=$dir.$fileName1;
                        unlink($Img->uploadPath);
                    }
                }
                if(file_exists($CustomerImage)){
                    $images=helper::ImageResize($CustomerImage,$dir);
                }
                $data=array(
                    "CustomerID"=>$CustomerID,
                    "CustomerName"=>$req->CustomerName,
                    "nick_name"=>$req->nick_name,
                    'CustomerImage'=>$CustomerImage,
                    "MobileNo1"=>$req->MobileNo1,
//                    "MobileNo2"=>$req->MobileNo2,
                    "Email"=>$req->Email,
                    "otp"=>1234,
//                    "CusTypeID"=>$req->CusTypeID,
//                    "Address"=>$req->Address,
//                    "PostalCodeID"=>$req->PostalCodeID,
//                    "CityID"=>$req->CityID,
////					"TalukID"=>$req->TalukID,
//                    "DistrictID"=>$req->DistrictID,
//                    "StateID"=>$req->StateID,
//                    "CountryID"=>$req->CountryID,
                    "ActiveStatus"=>$req->ActiveStatus,
                    "CreatedBy"=>$this->UserID,
                    "CreatedOn"=>date("Y-m-d H:i:s")
                );
                $status=DB::Table('tbl_customer')->insert($data);
                if($status){
                    foreach($SAddress as $row){
                        $AID=DocNum::getDocNum(docTypes::CustomerAddress->value,"",Helper::getCurrentFY());
                        $tmp=array(
                            "AID"=>$AID,
                            "CustomerID"=>$CustomerID,
                            "Address"=>$row['Address'],
                            "PostalCodeID"=>$row['PostalCodeID'],
                            "CityID"=>$row['CityID'],
//							"TalukID"=>$row['TalukID'],
                            "DistrictID"=>$row['DistrictID'],
                            "StateID"=>$row['StateID'],
                            "CountryID"=>$row['CountryID'],
                            "isDefault"=>$row['isDefault'],
                            "CreatedOn"=>date("Y-m-d H:i:s")
                        );
                        $status=DB::Table('tbl_customer_address')->insert($tmp);
                        if($status==true){
                            DocNum::updateDocNum(docTypes::CustomerAddress->value);
                        }
                    }
                }
            }catch(Exception $e) {
                $status=false;
            }
            if($status==true){
                DocNum::updateDocNum(docTypes::Customer->value);
                $NewData=(array)DB::table('tbl_customer as C')->join('tbl_customer_address as CA','CA.CustomerID','C.CustomerID')->where('CA.CustomerID',$CustomerID)->get();
                $logData=array("Description"=>"New Customer Created","ModuleName"=>"Customer","Action"=>"Add","ReferID"=>$CustomerID,"OldData"=>$OldData,"NewData"=>$NewData,"UserID"=>$this->UserID,"IP"=>$req->ip());
                logs::Store($logData);
                DB::commit();
                return array('status'=>true,'message'=>"Customer Created Successfully");
            }else{
                DB::rollback();
                return array('status'=>false,'message'=>"Customer Create Failed");
            }
        }else{
            return array('status'=>false,'message'=>'Access denined');
        }
    }
    public function Update(Request $req,$CustomerID){
        if($this->general->isCrudAllow($this->CRUD, "edit")){
            $OldData=DB::table('tbl_customer_address as CA')->join('tbl_customer as C','C.CustomerID','CA.CustomerID')->where('CA.CustomerID',$CustomerID)->get();
            $NewData=array();

            $rules=array(
                'MobileNo1' =>['required','max:10',new ValidUnique(array("TABLE"=>"tbl_customer","WHERE"=>" MobileNo1='".$req->MobileNo1."' and CustomerID <> '".$CustomerID."' "),"This Mobile Number is already taken.")],
                'Email' =>['required','max:50',new ValidUnique(array("TABLE"=>"tbl_customer","WHERE"=>" Email='".$req->Email."' and CustomerID <> '".$CustomerID."' "),"This Email is already taken.")],
            );

            $message=array();
            $validator = Validator::make($req->all(), $rules,$message);

            if ($validator->fails()) {
                return array('status'=>false,'message'=>"Customer Update Failed",'errors'=>$validator->errors());
            }
            DB::beginTransaction();
            $status=false;
            $currCustomerImage=array();
            $images=array();
            try {
                $SAddress=json_decode($req->SAddress,true);
                $CustomerImage="";
                $dir="uploads/user-and-permissions/customers/".$CustomerID."/";
                if (!file_exists( $dir)) {mkdir( $dir, 0777, true);}
                if($req->hasFile('CustomerImage')){
                    $file = $req->file('CustomerImage');
                    $fileName=md5($file->getClientOriginalName() . time());
                    $fileName1 =  $fileName. "." . $file->getClientOriginalExtension();
                    $file->move($dir, $fileName1);
                    $CustomerImage=$dir.$fileName1;
                }else if(Helper::isJSON($req->CustomerImage)==true){
                    $Img=json_decode($req->CustomerImage);
                    if(file_exists($Img->uploadPath)){
                        $fileName1=$Img->fileName!=""?$Img->fileName:Helper::RandomString(10)."png";
                        copy($Img->uploadPath,$dir.$fileName1);
                        $CustomerImage=$dir.$fileName1;
                        unlink($Img->uploadPath);
                    }
                }
                if(file_exists($CustomerImage)){
                    $images=Helper::ImageResize($CustomerImage,$dir);
                }
                if(($CustomerImage!="" || intval($req->removeCustomerImage)==1) && Count($OldData)>0){
                    $currCustomerImage=$OldData[0]->CustomerImage!=""?unserialize($OldData[0]->CustomerImage):array();
                }
                $data=array(
                    "CustomerName"=>$req->CustomerName,
                    "MobileNo1"=>$req->MobileNo1,
//                    "MobileNo2"=>$req->MobileNo2,
                    "Email"=>$req->Email,
                    "nick_name"=>$req->nick_name,
//                    "CusTypeID"=>$req->CusTypeID,
//                    "Address"=>$req->Address,
//                    "PostalCodeID"=>$req->PostalCodeID,
//                    "CityID"=>$req->CityID,
////					"TalukID"=>$req->TalukID,
//                    "DistrictID"=>$req->DistrictID,
//                    "StateID"=>$req->StateID,
//                    "CountryID"=>$req->CountryID,
                    "ActiveStatus"=>$req->ActiveStatus,
                    "UpdatedBy"=>$this->UserID,
                    "UpdatedOn"=>date("Y-m-d H:i:s")
                );
                if($CustomerImage!=""){
                    $data['CustomerImage']=$CustomerImage;
//                    $data['CustomerImage']=serialize($images);
                }else if(intval($req->removeCustomerImage)==1){
                    $data['CustomerImage']="";
//                    $data['CustomerImage']=serialize(array());
                }
                $status=DB::Table('tbl_customer')->where('CustomerID',$CustomerID)->update($data);
                if($status){
                    $AIDs=[];
                    foreach($SAddress as $row){
                        if($row['AID']){
                            $AIDs[] = $row['AID'];
                            $data=array(
                                "Address"=>$row['Address'],
                                "PostalCodeID"=>$row['PostalCodeID'],
                                "CityID"=>$row['CityID'],
//								"TalukID"=>$row['TalukID'],
                                "DistrictID"=>$row['DistrictID'],
                                "StateID"=>$row['StateID'],
                                "CountryID"=>$row['CountryID'],
                                "isDefault"=>$row['isDefault'],
                                "UpdatedOn"=>date("Y-m-d H:i:s")
                            );
                            $status=DB::Table('tbl_customer_address')->where('CustomerID',$CustomerID)->where('AID',$row['AID'])->update($data);
                        }else{
                            $AID=DocNum::getDocNum(docTypes::CustomerAddress->value,"",Helper::getCurrentFY());
                            $AIDs[] = $AID;
                            $tmp=array(
                                "AID"=>$AID,
                                "CustomerID"=>$CustomerID,
                                "Address"=>$row['Address'],
                                "PostalCodeID"=>$row['PostalCodeID'],
                                "CityID"=>$row['CityID'],
//								"TalukID"=>$row['TalukID'],
                                "DistrictID"=>$row['DistrictID'],
                                "StateID"=>$row['StateID'],
                                "CountryID"=>$row['CountryID'],
                                "isDefault"=>$row['isDefault'],
                                "CreatedOn"=>date("Y-m-d H:i:s")
                            );
                            $status=DB::Table('tbl_customer_address')->insert($tmp);
                            if($status==true){
                                DocNum::updateDocNum(docTypes::CustomerAddress->value);
                            }
                        }
                    }
                }

                if(count($AIDs)>0){
                    DB::table('tbl_customer_address')->where('CustomerID',$CustomerID)->whereNotIn('AID',$AIDs)->delete();
                }
            }catch(Exception $e) {
                $status=false;
            }
            if($status==true){
                $NewData=DB::table('tbl_customer_address as CA')->join('tbl_customer as C','C.CustomerID','CA.CustomerID')->where('CA.CustomerID',$CustomerID)->get();
                $logData=array("Description"=>"New Customer Updated ","ModuleName"=>"Customer","Action"=>"Update","ReferID"=>$CustomerID,"OldData"=>$OldData,"NewData"=>$NewData,"UserID"=>$this->UserID,"IP"=>$req->ip());
                logs::Store($logData);
                DB::commit();
                foreach($currCustomerImage as $KeyName=>$Img){
                    Helper::removeFile($Img['url']);
                }
                return array('status'=>true,'message'=>"Customer Updated Successfully");
            }else{
                DB::rollback();
                return array('status'=>false,'message'=>"Customer Update Failed");
            }
        }else{
            return array('status'=>false,'message'=>'Access denied');
        }
    }

    public function Delete(Request $req,$CID){
        $OldData=$NewData=array();
        if($this->general->isCrudAllow($this->CRUD,"delete")==true){
            DB::beginTransaction();
            $status=false;
            try{
                $OldData=DB::table('tbl_customer')->where('CustomerID',$CID)->get();
                $status=DB::table('tbl_customer')->where('CustomerID',$CID)->update(array("DFlag"=>1,"DeletedBy"=>$this->UserID,"DeletedOn"=>date("Y-m-d H:i:s")));
            }catch(Exception $e) {

            }
            if($status==true){
                DB::commit();
                $logData=array("Description"=>"Customer has been Deleted ","ModuleName"=>"Customer","Action"=>"Delete","ReferID"=>$CID,"OldData"=>$OldData,"NewData"=>$NewData,"UserID"=>$this->UserID,"IP"=>$req->ip());
                logs::Store($logData);
                return array('status'=>true,'message'=>"Customer Deleted Successfully");
            }else{
                DB::rollback();
                return array('status'=>false,'message'=>"Customer Delete Failed");
            }
        }else{
            return response(array('status'=>false,'message'=>"Access Denied"), 403);
        }
    }
    public function Restore(Request $req,$CID){
        $OldData=$NewData=array();
        if($this->general->isCrudAllow($this->CRUD,"restore")==true){
            DB::beginTransaction();
            $status=false;
            try{
                $OldData=DB::table('tbl_customer')->where('CustomerID',$CID)->get();
                $status=DB::table('tbl_customer')->where('CustomerID',$CID)->update(array("DFlag"=>0,"UpdatedBy"=>$this->UserID,"UpdatedOn"=>date("Y-m-d H:i:s")));
            }catch(Exception $e) {

            }
            if($status==true){
                DB::commit();
                $NewData=DB::table('tbl_customer')->where('CustomerID',$CID)->get();
                $logData=array("Description"=>"Customer has been Restored ","ModuleName"=>"Customer","Action"=>"Restore","ReferID"=>$CID,"OldData"=>$OldData,"NewData"=>$NewData,"UserID"=>$this->UserID,"IP"=>$req->ip());
                logs::Store($logData);
                return array('status'=>true,'message'=>"Customer Restored Successfully");
            }else{
                DB::rollback();
                return array('status'=>false,'message'=>"Customer Restore Failed");
            }
        }else{
            return response(array('status'=>false,'message'=>"Access Denied"), 403);
        }
    }
    public function TableView(Request $request){
        if($this->general->isCrudAllow($this->CRUD, "view")){
            $columns = array(
                array( 'db' => 'CustomerName', 'dt' => '0' ),
                array( 'db' => 'nick_name', 'dt' => '1' ),
                array( 'db' => 'MobileNo1', 'dt' => '2' ),
                array( 'db' => 'Email', 'dt' => '3' ),
                array( 'db' => 'ActiveStatus', 'dt' => '4',
                    'formatter' => function( $d, $row ) {
                        if($d=="Active"){
                            return "<span class='badge badge-success m-1'>Active</span>";
                        }else{
                            return "<span class='badge badge-danger m-1'>Inactive</span>";
                        }
                    }
                ),
                array( 'db' => 'CustomerID', 'dt' => '5',
                    'formatter' => function( $d, $row ) {
                        $html='';
                        if($this->general->isCrudAllow($this->CRUD,"edit")==true){
                            $html.='<button type="button" data-id="'.$d.'" class="btn  btn-outline-success btn-sm -success mr-10 btnEdit" data-original-title="Edit"><i class="fa fa-pencil"></i></button>';
                        }
                        if($this->general->isCrudAllow($this->CRUD,"delete")==true){
                            $html.='<button type="button" data-id="'.$d.'" class="btn  btn-outline-danger btn-sm -success btnDelete" data-original-title="Delete"><i class="fa fa-trash" aria-hidden="true"></i></button>';
                        }
                        return $html;
                    }
                )
            );
            $data=array();
            $data['POSTDATA']=$request;
            $data['TABLE']='tbl_customer';
            $data['PRIMARYKEY']='CustomerID';
            $data['COLUMNS']=$columns;
            $data['COLUMNS1']=$columns;
            $data['GROUPBY']=null;
            $data['WHERERESULT']=null;
            $data['WHEREALL']=" DFlag=0";
            return SSP::SSP( $data);
        }else{
            return response(array('status'=>false,'message'=>"Access Denied"), 403);
        }
    }
    public function TrashTableView(Request $request){
        if($this->general->isCrudAllow($this->CRUD,"restore")==true){
            $columns = array(
                array( 'db' => 'CustomerName', 'dt' => '0' ),
                array( 'db' => 'nick_name', 'dt' => '1' ),
                array( 'db' => 'MobileNo1', 'dt' => '2' ),
                array( 'db' => 'Email', 'dt' => '3' ),
                array( 'db' => 'ActiveStatus', 'dt' => '4',
                    'formatter' => function( $d, $row ) {
                        if($d=="Active"){
                            return "<span class='badge badge-success m-1'>Active</span>";
                        }else{
                            return "<span class='badge badge-danger m-1'>Inactive</span>";
                        }
                    }
                ),
                array(
                    'db' => 'CustomerID',
                    'dt' => '5',
                    'formatter' => function( $d, $row ) {
                        $html='<button type="button" data-id="'.$d.'" class="btn btn-outline-success btn-sm  m-2 btnRestore"> <i class="fa fa-repeat" aria-hidden="true"></i> </button>';
                        return $html;
                    }
                )
            );
            $data=array();
            $data['POSTDATA']=$request;
            $data['TABLE']='tbl_customer';
            $data['PRIMARYKEY']='CustomerID';
            $data['COLUMNS']=$columns;
            $data['COLUMNS1']=$columns;
            $data['GROUPBY']=null;
            $data['WHERERESULT']=null;
            $data['WHEREALL']=" DFlag=1";
            return SSP::SSP( $data);
        }else{
            return response(array('status'=>false,'message'=>"Access Denied"), 403);
        }
    }
    public function addressView(Request $req){
        $FormData=$this->general->UserInfo;
        $FormData['data']=json_decode($req->data,true);
        if(!array_key_exists("uuid",$FormData['data'])){
            $FormData['data']['uuid']=$this->general->RandomString(5);
        }
        return view('app.users.manage-customer.address',$FormData);
    }
}


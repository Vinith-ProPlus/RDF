<?php
namespace App\Http\Controllers\web\Settings;

use App\enums\activeMenuNames;
use App\Http\Controllers\Controller;
use App\Models\MobileUpdate;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Redirect;
use DocNum;
use general;
use SSP;
use Auth;
use ValidUnique;
use logs;
use Helper;
use docTypes;
use cruds;
class MobileVersionController extends Controller{
    private $general;
    private $DocNum;
    private $UserID;
    private $ActiveMenuName;
    private $PageTitle;
    private $CRUD;
    private $Settings;
    private $FileTypes;
    private $Menus;
    private $generalDB;

    public function __construct()
    {
        $this->ActiveMenuName = "Mobile-Version";
        $this->PageTitle = "Mobile Version Update";
        $this->middleware('auth');
        $this->FileTypes = Helper::getFileTypes(array("category" => array("Images")));
        $this->middleware(function ($request, $next) {
            $this->generalDB = Helper::getGeneralDB();
            $this->UserID = auth()->user()->UserID;
            $this->general = new general($this->UserID, $this->ActiveMenuName);
            $this->Menus = $this->general->loadMenu();
            $this->CRUD = $this->general->getCrudOperations($this->ActiveMenuName);
            $this->Settings = $this->general->getSettings();
            return $next($request);
        });
    }
    public function edit(Request $req){
        if($this->general->isCrudAllow($this->CRUD,"edit")==true){
            $FormData=$this->general->UserInfo;
            $FormData['menus']=$this->Menus;
            $FormData['crud']=$this->CRUD;
            $FormData['ActiveMenuName']=$this->ActiveMenuName;
            $FormData['PageTitle']=$this->PageTitle;
            $FormData['isEdit']=true;
            $FormData['FileTypes']=$this->FileTypes;
            $FormData['EditData']=DB::Table('tbl_mobile_version')->first();
            return view('app.settings.mobile_version.version',$FormData);
        }else{
            return view('errors.403');
        }
    }
    public function Update1(Request $req){
        // return $req;
        if($this->general->isCrudAllow($this->CRUD,"edit")==true){
            $OldData=array();$NewData=array();
            $rules=array();
            $message=array(
                'CompanyLogo.mimes'=>"The Company Logo field must be a file of type: ".implode(", ",$this->FileTypes['category']['Images'])."."
            );
            if($req->hasFile('CompanyLogo')){
                $rules['CompanyLogo']='mimes:'.implode(",",$this->FileTypes['category']['Images']);
            }
            $validator = Validator::make($req->all(), $rules,$message);
            if ($validator->fails()) {
                return array('status'=>false,'message'=>"Brand Update Failed",'errors'=>$validator->errors());
            }
            DB::beginTransaction();
            $status=false;
            $currBLogo=array();
            $images=array();
            try {
                $OldData=DB::table('tbl_company_settings')->get();
                return $OldData;
                $CompanyLogo="";
                $dir="assets/images/logo/";
                if (!file_exists( $dir)) {mkdir( $dir, 0777, true);}
                if($req->hasFile('CompanyLogo')){
                    $file = $req->file('CompanyLogo');
                    $fileName=md5($file->getClientOriginalName() . time());
                    $fileName1 =  $fileName. "." . $file->getClientOriginalExtension();
                    $file->move($dir, $fileName1);
                    $CompanyLogo=$dir.$fileName1;
                }else if(Helper::isJSON($req->CompanyLogo)==true){
                    $Img=json_decode($req->CompanyLogo);
                    if(file_exists($Img->uploadPath)){
                        $fileName1="logo.png";
                        copy($Img->uploadPath,$dir.$fileName1);
                        $CompanyLogo=$dir.$fileName1;
                        unlink($Img->uploadPath);
                    }
                }
                if(file_exists($CompanyLogo)){
                    $images=helper::ImageResize($CompanyLogo,$dir);
                }
                if(($CompanyLogo!="" || intval($req->removeCompanyLogo)==1) && Count($OldData)>0){
                    $currBLogo=$OldData[0]->Images!=""?unserialize($OldData[0]->Images):array();
                }
                $data=array(
                    "BrandName"=>$req->BrandName,
                    "ActiveStatus"=>$req->ActiveStatus,
                    "UpdatedBy"=>$this->UserID,
                    "UpdatedOn"=>date("Y-m-d H:i:s")
                );
                if($CompanyLogo!=""){
                    $data['CompanyLogo']=$CompanyLogo;
                    $data['Images']=serialize($images);
                }else if(intval($req->removeCompanyLogo)==1){
                    $data['CompanyLogo']="";
                    $data['Images']=serialize(array());
                }
                $status=DB::Table('tbl_company_settings')->where('BrandID',$BrandID)->update($data);
            }catch(Exception $e) {
                $status=false;
            }

            if($status==true){
                DB::commit();
                $NewData=DB::table('tbl_company_settings')->where('BrandID',$BrandID)->get();
                $logData=array("Description"=>"Brand Updated ","ModuleName"=>$this->ActiveMenuName,"Action"=>cruds::UPDATE->value,"ReferID"=>$BrandID,"OldData"=>$OldData,"NewData"=>$NewData,"UserID"=>$this->UserID,"IP"=>$req->ip());
                logs::Store($logData);
                //Helper::removeFile($currBLogo);

                foreach($currBLogo as $KeyName=>$Img){
                    Helper::removeFile($Img['url']);
                }
                return array('status'=>true,'message'=>"Brand Updated Successfully");
            }else{
                DB::rollback();
                foreach($images as $KeyName=>$Img){
                    Helper::removeFile($Img['url']);
                }
                return array('status'=>false,'message'=>"Brand Update Failed");
            }
        }else{
            return array('status'=>false,'message'=>'Access denined');
        }
    }

    public function Update(Request $req)
    {
        $OldData = $NewData = array();
        if ($this->general->isCrudAllow($this->CRUD, "edit") == true) {
            $rules = array();
            $message = array(
                'VersionLogo.mimes' => "The Version Logo field must be a file of type: " . implode(", ", $this->FileTypes['category']['Images']) . "."
            );
            if ($req->hasFile('VersionLogo')) {
                $rules['VersionLogo'] = 'mimes:' . implode(",", $this->FileTypes['category']['Images']);
            }
            $validator = Validator::make($req->all(), $rules, $message);
            if ($validator->fails()) {
                return array('status' => false, 'message' => "Brand Update Failed", 'errors' => $validator->errors());
            }
            DB::beginTransaction();
            try {
                $OldData = MobileUpdate::first();
                $VersionLogo = "";
                $dir = "assets/images/version_logo/";
                if (!file_exists($dir)) {
                    mkdir($dir, 0777, true);
                }
                if ($req->hasFile('VersionLogo')) {
                    $file = $req->file('VersionLogo');
                    $fileName = md5($file->getClientOriginalName() . time());
                    $fileName1 = $fileName . "." . $file->getClientOriginalExtension();
                    $file->move($dir, $fileName1);
                    $VersionLogo = $dir . $fileName1;
                } else if (Helper::isJSON($req->VersionLogo) == true) {
                    $Img = json_decode($req->VersionLogo);
                    if (file_exists($Img->uploadPath)) {
                        $fileName1 = "logo.png";
                        copy($Img->uploadPath, $dir . $fileName1);
                        $VersionLogo = $dir . $fileName1;
                        unlink($Img->uploadPath);
                    }
                }
                if (file_exists($VersionLogo)) {
                    $images = helper::ImageResize($VersionLogo, $dir);
                }
                if (intval($req->removeVersionLogo) == 1) {
                    $VersionLogo = "";
                }
                $data = [
                    'title' => $req->title,
                'description' => $req->description,
                'current_version' => $req->current_version,
                'new_version' => $req->new_version,
                'android_link' => $req->android_link,
                'ios_link' => $req->ios_link,
                'submit_text' => $req->submit_text,
                'ignore_text' => $req->ignore_text,
                'update_type' => $req->update_type,
                'update_to' => $req->update_to,
                ];
                if ($VersionLogo != "") {
                    $data['logo'] = $VersionLogo;
                    $data['Images'] = serialize($images);
                } else if (intval($req->removeVersionLogo) == 1) {
                    $data['logo'] = "";
                    $data['Images'] = serialize(array());
                }
                MobileUpdate::first()->update($data);
                DB::commit();
                $NewData = MobileUpdate::first();
                $logData = array("Description" => "Mobile Version Updated ", "ModuleName" => "Settings", "Action" => "Update", "ReferID" => "Settings", "OldData" => $OldData, "NewData" => $NewData, "UserID" => $this->UserID, "IP" => $req->ip());
                logs::Store($logData);
                return array('status' => true, 'message' => "Mobile Version Updated Successfully");
            } catch (Exception $e) {
                logger($e);
                DB::rollback();
                return array('status' => false, 'message' => "Mobile Version Update Failed");
            }
        } else {
            return response(array('status' => false, 'message' => "Access Denied"), 403);
        }
    }
}

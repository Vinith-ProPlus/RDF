<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use DB;
use URL;
use Helper;
use DocNum;
use docTypes;

class general extends Model{
    use HasFactory;
    public $UserInfo;
	private $UserID;
	private $ActiveMenuName;
	public $FY;
	public $FYDB;
	public $generalDB;
	public function __construct($UserID,$ActiveMenuName){
		$this->UserID=$UserID;
		$this->ActiveMenuName=$ActiveMenuName;
		$this->generalDB=Helper::getGeneralDB();
		$this->FY=Helper::getActiveFinancialYear();
		$this->FYDB=$this->FY->DBName!=""?$this->FY->DBName.".":"";
		$this->UserInfo=array("UInfo"=>array());
		$result=$this->getUserInfo($this->UserID);
		if(count($result)>0){
			if (!file_exists(__DIR__.$result[0]->ProfileImage)) {
				$result[0]->ProfileImage="";
			}
            $profileImage = auth()->user()->ProfileImage;
            if (($profileImage == "") || ($profileImage == null) || !file_exists("profile_images/" . $profileImage)) {
                if (strtolower($result[0]->Gender) == "female") {
                    $result[0]->ProfileImage = "assets/images/female-icon.png";
                } else {
                    $result[0]->ProfileImage = "assets/images/male-icon.png";
                }
            } else {
                $result[0]->ProfileImage = "profile_images/" . $profileImage;
            }
			$this->UserInfo['UInfo']=$result[0];
			$this->UserInfo['CRUD']=$this->getUserRights($result[0]->RoleID);
		}
		$this->UserInfo['Theme']=$this->getThemesOption($this->UserID);
		$this->UserInfo['Settings']=$this->getSettings();
		$this->UserInfo['Company']=$this->getCompanySettings();
		$this->UserInfo['FY']=$this->FY;
	}
	public function getUserInfo($UserID){
		$return=array();
		$sql="Select U.ID,U.UserID,U.RoleID,UR.RoleName,U.Name,U.EMail,U.FirstName,U.LastName,U.DOB,U.GenderID,G.Gender,U.Address,U.CityID,CI.CityName,U.StateID,S.StateName,U.CountryID,CO.CountryName,CO.PhoneCode,U.PostalCodeID,PC.PostalCode,U.EMail,U.MobileNumber,U.ProfileImage,U.ActiveStatus,U.DFlag From users AS U  left join ".$this->generalDB."tbl_cities AS CI On CI.CityID=U.CityID Left Join ".$this->generalDB."tbl_countries AS CO ON CO.CountryID=U.CountryID LEFT JOIN ".$this->generalDB."tbl_states as S On S.StateID=U.StateID  Left Join ".$this->generalDB."tbl_postalcodes as PC On PC.PID=U.PostalCodeID Left Join ".$this->generalDB."tbl_genders as G On G.GID=U.GenderID Left join tbl_user_roles as UR ON UR.RoleID=U.RoleID Where U.UserID='".$UserID."'";
		$return=DB::select($sql);
		return $return;
    }
    public function getThemesOption($UserID){
    	$return=array("button-size"=>"btn-sm","table-size"=>"table-sm","input-size"=>"","switch-size"=>"");
    	$result=DB::Table('tbl_user_theme')->where('UserID',$UserID)->get();
    	if(count($result)>0){
    		for($i=0;$i<count($result);$i++){
    			$return[$result[$i]->Theme_option]=$result[$i]->Theme_Value;
    		}
    	}
    	return $return;
    }
	public function getCompanySettings(){
		$settings=array("FullAddress"=>"","CountryName"=>"","CallCode"=>"","StateName"=>"","CityName"=>"","PostalCode"=>"","BankName"=>"","BankBranchName"=>"","IFSCCode"=>"","MICR"=>"","AccountType"=>"");
		$result=DB::Table('tbl_company_settings')->get();
		for($i=0;$i<count($result);$i++){
			if(strtolower($result[$i]->SType)=="serialize"){
				$settings[$result[$i]->KeyName]=unserialize($result[$i]->KeyValue);
			}elseif(strtolower($result[$i]->SType)=="json"){
				$settings[$result[$i]->KeyName]=json_decode($result[$i]->KeyValue,true);
			}elseif(strtolower($result[$i]->SType)=="boolean"){
				$settings[$result[$i]->KeyName]=intval($result[$i]->KeyValue)==1?true:false;
			}elseif(strtolower($result[$i]->SType)=="number"){
				$settings[$result[$i]->KeyName]=floatval($result[$i]->KeyValue);
			}else{
				$settings[$result[$i]->KeyName]=$result[$i]->KeyValue;
			}
		}
		$Address="";
		if(array_key_exists("CountryID",$settings)){
			$tmp=Helper::getCountry(array("CountryID"=>$settings["CountryID"]));
			if(count($tmp)>0){$settings['CountryName']=$tmp[0]->CountryName;$settings['CallCode']=$tmp[0]->PhoneCode;}
		}
		if(array_key_exists("StateID",$settings)){
			$tmp=Helper::getState(array("StateID"=>$settings["StateID"]));
			if(count($tmp)>0){$settings['StateName']=$tmp[0]->StateName;}
		}
		if(array_key_exists("CityID",$settings)){
			$tmp=Helper::getCity(array("CityID"=>$settings["CityID"]));
			if(count($tmp)>0){$settings['CityName']=$tmp[0]->CityName;}
		}
		if(array_key_exists("PostalCodeID",$settings)){
			$tmp=Helper::getPostalCode(array("PostalCodeID"=>$settings["PostalCodeID"]));
			if(count($tmp)>0){$settings['PostalCode']=$tmp[0]->PostalCode;}
		}
		if(array_key_exists("BankName",$settings)){
			$settings["BankID"]=$settings['BankName'];
			$tmp=Helper::getBanks(array("BankID"=>$settings["BankID"]));
			if(count($tmp)>0){$settings['BankName']=$tmp[0]->NameOfBanks;}
		}
		if(array_key_exists("BankBranchName",$settings)){
			$settings["BankBranchID"]=$settings['BankBranchName'];
			$tmp=Helper::getBankBranch(array("BranchID"=>$settings["BankBranchID"]));
			if(count($tmp)>0){
				$settings['BankBranchName']=$tmp[0]->BranchName;
				$settings['IFSCCode']=$tmp[0]->IFSCCode;
				$settings['MICR']=$tmp[0]->MICR;
			}
		}
		if(array_key_exists("BankAccountType",$settings)){
			$settings["BankAccountTypeID"]=$settings['BankAccountType'];
			$tmp=Helper::getBankAccountType(array("AccountTypeID"=>$settings["BankAccountTypeID"]));
			if(count($tmp)>0){$settings['BankAccountType']=$tmp[0]->AccountType;}
		}

		if($settings['Address']!=""){$Address=$settings['Address'];}
		if($settings['CityName']!=""){ if($Address!=""){$Address.=", ";} $Address.=$settings['CityName'];}
		if($settings['StateName']!=""){ if($Address!=""){$Address.=", ";} $Address.=$settings['StateName'];}
		if($settings['CountryName']!=""){ if($Address!=""){$Address.=", ";} $Address.=$settings['CountryName'];}
		if($settings['PostalCode']!=""){ if($Address!=""){$Address.=" - ";} $Address.=$settings['PostalCode'];}
		$settings['FullAddress']=$Address;
		return $settings;
	}
	public function getSettings(){
		$settings=array(
				);
		$result=DB::Table('tbl_settings')->get();
		for($i=0;$i<count($result);$i++){
			if(strtolower($result[$i]->SType)=="serialize"){
				$settings[$result[$i]->KeyName]=unserialize($result[$i]->KeyValue);
			}elseif(strtolower($result[$i]->SType)=="json"){
				$settings[$result[$i]->KeyName]=json_decode($result[$i]->KeyValue,true);
			}else{
				$settings[$result[$i]->KeyName]=$result[$i]->KeyValue;
			}
		}
		return $settings;
	}
	public function getUserRights($RoleID){
		$return=null;
		$result=DB::Table('tbl_user_roles')->where('RoleID',$RoleID)->get();
		if(count($result)>0){
			$return=unserialize($result[0]->CRUD);
		}
		return $return;
	}
	public function loadMenu(){
		$Menus=$this->getMenus(array("Level"=>"L001"));
		return $this->loadHtmlMenu($Menus);
	}
    public function loadHtmlMenu($Menus){
		$html='';
		for($i=0;$i<count($Menus);$i++){
			if($Menus[$i]['hasSubMenu']==1){
				$SubMenus=$this->loadHtmlMenu($Menus[$i]['SubMenu']);
				if($SubMenus!=""){
					if($Menus[$i]['Level']=="L001"){
						$html.='<li class="dropdown CMenus"><a class="nav-link menu-title " href="#">'.$Menus[$i]['Icon'].'<span>'.$Menus[$i]['MenuName'].'</span></a>';
							$html.='<ul class="nav-submenu menu-content">'.$SubMenus.'</ul>';
						$html.='</li>';
					}else if($Menus[$i]['Level']=="L002"){
						$html.='<li class="dropdown CMenus"><a class="submenu-title " href="#">'.$Menus[$i]['Icon'].'<span>'.$Menus[$i]['MenuName'].'</span></a>';
							$html.='<ul class="nav-sub-childmenu submenu-content">'.$SubMenus.'</ul>';
						$html.='</li>';
					}
				}
			}else{
				$ActiveClass="";
                $isAllow=$this->isAllow($Menus[$i]['MID'],$Menus[$i]['Slug']);
				if($isAllow==true){
					if($Menus[$i]['Level']=="L001"){
                        if($Menus[$i]['Slug']=="logout"){
                            $html.='<li class="dropdown CMenus" id="btnLogout"><a class="nav-link menu-title link-nav" data-active-name="'.$Menus[$i]['ActiveName'].'" href="'.URL::to("/")."/".$Menus[$i]['PageUrl'].'" >'.$Menus[$i]['Icon'].'<span>'.$Menus[$i]['MenuName'].'</span></a></li>';
                        }else{
                            $html.='<li class="dropdown CMenus"><a class="nav-link menu-title link-nav" data-active-name="'.$Menus[$i]['ActiveName'].'" href="'.URL::to("/")."/".$Menus[$i]['PageUrl'].'" >'.$Menus[$i]['Icon'].'<span>'.$Menus[$i]['MenuName'].'</span></a></li>';
                        }
					}else{
                        $html.='<li class=""><a href="'.URL::to("/")."/".$Menus[$i]['PageUrl'].'" " data-active-name="'.$Menus[$i]['ActiveName'].'" data-original-title="" title="">'.$Menus[$i]['MenuName'].'</a></li>';
                    }

				}
			}
		}
		return $html;
	}
	private function isAllow($MenuID,$slug=""){
		$allow=false;
		if(($slug=="dashboard")||($slug=="profile")||($slug=="change-password")||($slug=="logout")){
			$allow=true;
		}else{
			if(is_array($this->UserInfo['CRUD'])){
				if(array_key_exists($MenuID,$this->UserInfo['CRUD'])){
					$CRUD=$this->UserInfo['CRUD'][$MenuID];
					if(($CRUD['add']==0)&&($CRUD['view']==0)&&($CRUD['edit']==0)&&($CRUD['delete']==0)&&($CRUD['copy']==0)&&($CRUD['excel']==0)&&($CRUD['csv']==0)&&($CRUD['print']==0)&&($CRUD['showpwd']==0)){
						$allow=false;
					}else{
						$allow=true;
					}
				}
			}
		}
		return $allow;
	}
	public function getMenus($data=null){
		$return=array();
		$sql="Select MID,Slug,MenuName,ActiveName,Icon,PageUrl,ParentID,Level,hasSubMenu,Ordering,DFlag  From tbl_menus Where DFlag=0 and ActiveStatus=1 ";
		if(is_array($data)){
			if(array_key_exists("MID",$data)){$sql.=" and MID='".$data['MID']."'";}
			if(array_key_exists("Slug",$data)){$sql.=" and Slug='".$data['Slug']."'";}
			if(array_key_exists("ParentID",$data)){$sql.=" and ParentID='".$data['ParentID']."'";}
			if(array_key_exists("Level",$data)){$sql.=" and Level='".$data['Level']."'";}
			if(array_key_exists("ActiveName",$data)){$sql.=" and ActiveName='".$data['ActiveName']."'";}

		}
		$sql.=" Order By Ordering";//echo $sql;
		$result=DB::select($sql);
		for($i=0;$i<count($result);$i++){
				$r=array();$isAllow=true;
				$SubMenu=$this->getMenus(array("ParentID"=>$result[$i]->MID));

				$r['MID']=$result[$i]->MID;
				$r['Slug']=$result[$i]->Slug;
				$r['MenuName']=$result[$i]->MenuName;
				$r['ActiveName']=$result[$i]->ActiveName;
				$r['Icon']=$result[$i]->Icon;
				$r['PageUrl']=$result[$i]->PageUrl;
				$r['ParentID']=$result[$i]->ParentID;
				$r['Level']=$result[$i]->Level;
				$r['SubMenu']=$SubMenu;
				$r['Crud']=$this->getCrud($result[$i]->MID);
				if(count($SubMenu)>0){
					$r['hasSubMenu']=1;
				}else{
					$r['hasSubMenu']=0;
				}
				if($result[$i]->hasSubMenu==1){
					if(count($SubMenu)<=0){
						$isAllow=false;
					}
				}
				if($isAllow==true){
					$return[]=$r;
				}
		}
		return $return;
    }
	public function getCrud($MenuID){

		$return=array("add"=>0,"view"=>0,"edit"=>0,"delete"=>0,"copy"=>0,"excel"=>0,"csv"=>0,"print"=>0,"pdf"=>0,"restore"=>0,"showpwd"=>0);
		$result=DB::Table('tbl_cruds')->where('MID',$MenuID)->get();
		if(count($result)>0){
			$return["add"]=$result[0]->add;
			$return["view"]=$result[0]->view;
			$return["edit"]=$result[0]->edit;
			$return["delete"]=$result[0]->delete;
			$return["copy"]=$result[0]->copy;
			$return["excel"]=$result[0]->excel;
			$return["csv"]=$result[0]->csv;
			$return["print"]=$result[0]->print;
			$return["pdf"]=$result[0]->pdf;
			$return["restore"]=$result[0]->restore;
			$return["showpwd"]=$result[0]->showpwd;
		}
		return $return;
	}
	public function CreatePostalCode($PostalCode,$CountryID,$StateID){
		$PostalCodeID="";

		$result=DB::Table($this->generalDB.'tbl_postalcodes')->where('PostalCode',$PostalCode)->get();
		if(count($result)<=0){
			$PostalCodeID=DocNum::getDocNum(docTypes::PostalCodes->value);
			$data=array(
				"PID"=>$PostalCodeID,
				"PostalCode"=>$PostalCode,
				"CountryID"=>$CountryID,
				'StateID'=>$StateID,
				"CreatedBy"=>$this->UserID,
				"CreatedOn"=>date("Y-m-d H:i:s")
			);
			$result=DB::Table($this->generalDB.'tbl_postalcodes')->insert($data);

			if($result==true){
				$DocNumModel = DocNum::updateDocNum(docTypes::PostalCodes->value);
				$result1=DB::Table($this->generalDB.'tbl_postalcodes')->where('PostalCode',$PostalCode)->get();
				if(count($result1)>0){
					$PostalCodeID=$result1[0]->PID;
				}
			}
		}else{
			$PostalCodeID=$result[0]->PID;
		}
		return $PostalCodeID;
	}
	public function isCrudAllow($CRUD,$Action){
		$allow=false;
		$Action=strtolower($Action);
		if(array_key_exists($Action,$CRUD)){
			if($CRUD[$Action]==1){
				$allow=true;
			}
		}
		return   $allow;
	}
    public function getCrudOperations($ActiveName){
		$MID="";
		$result=$this->getMenus(array("ActiveName"=>$ActiveName));
		if(count($result)>0){
			$MID=$result[0]['MID'];
		}
		$return=array("add"=>0,"view"=>0,"edit"=>0,"delete"=>0,"copy"=>0,"excel"=>0,"csv"=>0,"print"=>0,"pdf"=>0,"restore"=>0,"showpwd"=>0);
		if(is_array($this->UserInfo['CRUD'])){
			if(array_key_exists($MID,$this->UserInfo['CRUD'])){
				$return=$this->UserInfo['CRUD'][$MID];
			}
		}
		return $return;
	}
}

<?php

namespace App\Models;

use App\helper\helper;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use App\enums\docTypes;
class DocNum extends Model{
    public static function getDocNum($DocType,$DBName="",$FY=null){
		$FY = $FY == null ? date('Y') : $FY;
		$result = DB::Select("SELECT SLNO,DocType,Prefix,Length,CurrNum,IFNULL(Suffix,'') as Suffix,IFNULL(Year,'') as Year FROM ".$DBName."tbl_docnum Where DocType='".$DocType."'");
		if(count($result)>0){
			$DocNum=$result[0];
			if($DocNum->Year!=""){
				if(intval($DocNum->Year)!=intval(date("Y"))){
					DB::table($DBName.'tbl_docnum')->where('DocType', $DocType)->update(array("Year"=>date("Y"),"CurrNum"=>1));
					return self::getDocNum($DocType);
				}
			}
			$return=$DocNum->Prefix.$FY."-".str_pad($DocNum->CurrNum, $DocNum->Length, '0', STR_PAD_LEFT);
			if(self::checkDocNum($DocType, $return)){
				self::updateDocNum($DocType);
				return self::getDocNum($DocType);
			}
			return $return;
		}
		return '';
    }
    public static function updateDocNum($DocType,$DBName=""){
		$sql="Update ".$DBName."tbl_docnum SET CurrNum=CurrNum+1 WHERE DocType='".$DocType."'";
		$result=DB::statement($sql);
    }

    public static function checkDocNum($DocType,$DocNum,$DBName=""){
        if($DocType==docTypes::UserRoles->value){
            $t=DB::Table($DBName.'tbl_user_roles')->where('RoleID',$DocNum)->get();
            return count($t)>0?true:false;
        }elseif($DocType==docTypes::Users->value){
            $t=DB::Table($DBName.'users')->where('UserID',$DocNum)->get();
            return count($t)>0?true:false;
        }elseif($DocType==docTypes::Log->value){
            $logTable=Helper::getLogTableName();
            $t=DB::Table($DBName.$logTable)->where('LogID',$DocNum)->get();
            return count($t)>0?true:false;
        }elseif($DocType==docTypes::Product->value){
            $t=DB::Table($DBName.'tbl_products')->where('ProductID',$DocNum)->get();
            return count($t)>0?true:false;
        }elseif($DocType==docTypes::ProductAttributes->value){
            $t=DB::Table($DBName.'tbl_products_attributes')->where('DetailID',$DocNum)->get();
            return count($t)>0?true:false;
        }elseif($DocType==docTypes::ProductStages->value){
            $t=DB::Table($DBName.'tbl_products_stages')->where('DetailID',$DocNum)->get();
            return count($t)>0?true:false;
        }elseif($DocType==docTypes::ProductGallery->value){
            $t=DB::Table($DBName.'tbl_products_gallery')->where('SLNo',$DocNum)->get();
            return count($t)>0?true:false;
        }
        return false;
    }
	public static function getInvNo($DocType){
		$InvNo="";
		$ActiveFY=Helper::getActiveFinancialYear();
		if($ActiveFY->FromDate=="" && $ActiveFY->ToDate==""){
			$t=Helper::getCurrentFYDates();
			$ActiveFY->FromDate=date("Y-m-d",strtotime($t->FromDate));
			$ActiveFY->ToDate=date("Y-m-d",strtotime($t->ToDate));
		}
		$FYName=date("y",strtotime($ActiveFY->FromDate)).date("y",strtotime($ActiveFY->ToDate));

		$result=DB::Table('tbl_auto_number')->where('DocType',$DocType)->first();
		if($result){
			$InvNo=$result->Prefix."/".$FYName."/".$result->Suffix."-".$result->CurrNum;
		}
		return $InvNo;
	}
	public static function updateInvNo($DocType){
		$sql="Update tbl_auto_number SET CurrNum=CurrNum+1 WHERE DocType='".$DocType."'";
		$result=DB::statement($sql);
	}
}

<?php

namespace App\Http\Controllers\web;


use App\enums\docTypes;
use App\helper\helper;
use App\Http\Controllers\Controller;
use App\Models\DocNum;
use App\Rules\ValidDB;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Redirect;
use App\Models\general;
use App\Models\ServerSideProcess;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\Rules\ValidUnique;
use logs;
use Mail;
use App\enums\activeMenuNames;

class SupportController extends Controller{
	private $general;
	private $DocNum;
	private $UserID;
	private $ActiveMenuName;
	private $PageTitle;
	private $CRUD;
	private $logs;
	private $Settings;
    private $Menus;
	private $AdminID;
	private $generalDB;
	private $supportDB;
    private $LoginType;

    public function __construct(){
		$this->ActiveMenuName=activeMenuNames::SupportTickets->value;
        $this->PageTitle="Support Tickets";
        $this->middleware('auth');
		$this->middleware(function ($request, $next) {
			$this->UserID=auth()->user()->UserID;
			$this->general=new general($this->UserID,$this->ActiveMenuName);
			$this->Menus=$this->general->loadMenu();
			$this->CRUD=$this->general->getCrudOperations($this->ActiveMenuName);
			$this->Settings=$this->general->getSettings();
			$this->generalDB=Helper::getGeneralDB();
            $this->supportDB=Helper::getSupportDB();
			return $next($request);
		});
    }
	public function SupportView(Request $req){
        if($this->general->isCrudAllow($this->CRUD,"view")==true){
            $FormData=$this->general->UserInfo;
            $FormData['menus']=$this->Menus;
            $FormData['crud']=$this->CRUD;
			$FormData['ActiveMenuName']=$this->ActiveMenuName;
			$FormData['PageTitle']=$this->PageTitle;
            $FormData['PageName']="Account Settings Support Details";
            $FormData['crud']=$this->CRUD;
            $FormData['users']=DB::table("users")->where("DFlag",0)->where("ActiveStatus",1)->get();
            return view('app.support.support',$FormData);
        }else{
            return view('errors.403');
        }
    }
    public function SupportDetailsView(Request $req,$SupportID){
		$FormData=$this->general->UserInfo;
		$FormData['ActiveMenuName']=$this->ActiveMenuName;
		$FormData['PageTitle']=$this->PageTitle;
		$FormData['PageName']="Account Settings Support Details";
		$FormData['menus']=$this->Menus;
        $FormData['crud']=$this->CRUD;
        $FormData['SID']=$SupportID;
        $FormData['TUInfo']=$this->ticketUserInfo($SupportID);
        $FormData['Support']=DB::table($this->supportDB."tbl_support")->where("SupportID",$SupportID)->get();
        if(count($FormData['Support'])>0){
            $FormData['SupportDetails']=$this->getSupportDetails(array("SupportID"=>$SupportID));
            return view('app.support.support_details',$FormData);
        }else{
            return view('errors.404');
        }

    }
    private function ticketUserInfo($SupportID){
        $return=array(
            "Name"=>"",
            "MobileNumber"=>""
        );
//        $sql="SELECT U.LoginType FROM ".$this->supportDB."tbl_support as S LEFT JOIN tbl_customer as U ON U.CustomerID=S.CreatedBy  Where S.SupportID='".$SupportID."'";
//        $result=DB::SELECT($sql);
//        if(count($result)>0){
//            if(intval($result[0]->LoginType)==2){
                $sql="SELECT U.CustomerID, U.CustomerName as UserName, U.MobileNo1 as MobileNumber FROM ".$this->supportDB."tbl_support as S LEFT JOIN tbl_customer as U ON U.CustomerID=S.UserID LEFT JOIN tbl_customer as UI ON UI.CustomerID=S.UserID LEFT JOIN ".$this->generalDB."tbl_countries as C ON C.CountryID=UI.CountryID Where S.SupportID='".$SupportID."'";
                $tmp=DB::SELECT($sql);
                if(count($tmp)>0){
                    $return=array(
                        "Name"=>$tmp[0]->UserName,
                        "MobileNumber"=>$tmp[0]->MobileNumber
                    );
                }
//            }else{
//                $sql="SELECT U.CustomerID, U.CustomerName as UserName,CASE WHEN IFNULL(UI.MobileNo1,'')<>'' THEN CONCAT('+',C.PhoneCode,' ',UI.MobileNo1) ELSE '' END as MobileNumber FROM ".$this->supportDB."tbl_support as S LEFT JOIN users as U ON U.CustomerID=S.UserID LEFT JOIN tbl_customer as UI ON UI.CustomerID=S.UserID LEFT JOIN ".$this->generalDB."tbl_countries as C ON C.CountryID=UI.CountryID Where S.SupportID='".$SupportID."'";
//                $tmp=DB::SELECT($sql);
//                if(count($tmp)>0){
//                    $return=array(
//                        "Name"=>$tmp[0]->UserName,
//                        "MobileNumber"=>$tmp[0]->MobileNumber
//                    );
//                }
//            }
//        }
        return $return;
    }
	public function NewTicket(Request $req){
		if($this->general->isCrudAllow($this->CRUD,"add")==true){
            // $sql="SELECT U.CustomerID, U.CustomerName as UserName,CASE WHEN IFNULL(UI.MobileNo1,'')<>'' THEN CONCAT('+',C.PhoneCode,' ',UI.MobileNo1) ELSE '' END as MobileNumber FROM  users as U  LEFT JOIN users as UI ON UI.CustomerID=U.CustomerID LEFT JOIN ".$this->generalDB."tbl_countries as C ON C.CountryID=UI.CountryID Where U.LoginType=2 and U.DFlag=0";
            $FormData=$this->general->UserInfo;
            $FormData['PageName']="Account Settings New Support";
            $FormData['Customers']=DB::table('tbl_customer')->where('DFlag',0)->get();
            $FormData['Vendors']=DB::table('users')->where('DFlag',0)->where('LoginType','Vendor')->get();
            $FormData['SupportType']=DB::Table('tbl_support_type')->where('isAll',0)->where('ActiveStatus',1)->where('DFlag',0)->get();
            $FormData['SaveButtonID']=md5(date("YmdHis"));
            return view('app.support.new',$FormData);
        }else{
			return view('errors.403');
		}
    }
    public function SaveTicket(Request $req){
		if($this->general->isCrudAllow($this->CRUD,"add")==true){
            $UInfo=$this->general->UserInfo;
            $OldData=$NewData=array();$SupportID="";
            $ValidDB=array();
			$ValidDB['UserID']['TABLE']="tbl_customer";
			$ValidDB['UserID']['ErrMsg']="Customer does not exist";
			$ValidDB['UserID']['WHERE'][]=array("COLUMN"=>"CustomerID","CONDITION"=>"=","VALUE"=>$req->UserID);
			$ValidDB['UserID']['WHERE'][]=array("COLUMN"=>"DFlag","CONDITION"=>"=","VALUE"=>0);
            $rules=array(
                'UserID'=>['required',new ValidDB($ValidDB['UserID'])],
                'Subject' =>'required|min:3|max:100',
                'Priority' =>'required',
                'SupportType' =>'required',
                'Description' => 'required|min:3',
                'Attachment1' => 'mimes:jpeg,jpg,png,gif,webp,bmp,pdf,doc,docx',
                'Attachment2' => 'mimes:jpeg,jpg,png,gif,webp,bmp,pdf,doc,docx',
                'Attachment3' => 'mimes:jpeg,jpg,png,gif,webp,bmp,pdf,doc,docx',
                'Attachment4' => 'mimes:jpeg,jpg,png,gif,webp,bmp,pdf,doc,docx'
            );
			$message=array(
                'UserID.required'=>'Customer is required'
			);
            $validator = Validator::make($req->all(), $rules,$message);

            if ($validator->fails()) {
                return array('status'=>false,'message'=>"New support ticket request has been submit failed",'errors'=>$validator->errors());
            }
            DB::beginTransaction();
            $status=false;
            try{
                $SupportID=DocNum::getDocNum(docTypes::Support->value,"",Helper::getCurrentFY());
                $data=array(
                    "SupportID"=>$SupportID,
                    "UserID"=>$req->UserID,
                    "Subject"=>$req->Subject,
                    "Priority"=>$req->Priority,
                    "SupportType"=>$req->SupportType,
                    "Status"=>1,
                    "DFlag"=>0,
                    "CreatedOn"=>date("Y-m-d H:i:s"),
                    "CreatedBy"=>$this->UserID,
                );
                $status=DB::Table($this->supportDB."tbl_support")->insert($data);
                if($status==true){
                    $status=$this->SaveSupportDetail($req,$SupportID);
                }
//                if($status==true){
//                    $status1=$this->sendMail($req->SupportType,$SupportID);
//                    if($status1==false){
//                        DB::rollback();
//                        $status=false;
//                        return $status1;
//                    }else{
//                        $status=true;
//                    }
//                }
            }catch(Exception $e) {
                logger($e);
                $status=false;
            }
            if($status==true){
                DocNum::updateDocNum(docTypes::Support->value);
                $NewData=DB::Table($this->supportDB."tbl_support")->where('SupportID',$SupportID)->get();
                $logData=array("Description"=>"New Support request has been submit successfully ","ModuleName"=>"Support","Action"=>"Add","ReferID"=>$SupportID,"OldData"=>$OldData,"NewData"=>$NewData,"UserID"=>$this->UserID,"IP"=>$req->ip());
                logs::Store($logData);


                DB::commit();
                return array('status'=>true,'message'=>"New support ticket request has been submit successfully");
            }else{
                DB::rollback();
                return array('status'=>false,'message'=>"New support ticket request has been submit  Failed");
            }
        }else{
			return response(array('status'=>false,'message'=>"Access Denied"), 403);
        }
    }
    private function SaveSupportDetail($req,$SupportID){
        try{
            $SLNO=DocNum::getDocNum(docTypes::SupportDetails->value,"",Helper::getCurrentFY());
            $data=array(
                "SLNO"=>$SLNO,
                "SupportID"=>$SupportID,
                "UserID"=>$req->UserID,
                "Description"=>$req->Description,
                "DFlag"=>0,
                "CreatedOn"=>date("Y-m-d H:i:s"),
                "CreatedBy"=>$this->UserID
            );
            $status=DB::Table($this->supportDB."tbl_support_details")->insert($data);
            if($status==true){
                DocNum::updateDocNum(docTypes::SupportDetails->value);
                for($i=1;$i<=4;$i++){
                    if ($req->hasFile('Attachment'.$i)) {
                        if($status==true){
                            $status=$this->SaveAttachments(request()->file('Attachment'.$i),$SupportID,$SLNO);
                        }
                    }
                }

            }
//            if($status){
//                $status=DB::Table($this->supportDB."tbl_support")->update(array('status'=>1,"UpdatedOn"=>date("Y-m-d H:i:s")));
//            }
            if($status){
                $ReferID = DB::table($this->supportDB.'tbl_support as S')->leftJoin('tbl_customer as U','U.CustomerID','S.UserID')->where('S.SupportID',$SupportID)->value('U.CustomerID');
                $this->sendNotification($SupportID,$ReferID);
            }
//            if($status==true){
//                $status1=$this->sendMail($req->SupportType,$SupportID);
//                if($status1==false){
//                    DB::rollback();
//                    $status=false;
//                    return $status1;
//                }else{
//                    $status=true;
//                }
//            }
		}catch(Exception $e) {
        }
        return $status;
    }
    public function sendNotification($SupportID,$UserID){
        $Title = "Admin Respond your Ticket";
        $Message = "Admin has responded to your ticket. Check now for updates and further instructions.";
        $status = Helper::saveNotification($UserID,$Title,$Message,'Support',$SupportID);
    }

    private function SaveAttachments($file,$SupportID,$ReferID){
        //DB::beginTransaction();
        $status=false;
        try{
            $dir="uploads/support/".$SupportID."/";
            if (!file_exists( $dir)) {mkdir( $dir, 0777, true);}
            $fileName = md5($file->getClientOriginalName() . time()) . "." . $file->getClientOriginalExtension();
            $filepath=$dir.$fileName;
            $FileSize=$file->getSize();
            $AttachmentID=DocNum::getDocNum(docTypes::SupportAttachments->value,"",Helper::getCurrentFY());
            $data=array("AttachmentID"=>$AttachmentID,"ReferID"=>$ReferID,"Module"=>"Support","FileSize"=>$FileSize,"UploadDir"=>$dir,"UploadFileName"=>$fileName,"UploadFileExt"=>$file->getClientOriginalExtension(),"UploadUrl"=>$filepath,"UserID"=>$this->UserID,"CreatedOn"=>date("Y-m-d H:i:s"));
            $status=DB::table($this->supportDB."tbl_attachment")->insert($data);
            if($status==true){
                $file->move($dir,$fileName);
                DocNum::updateDocNum(docTypes::SupportAttachments->value);
            }
        }catch(Exception $e){

        }
		return $status;
    }
    public function DeleteSupport(Request $req,$SupportID){
        $OldData=$NewData=array();
        DB::beginTransaction();
		$status=false;
		try{
			$OldData=DB::table($this->supportDB."tbl_support")->where('SupportID',$SupportID)->get();
			$status=DB::table($this->supportDB."tbl_support")->where('SupportID',$SupportID)->update(array("DFlag"=>1,"DeletedOn"=>date("Y-m-d H:i:s"),"DeletedBy"=>$this->UserID));
		}catch(Exception $e) {

		}
		if($status==true){
			DB::commit();
			$logData=array("Description"=>"Support Deleted ","ModuleName"=>"Support","Action"=>"Delete","ReferID"=>$SupportID,"OldData"=>$OldData,"NewData"=>$NewData,"UserID"=>$this->UserID,"IP"=>$req->ip());
			logs::Store($logData);

			return array('status'=>true,'message'=>"Deleted Successfully");
		}else{
			DB::rollback();
			return array('status'=>false,'message'=>"Delete Failed");
		}
    }
    public function ActivateSupport(Request $req,$SupportID){
        $OldData=$NewData=array();
        DB::beginTransaction();
		$status=false;
		try{
			$OldData=DB::table($this->supportDB."tbl_support")->where('SupportID',$SupportID)->get();
			$status=DB::table($this->supportDB."tbl_support")->where('SupportID',$SupportID)->update(array("Status"=>1,"DFlag"=>0,"UpdatedOn"=>date("Y-m-d H:i:s"),"UpdatedBy"=>$this->UserID));
		}catch(Exception $e) {

		}
		if($status==true){
            DB::commit();
            $NewData=DB::table($this->supportDB."tbl_support")->where('SupportID',$SupportID)->get();
			$logData=array("Description"=>"Support Reopened ","ModuleName"=>"Support","Action"=>"Update","ReferID"=>$SupportID,"OldData"=>$OldData,"NewData"=>$NewData,"UserID"=>$this->UserID,"IP"=>$req->ip());
			logs::Store($logData);

			return array('status'=>true,'message'=>"Reopened Successfully");
		}else{
			DB::rollback();
			return array('status'=>false,'message'=>"Reopen Failed");
		}
    }
    public function DeactivateSupport(Request $req,$SupportID){
        $OldData=$NewData=array();
        DB::beginTransaction();
		$status=false;
		try{
			$OldData=DB::table($this->supportDB."tbl_support")->where('SupportID',$SupportID)->get();
			$status=DB::table($this->supportDB."tbl_support")->where('SupportID',$SupportID)->update(array("Status"=>0,"DFlag"=>0,"UpdatedOn"=>date("Y-m-d H:i:s"),"UpdatedBy"=>$this->UserID));
		}catch(Exception $e) {

		}
		if($status==true){
            DB::commit();
            $NewData=DB::table($this->supportDB."tbl_support")->where('SupportID',$SupportID)->get();
			$logData=array("Description"=>"Support Closed ","ModuleName"=>"Support","Action"=>"Update","ReferID"=>$SupportID,"OldData"=>$OldData,"NewData"=>$NewData,"UserID"=>$this->UserID,"IP"=>$req->ip());
			logs::Store($logData);
            $ReferID = DB::table($this->supportDB.'tbl_support as S')->leftJoin('tbl_customer as U','U.CustomerID','S.UserID')->where('S.SupportID',$SupportID)->value('U.CustomerID');

            $Title = "Admin closed ticket";
            $Message = "Admin closed your ticket.";
            $status = Helper::saveNotification($ReferID,$Title,$Message,'Support',$SupportID);
			return array('status'=>true,'message'=>"Closed Successfully");
		}else{
			DB::rollback();
			return array('status'=>false,'message'=>"Close Failed");
		}
    }
    private function getSupportDetails($data){
        $sql="SELECT D.SLNO,D.UserID, CASE
        WHEN IFNULL(U.CustomerName, '') = '' AND IFNULL(U.MobileNo1, '') = '' THEN 'Support Team'
        WHEN IFNULL(U.CustomerName, '') = '' THEN U.MobileNo1
        ELSE U.CustomerName
    END AS Name,U.Email,UI.CustomerImage,D.SupportID,D.Description,D.DeliveryStatus,D.ReadStatus,D.DFlag,D.CreatedOn,D.UpdatedOn,D.DeletedOn,D.CreatedBy,D.UpdatedBy,D.DeletedBy From ".$this->supportDB."tbl_support_details as D left join ".$this->supportDB."tbl_support as H On H.SupportID=D.SupportID Left join tbl_customer as U ON U.CustomerID=D.UserID LEFT Join tbl_customer AS UI ON UI.CustomerID=U.CustomerID Where 1=1";
//        Here if the MobileNo1 also null then set the value as "Support Team"
        if(is_array($data)){
            if(array_key_exists("SLNO",$data)){ $sql.=" and D.SLNO='".$data['SLNO']."'";}
            if(array_key_exists("UserID",$data)){ $sql.=" and D.UserID='".$data['UserID']."'";}
            if(array_key_exists("SupportID",$data)){ $sql.=" and D.SupportID='".$data['SupportID']."'";}
        }
        $sql.=" Order By  D.SLNO";
        $result=DB::Select($sql);
        for($i=0;$i<count($result);$i++){
            $result[$i]->Attachments=$this->getAttachment(array("ReferID"=>$result[$i]->SLNO,"Module"=>"Support"));
        }
        return $result;
    }
    private function getAttachment($data){
        $sql="Select AttachmentID,ReferID,Module,UploadDir,UploadFileName,UploadFileExt,UploadUrl,DFlag From ".$this->supportDB."tbl_attachment where DFlag=0 ";
        if(is_array($data)){
            if(array_key_exists("AttachmentID",$data)){$sql.=" and AttachmentID='".$data['AttachmentID']."'";}
            if(array_key_exists("ReferID",$data)){$sql.=" and ReferID='".$data['ReferID']."'";}
            if(array_key_exists("Module",$data)){$sql.=" and Module='".$data['Module']."'";}
        }
        return DB::Select($sql);
    }
    public function SupportDetailsSave(Request $req){
        $SupportID=$req->SID;
        DB::beginTransaction();
        $status=$this->SaveSupportDetail($req,$SupportID);

		if($status==true){
            DB::table($this->supportDB."tbl_support")->where('SupportID',$SupportID)->update(array('Status'=>1,"DFlag"=>0,"UpdatedOn"=>date("Y-m-d H:i:s")));
            DB::commit();

			return array('status'=>true,'message'=>"submit successfully");
		}else{
			DB::rollback();
			return array('status'=>false,'message'=>"submit  Failed");
		}
    }
    public function getDetails(Request $req){
        $data=array("UserID"=>$this->UserID);
        if(isset($req->SupportID)){$data['SupportID']=$req->SupportID;}
        return $this->getSupportDetails($data);
    }
	public function TableView(Request $request){
			$ServerSideProcess=new ServerSideProcess();
			$columns = array(
				array( 'db' => 'S.SupportID', 'dt' => '0' ),
				array( 'db' => 'S.UserID', 'dt' => '1'),
				array( 'db' => 'S.Subject', 'dt' => '2' ),
				array( 'db' => 'ST.SupportType', 'dt' => '3' ),
				array( 'db' => 'S.Status', 'dt' => '4' ,),
				array( 'db' => 'S.CreatedOn', 'dt' => '5'),
				array( 'db' => 'S.SupportID', 'dt' => '6')
			);
			$columns1 = array(
				array( 'db' => 'SupportID', 'dt' => '0' ),
				array( 'db' => 'UserID', 'dt' => '1','formatter' =>function($d,$row){
                    $html='';
                    return $html;

                } ),
				array( 'db' => 'Subject', 'dt' => '2' ),
				array( 'db' => 'SupportType', 'dt' => '3' ),/*
				array( 'db' => 'Priority', 'dt' => '4', 'formatter' =>function($d,$row){
                    $d=strtolower($d);
                    $return='';
                    if($d=="low"){
                        $return="<span class='badge block badge-info mr-2'> Low </span>";
                    }elseif($d=="medium"){
                        $return="<span class='badge block badge-warning mr-2'> Medium </span>";
                    }elseif($d=="high"){
                        $return="<span class='badge block badge-danger mr-2'> High </span>";
                    }
                    return $return;
                } ),*/
				array( 'db' => 'Status', 'dt' => '4' ,'formatter' => function( $d, $row ) {
                    $Status="<span class='badge block  badge-secondary mr-2 '> Pending </span>";
                    $result=DB::Table($this->supportDB."tbl_support")->Where("SupportID",$row['SupportID'])->get();
                    if(count($result)>0){
                        if($result[0]->DFlag==1){
                            $Status="<span class='badge  block badge-danger mr-2'> Deleted </span>";
                        }else{
                            if($d==0){
                                $Status="<span class='badge  block badge-success mr-2 ' > Closed </span>";
                            }elseif($d==1){
                                $Status="<span class='badge  block badge-info mr-2 ' > Open </span>";
                            }elseif($d==2){
                                $Status="<span class='badge  block badge-warning mr-2 ' > Unattend </span>";
                            }
                        }
                    }
					return $Status;
				}),
				array( 'db' => 'CreatedOn', 'dt' => '5','formatter' => function( $d, $row ) {
                    return date("d - M - Y",strtotime($d));
                } ),
				array(
					'db' => 'SupportID',
					'dt' => '6',
					'formatter' => function( $d, $row ) {
                        $html='';
                        $html.='<div class="dropdown-hover" style="float:right;padding:10px">';
                            $html.='<span data-id="'.$d.'" class="dropbtn"><i class="fa fa-ellipsis-v" aria-hidden="true"></i></span>';
                            $html.='<div id="'.$d.'" class="dropdown-content" style="right:0">';
                            $result=DB::Table($this->supportDB."tbl_support")->Where("SupportID",$row['SupportID'])->get();
                            if(count($result)>0){
                                if($result[0]->DFlag==1){
                                    $html.='<a  data-id="'.$d.'" class="SupportTicketReopen"><i class="fa fa-envelope-open"></i> Reopen </a>';
                                }else{
                                    if($result[0]->Status==0){
                                        $html.='<a data-id="'.$d.'" class="SupportTicketReopen"><i class="fa fa-envelope-open"></i> Reopen </a>';
                                    }else{
                                        $html.='<a data-id="'.$d.'" class="SupportTicketClose"><i class="fa fa-envelope-o"></i> Close </a>';
                                    }
                                }
                            }
                            $html.='</div>';
                        $html.='</div>';



						return $html;
					}
				)
			);
            $Where=intval($this->LoginType)==2?" S.UserID='".$this->UserID."'":" 1=1 ";
            $Where.=" and date(S.CreatedOn)>='".date("Y-m-d",strtotime($request->FromDate))."'";
            $Where.=" and date(S.CreatedOn)<='".date("Y-m-d",strtotime($request->ToDate))."'";
            if($request->User!=""){
                $Where.=" and UserID='".$request->User."'";
            }
            if($request->Status=="open"){
                $Where.=" and S.Status='1' and S.DFlag='0'";
            }elseif($request->Status=="closed"){
                $Where.=" and S.Status='0' and S.DFlag='0'";
            }elseif($request->Status=="unattend"){
                $Where.=" and S.Status='2' and S.DFlag='0'";
            }elseif($request->Status=="deleted"){
                $Where.=" and S.DFlag='1'";
            }
			$data=array();
			$data['POSTDATA']=$request;
			$data['TABLE']=$this->supportDB."tbl_support as S LEFT JOIN tbl_support_type as ST ON ST.SLNO=S.SupportType";
			$data['PRIMARYKEY']='S.SupportID';
			$data['COLUMNS']=$columns;
			$data['COLUMNS1']=$columns1;
			$data['GROUPBY']=null;
            $data['WHERERESULT']=null;
            $data['WHEREALL']=$Where;
			return $ServerSideProcess->SSP( $data);
	}
    private function sendMail($SupportID){
        try{
            $tdata=$this->getSupportDetails(array("SupportID"=>$SupportID));
            if(count($tdata)>0){
                $email=$tdata[0]->Email;
                if($email!=""){
                    $emailContent=DB::table('tbl_email_contents')->where('type','customers-support-notifications')->first();
                    $messageData = ['SupportID'=>$SupportID,'Name'=>$tdata[0]->name,'emailContent'=>$emailContent,'LoginType'=>$this->LoginType,'email'=>$email];
                    Mail::send('emails.support',$messageData,function($message) use($email,$emailContent){$message->to($email)->subject($emailContent->Subject);});
                }
            }
        }
        catch(Exception $e){
            return array('status'=>false,'message'=>'E-Mail has been not sent due to SMTP configuration !!!');
        }
        return array('status'=>true,'message'=>'');
    }
}

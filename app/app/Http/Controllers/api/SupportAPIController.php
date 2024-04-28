<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use Carbon\Carbon;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\helper\helper;
use Laravel\Passport\RefreshToken;
use Laravel\Passport\Token;
use App\Rules\ValidUnique;
use App\Rules\ValidDB;
use App\Models\DocNum;
use App\enums\docTypes;
use logs;

class SupportAPIController extends Controller{
    private $generalDB;
    private $logDB;
    private $supportDB;
    private $FileTypes;
	private $UserID;
	private $ReferID;

    public function __construct(){
		$this->generalDB=Helper::getGeneralDB();
		$this->logDB=Helper::getLogDB();
		$this->supportDB=Helper::getSupportDB();
		$this->FileTypes=Helper::getFileTypes(array("category"=>array("Images","Documents")));
//        $this->middleware('auth:api');
//        $this->middleware(function ($request, $next) {
//			$this->UserID= $customer->CustomerID;
//			$this->ReferID= $customer->CustomerID;
//			return $next($request);
//		});
    }

    public function CreateTicket(Request $req){
        $customer = $req->auth_customer;
        DB::beginTransaction();
        $status=false;
        try {
            if($req->has('SupportID') && $req->SupportID){
                $SupportID = $req->SupportID;
                $status = true;
            }else{
                $SupportID = DocNum::getDocNum(docTypes::Support->value, "", Carbon::now()->year);
                $data = array(
                    "SupportID" => $SupportID,
                    "UserID" => $customer->CustomerID,
                    "Subject" => $req->Subject,
                    "Priority" => $req->Priority,
                    "SupportType" => $req->SupportType,
                    "DFlag" => 0,
                    "CreatedOn" => date("Y-m-d H:i:s"),
                    "CreatedBy" => $customer->CustomerID,
                );
                $status = DB::Table($this->supportDB . "tbl_support")->insert($data);
            }

            if($status==true){
                $ReferID=DocNum::getDocNum(docTypes::SupportDetails->value,"",Carbon::now()->year);
                $data=array(
                    "SLNO"=>$ReferID,
                    "SupportID"=>$SupportID,
                    "UserID"=>$customer->CustomerID,
                    "Description"=>$req->Description,
                    "DFlag"=>0,
                    "CreatedOn"=>date("Y-m-d H:i:s"),
                    "CreatedBy"=>$customer->CustomerID
                );
                $status=DB::Table($this->supportDB."tbl_support_details")->insert($data);
                if($status==true){
                    DocNum::updateDocNum(docTypes::SupportDetails->value);

                    $Attachments = json_decode($req->Attachments);
                    // return $Attachments;
                    if (is_array($Attachments) && count($Attachments) > 0) {
                        foreach ($Attachments as $item) {
                            $dir = "uploads/support/".$SupportID."/";
                            if (!file_exists($dir)) {
                                mkdir($dir, 0777, true);
                            }

                            $file = $item->uploadPath;
                            $fileName = md5($item->fileName . time()) . "." . $item->ext;
                            $filepath = $dir . $fileName;
                            $FileSize = filesize($file);
                            $AttachmentID = DocNum::getDocNum(docTypes::SupportAttachments->value, "", Carbon::now()->year);
                            $data = array(
                                "AttachmentID" => $AttachmentID,
                                "ReferID" => $ReferID,
                                "Module" => "Support",
                                "FileSize" => $FileSize,
                                "UploadDir" => $dir,
                                "UploadFileName" => $fileName,
                                "UploadFileExt" => $item->ext,
                                "UploadUrl" => $filepath,
                                "UserID" => $customer->CustomerID,
                                "CreatedOn" => date("Y-m-d H:i:s")
                            );
                            $status = DB::table($this->supportDB . "tbl_attachment")->insert($data);
                            if ($status == true) {
                                copy($file, $filepath);
                                DocNum::updateDocNum(docTypes::SupportAttachments->value);
                            }
                        }
                    }
                }
            }
        }catch(Exception $e) {
            logger($e);
            $status=false;
        }
        if($status==true){
            DB::commit();
            if(!$req->SupportID){
                DocNum::updateDocNum(docTypes::Support->value);
            }
            return response()->json(['status' => true,'message' => "Support Ticket Sent Successfully"]);
        }else{
            DB::rollback();
            return response()->json(['status' => false,'message' => "Support Ticket Send Failed!"]);
        }
    }

    public function GetTicket(Request $req){
        $customer = $req->auth_customer;
//        return $customer;
        if($req->has('SupportID') && $req->SupportID){
            $SupportTickets = DB::table($this->supportDB.'tbl_support as S')
            ->leftJoin('tbl_customer as C','C.CustomerID','S.UserID')
            ->leftJoin('tbl_support_type as ST','ST.SLNO','S.SupportType')
            ->where('S.UserID', $customer->CustomerID)->where('S.DFlag', 0)->where('S.SupportID', $req->SupportID)
            ->select('S.SupportID','S.Subject','ST.SupportType','S.Priority',
                DB::raw('CASE WHEN C.nick_name IS NOT NULL THEN C.nick_name WHEN C.MobileNo1 IS NOT NULL THEN "Support Team" ELSE "Support Team" END AS CreatedBy'),
                'S.CreatedOn','S.Status', DB::raw('CONCAT("' . url('/') . '/", COALESCE(NULLIF(C.CustomerImage, ""), "assets/images/male-icon.png")) AS ProfileImage'))->first();

            $SupportTickets->SupportChat = DB::table($this->supportDB.'tbl_support_details as SD')
                ->leftJoin('tbl_customer as C','C.CustomerID','SD.UserID')
            ->where('SD.SupportID',$SupportTickets->SupportID)
            ->orderBy('SD.CreatedOn')
            ->select('SD.Description','SD.SLNO','SD.CreatedOn',
                DB::raw('CASE WHEN C.nick_name IS NOT NULL THEN C.nick_name WHEN C.MobileNo1 IS NOT NULL THEN "Support Team" ELSE "Support Team" END AS CreatedBy'),
                DB::raw('CONCAT("' . url('/') . '/", COALESCE(NULLIF(C.CustomerImage, ""), "assets/images/male-icon.png")) AS ProfileImage'))

            ->get();
            foreach($SupportTickets->SupportChat as $row){
                $row->Attachments = DB::table($this->supportDB.'tbl_attachment')->where('ReferID',$row->SLNO)->select(DB::raw('CONCAT("' . url('/') . '/", UploadUrl) AS FileName '))->get();
            }
            return response()->json(['status' => true,'data' => $SupportTickets]);
        }else{
            $pageNo = $req->PageNo ?? 1;
            $perPage = 15;

            $SupportTickets = DB::table($this->supportDB.'tbl_support as S')
                ->leftJoin('tbl_customer as C','C.CustomerID','S.UserID')
            ->leftJoin('tbl_support_type as ST','ST.SLNO','S.SupportType')->where('S.UserID', $customer->CustomerID)->where('S.DFlag', 0);

            if ($req->has('SearchText') && !empty($req->SearchText)) {
                $SupportTickets->where('S.Subject', 'like', '%' . $req->SearchText . '%');
            }
            if ($req->has('Status') && !empty($req->Status)) {
                $SupportTickets->where('S.Status', $req->Status);
            }
            if ($req->has('FromDate') && !empty($req->FromDate) && $req->has('ToDate') && !empty($req->ToDate)) {
                $fromDate = $req->FromDate . ' 00:00:00';
                $toDate = $req->ToDate . ' 23:59:59';
                $SupportTickets->whereBetween('S.CreatedOn', [$fromDate, $toDate]);
            }
            $result = $SupportTickets
            ->select('S.SupportID','S.Subject','ST.SupportType','S.Priority',
                DB::raw('CASE WHEN C.nick_name IS NOT NULL THEN C.nick_name WHEN C.MobileNo1 IS NOT NULL THEN "Support Team" ELSE "Support Team" END AS CreatedBy'),
                'S.CreatedOn','S.Status', DB::raw('CONCAT("' . url('/') . '/", COALESCE(NULLIF(C.CustomerImage, ""), "assets/images/male-icon.png")) AS ProfileImage'))
            ->paginate($perPage, ['*'], 'page', $pageNo);

            foreach($result as $item){
                $item->SupportChat = DB::table($this->supportDB.'tbl_support_details as SD')
                    ->leftJoin('tbl_customer as C','C.CustomerID','SD.UserID')
                    ->where('SD.SupportID',$item->SupportID)
                    ->orderBy('SD.CreatedOn')

                    ->select('SD.Description','SD.SLNO','SD.CreatedOn',
                        DB::raw('CASE WHEN C.nick_name IS NOT NULL THEN C.nick_name WHEN C.MobileNo1 IS NOT NULL THEN "Support Team" ELSE "Support Team" END AS CreatedBy'),
                        DB::raw('CONCAT("' . url('/') . '/", COALESCE(NULLIF(C.CustomerImage, ""), "assets/images/male-icon.png")) AS ProfileImage'))
//                    If the CreatedBy is Null then look for C.MobileNo1, If MobileNo1 also null then set the "Support Team" as CreatedBy
                    ->get();
                    foreach($item->SupportChat as $row){
                        $row->Attachments = DB::table($this->supportDB.'tbl_attachment')->where('ReferID',$row->SLNO)->select(DB::raw('CONCAT("' . url('/') . '/", UploadUrl) AS FileName '))->get();
                    }
            }
            return response()->json(['status' => true,'data' => $result->items(),'CurrentPage' => $result->currentPage(),'LastPage' => $result->lastPage()]);
        }
    }
}

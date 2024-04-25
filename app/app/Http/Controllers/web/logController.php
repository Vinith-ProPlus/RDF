<?php

namespace App\Http\Controllers\web;

use App\enums\docTypes;
use App\helper\helper;
use App\Http\Controllers\Controller;
use App\Models\DocNum;
use App\Models\Log;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
class logController extends Controller{

	public static function Store($data){
		$data['OldData']=json_decode(json_encode($data['OldData']),true);
		$data['NewData']=json_decode(json_encode($data['NewData']),true);
        $tdata=[
			'LogID'=> Log::count() + 1,
			'Description'=>$data['Description'],
			'ModuleName'=>$data['ModuleName'],
			'Action'=>$data['Action'],
			'ReferID'=>$data['ReferID'],
			'OldData'=>serialize($data['OldData']),
			'NewData'=>serialize($data['NewData']),
			'IPAddress'=>$data['IP'],
			'UserID'=>$data['UserID'],
			'logTime'=>date("Y-m-d H:i:s")
		];
		Log::create($tdata);
	}
}

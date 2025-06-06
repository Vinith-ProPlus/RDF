<?php

namespace App\Http\Controllers\web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;
use Auth;
class loginController extends Controller{
    public function login(Request $req){
        $remember_me = $req->has('remember') ? true : false;
        $return=array('status'=>false);
        $result=DB::Table('users')->where('UserName',$req->email)->get();
        if(count($result)>0){
            if(($result[0]->DFlag==0)&&($result[0]->ActiveStatus=='Active')&&($result[0]->isLogin==1)){
                if(Auth::attempt(['UserName'=>$req->email,'password'=>$req->password,'ActiveStatus' => 1,'DFlag' => 0,'isLogin' => 1],$remember_me)){
                    return array("status"=>true,"message"=>"Login Successfully");
                }else{
                    $return['message']='login failed';
                    $return['password']='The user name and password not match.';
                }
            }elseif($result[0]->DFlag==1){
                $return['message']='Your account has been deleted.';
            }elseif($result[0]->ActiveStatus==0){
                $return['message']='Your account has been disabled.';
            }elseif($result[0]->isLogin==0){
                $return['message']='You dont have login rights.';
            }
        }else{
            $return['message']='login failed';
            $return['email']='User name does not exists. please verify user name.';
        }
        return $return;
    }
}

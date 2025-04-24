<?php

namespace App\Http\Controllers\web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
class loginController extends Controller{
    /**
     * @param Request $req
     * @return array|false[]
     */
    public function login(Request $req): array
    {
        $remember_me = $req->has('remember');
        $return = ['status' => false];
        $result = DB::Table('users')->where('email', $req->email)->first();
        if (!$result) {
            $result = DB::Table('users')->where('UserName', $req->email)->first();
        }
        if ($result) {
            if (($result->DFlag === 0) && ($result->ActiveStatus === 'Active') && ($result->isLogin === 1)) {
                if (Auth::attempt(['UserName' => $result->UserName, 'password' => $req->password, 'ActiveStatus' => 1, 'DFlag' => 0, 'isLogin' => 1], $remember_me)) {
                    return ["status" => true, "message" => "Login Successfully"];
                }

                $return['message'] = 'login failed';
                $return['password'] = 'The user name and password not match.';
            } elseif ($result->DFlag === 1) {
                $return['message'] = 'Your account has been deleted.';
            } elseif ($result->ActiveStatus === 0) {
                $return['message'] = 'Your account has been disabled.';
            } elseif ($result->isLogin === 0) {
                $return['message'] = 'You dont have login rights.';
            }
        } else {
            $return['message'] = 'login failed';
            $return['email'] = 'User name does not exists. please verify user name.';
        }
        return $return;
    }
}

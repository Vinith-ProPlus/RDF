<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

//Route::group(['prefix'=>'customer'],function (){
    require __DIR__.'/api/customer/customer-api.php';
//});
//Route::group(['prefix'=>'vendor'],function (){
//    require __DIR__.'/api/vendor/vendor-api.php';
//});

//require __DIR__.'/api/general-api.php';

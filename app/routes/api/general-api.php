<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\api\GeneralAPIController;

Route::post('/get/google-auth-secret', [GeneralAPIController::class, 'getGoogleAuthSecret']);
Route::post('/get/gender', [GeneralAPIController::class, 'getGender']);

Route::post('/get/country', [GeneralAPIController::class, 'getCountry']);
Route::post('/get/states', [GeneralAPIController::class, 'getState']);
Route::post('/get/districts', [GeneralAPIController::class, 'getDistrict']);
Route::post('/get/taluks', [GeneralAPIController::class, 'getTaluk']);
Route::post('/get/city', [GeneralAPIController::class, 'getCity']);
Route::post('/get/postal-code', [GeneralAPIController::class, 'getPostalCode']);
Route::post('/get/vehicle-type', [GeneralAPIController::class, 'getVehicleType']);
Route::post('/get/vehicle-brand', [GeneralAPIController::class, 'getVehicleBrand']);
Route::post('/get/vehicle-model', [GeneralAPIController::class, 'getVehicleModel']);

//Route::post('/get/category', [GeneralAPIController::class, 'getCategory']);
//Route::post('/get/sub-category', [GeneralAPIController::class, 'getSubCategory']);
//Route::post('/get/products', [GeneralAPIController::class, 'getProducts']);

Route::post('/get/vendor-type', [GeneralAPIController::class, 'getVendorType']);
Route::post('/tmp/file-upload', [GeneralAPIController::class, 'tmpFileUpload']);

Route::post('/get/stages', [GeneralAPIController::class, 'getStages']);
Route::post('/get/support-type', [GeneralAPIController::class, 'getSupportType']);
Route::post('/get/cms', [GeneralAPIController::class, 'getCMS']);
Route::post('/get/banner-images', [GeneralAPIController::class, 'getBannerImages']);

<?php

use App\Http\Controllers\api\vendor\VendorAPIController;
use App\Http\Controllers\api\vendor\VendorAuthController;
use App\Http\Controllers\api\vendor\VendorStockUpdateController;
use App\Http\Controllers\api\vendor\VendorTransactionAPIController;

Route::controller(VendorAuthController::class)->group(function () {
    Route::post('/register','Register');
    Route::post('/update','Update');
    Route::post('/get/user-info','getUserInfo');
    Route::post('/registered-details','RegisteredDetails');
    Route::post('/documents','VendorDocuments');
    Route::post('/vendor-data','getVendorData');

    Route::post('/get/vehicle-data','getVehicleData');
    Route::post('/add-vehicle','AddVehicle');
    Route::post('/update-vehicle','UpdateVehicle');
    Route::post('/delete-vehicle','DeleteVehicle');

    Route::post('/get/vendor-mapped-products','getVendorMappedProducts');
    Route::post('/add-product','AddProduct');
    Route::post('/update-product','UpdateProduct');
    Route::post('/delete-product','DeleteProduct');

    Route::post('/get/vendor-stock-data','getVendorStockData');
    Route::post('/update-stock-data','UpdateStockData');
});

Route::controller(VendorAPIController::class)->group(function () {
    Route::post('/login','Login');
    Route::post('/google-register','GoogleRegister');
});

Route::controller(VendorTransactionAPIController::class)->group(function () {

    Route::post('/get/quote-request','getQuoteRequest');
    Route::post('/get/all-quotations','getAllQuotations');
    Route::post('/add-quote-price','AddQuotePrice');
    Route::post('/stock-list','index');
    
});



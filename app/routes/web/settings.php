<?php

use App\Http\Controllers\web\Settings\BannersController;
use App\Http\Controllers\web\Settings\CMSController;
use App\Http\Controllers\web\Settings\CompanyController;
use App\Http\Controllers\web\Settings\GeneralSettingsController;
use App\Http\Controllers\web\Settings\MobileVersionController;
use App\Http\Controllers\web\Settings\TranslationController;

Route::group(['prefix'=>'company'],function (){
    Route::controller(CompanyController::class)->group(function () {
        Route::get('/', 'Edit');
        Route::POST('/update', 'Update');
    });
});

Route::group(['prefix'=>'cms'],function (){
    Route::controller(CMSController::class)->group(function () {
        Route::get('/', 'index');
        Route::get('/edit/{ID}', 'edit');


        Route::post('/data', 'TableView');
        Route::Post('/edit/{ID}', 'Update');
    });
});

Route::group(['prefix'=>'general'],function (){
    Route::controller(GeneralSettingsController::class)->group(function () {
        Route::get('/', 'index');
        Route::Post('/', 'Update');
    });
});
Route::group(['prefix'=>'mobile_version'],function (){
    Route::controller(MobileVersionController::class)->group(function () {
        Route::get('/', 'Edit');
        Route::POST('/update', 'Update');
    });
});

Route::group(['prefix'=>'banners'],function (){
    Route::controller(BannersController::class)->group(function () {
        Route::get('/', 'index');
        Route::get('/upload', 'create');
        Route::get('/edit/{TranNo}', 'edit');
        Route::post('/upload', 'save');
        Route::POST('/edit/{TranNo}', 'update');
        Route::POST('/delete/{TranNo}', 'Delete');
    });
});
Route::group(['prefix'=>'translations'],function (){
    Route::controller(TranslationController::class)->group(function () {
        Route::get('/', 'index');
        Route::get('/edit/{LangID}', 'edit');
        Route::post('/update', 'update')->name('translation.update');
        Route::post('/data', 'TableView');
//        Route::Post('/edit/{ID}', 'Update');
    });
});

<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\web\users\CustomerController;
use App\Http\Controllers\web\users\userRoleController;
use App\Http\Controllers\web\users\userController;
use App\Http\Controllers\web\users\PasswordChangeController;

Route::group(['prefix'=>'user-roles'],function (){
    Route::controller(userRoleController::class)->group(function () {
        Route::get('/', 'index');
        Route::get('/view', 'index');
        Route::post('/data', 'TableView');
        Route::get('/create', 'Create');
        Route::get('/edit/{RoleID}', 'Edit');
        Route::POST('/json/{RoleID}', 'RoleData');
        Route::post('/create', 'Save');
        Route::POST('/edit/{RoleID}', 'Update');

        Route::POST('get/menus-data', 'getMenuData');
    });
});

Route::group(['prefix'=>'profile'],function (){
    Route::controller(ProfileController::class)->group(function () {
        Route::get('/', 'view');
//        Route::get('/create', 'Create');
        Route::get('/edit', 'edit');
        Route::post('/update', 'update')->name('profile.update');
    });
});

Route::group(['prefix'=>'users'],function (){
    Route::controller(userController::class)->group(function () {
        Route::get('/', 'index');
        Route::get('/view', 'index');
        Route::get('/create', 'create');
        Route::get('/edit/{UserID}', 'edit');
        Route::get('/restore', 'restoreView');


        Route::post('/data', 'TableView');
        Route::post('/restore-data', 'RestoreTableView');
        Route::post('/create', 'save');
        Route::post('/edit/{UserID}', 'update');
        Route::post('/delete/{UserID}', 'Delete');
        Route::post('/restore/{UserID}', 'Restore');

        Route::post('/get/user-roles', 'getUserRoles');
        Route::post('/get/password', 'getPassword');
        Route::post('/validate/{Type}', 'getValidate');
    });
});
Route::controller(PasswordChangeController::class)->group(function () {
    Route::get('/change-password', 'PasswordChange');
    Route::post('/change-password', 'PasswordUpdate');
});

Route::group(['prefix' => 'manage-customers'], function () {
    Route::get('/', [CustomerController::class, 'view'])->name('manage_customers.index');
    Route::post('/data', [CustomerController::class, 'TableView']);

    Route::get('/create', [CustomerController::class, 'create']);
    Route::get('/edit/{CID}', [CustomerController::class, 'edit']);
    Route::post('/create', [CustomerController::class, 'save']);
    Route::post('/edit/{CID}', [CustomerController::class, 'update']);
    Route::post('/delete/{CID}', [CustomerController::class, 'delete']);
    Route::get('/trash-view/', [CustomerController::class, 'TrashView']);
    Route::post('/trash-data', [CustomerController::class, 'TrashTableView']);
    Route::post('/restore/{CID}', [CustomerController::class, 'Restore']);

    Route::post('/address-view', [CustomerController::class, 'addressView']);
    Route::post('/get/customer-type', [CustomerController::class, 'getCustomerType']);
});

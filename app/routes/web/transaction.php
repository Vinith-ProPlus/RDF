<?php

use App\Http\Controllers\web\Transaction\EnquiryController;
use App\Http\Controllers\web\Transaction\OrderController;
use App\Http\Controllers\web\Transaction\QuoteEnquiryController;

Route::group(['prefix'=>'enquiry'],function (){
    Route::controller(EnquiryController::class)->group(function () {
        Route::get('/', 'view');
        Route::get('/trash', 'TrashView');
        Route::get('/create', 'Create');
        Route::get('/edit/{ID}', 'Edit');
        Route::get('/view/{ID}', 'EnqView');

        Route::POST('/convert/{ID}', 'Convert');
        Route::POST('/delete/{ID}', 'Delete');
        Route::POST('/restore/{ID}', 'Restore');

        Route::post('/data', 'TableView');
        Route::post('/trash-data', 'TrashTableView');
    });
});

Route::group(['prefix'=>'quote-enquiry'],function (){
    Route::controller(QuoteEnquiryController::class)->group(function () {
        Route::get('/', 'view');
        Route::get('/trash', 'TrashView');
        Route::get('/create', 'Create');
        Route::get('/edit/{ID}', 'Edit');
        Route::get('/view/{ID}', 'QuoteView');
        Route::get('/view/vendor-quote/{ID}', 'VendorQuoteView');

        Route::post('/data', 'TableView');
        Route::post('/request-quote/{ID}', 'RequestQuote');
        Route::POST('/quote-convert/{ID}', 'QuoteConvert');
        Route::POST('/delete/{ID}', 'Delete');
        Route::POST('/restore/{ID}', 'Restore');
        Route::post('/trash-data', 'TrashTableView');

        Route::post('/get/Quotation', 'GetQuotation');
        Route::post('/get/vendor-quote-details', 'GetVendorQuoteDetails');
        Route::post('/get/vendor-ratings', 'GetVendorRatings');

        Route::post('/get/customers', 'GetCustomers');
    });
});

Route::group(['prefix' => 'order'], function () {
    Route::get('/', [OrderController::class, 'view']);
    Route::get('/trash', [OrderController::class, 'TrashView']);
    Route::get('/create', [OrderController::class, 'Create']);
    Route::get('/edit/{ID}', [OrderController::class, 'Edit']);
    Route::get('/view/{ID}', [OrderController::class, 'OrderView']);

    Route::post('/data', [OrderController::class, 'TableView']);
    Route::post('/request-quote/{ID}', [OrderController::class, 'RequestQuote']);
    Route::POST('/allocate/{ID}', [OrderController::class, 'Allocate']);
    Route::POST('/delivered/{ID}', [OrderController::class, 'Delivered']);
    Route::POST('/delete/{ID}', [OrderController::class, 'Delete']);
    Route::POST('/restore/{ID}', [OrderController::class, 'Restore']);
    Route::post('/trash-data', [OrderController::class, 'TrashTableView']);

    Route::post('/get/vendor-quote-details', [OrderController::class, 'GetVendorQuoteDetails']);
    Route::post('/get/vendor-ratings', [OrderController::class, 'GetVendorRatings']);
});

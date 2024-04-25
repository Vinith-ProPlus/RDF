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

Route::group(['prefix'=>'order'],function (){
    Route::controller(OrderController::class)->group(function () {
        Route::get('/', 'view');
        Route::get('/trash', 'TrashView');
        Route::get('/create', 'Create');
        Route::get('/edit/{ID}', 'Edit');
        Route::get('/view/{ID}', 'OrderView');

        Route::post('/data', 'TableView');
        Route::post('/request-quote/{ID}', 'RequestQuote');
        Route::POST('/allocate/{ID}', 'Allocate');
        Route::POST('/delivered/{ID}', 'Delivered');
        Route::POST('/delete/{ID}', 'Delete');
        Route::POST('/restore/{ID}', 'Restore');
        Route::post('/trash-data', 'TrashTableView');

        Route::post('/get/vendor-quote-details', 'GetVendorQuoteDetails');
        Route::post('/get/vendor-ratings', 'GetVendorRatings');
    });
});
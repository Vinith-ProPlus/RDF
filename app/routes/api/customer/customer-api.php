<?php

use App\Http\Controllers\api\customer\CustomerAuthController;
use App\Http\Controllers\api\customer\CustomerAPIController;
use App\Http\Controllers\api\customer\CustomerTransactionAPIController;
use App\Http\Controllers\api\customer\MasterController;
use App\Http\Controllers\api\customer\WishlistController;
use App\Http\Controllers\api\SupportAPIController;
use App\Http\Middleware\app\Http\Middleware\AuthenticateWithToken;
use Illuminate\Support\Facades\Route;

Route::post('/get/user-info', [CustomerAuthController::class, 'getUserInfo']);
Route::post('/registered-details', [CustomerAuthController::class, 'RegisteredDetails']);

Route::post('/get/construction-type', [CustomerAuthController::class, 'getConstructionType']);
Route::post('/get/customer-type', [CustomerAuthController::class, 'getCustomerType']);
//Route::post('/get/category', [CustomerAuthController::class, 'getCategory']);
//Route::post('/get/sub-category', [CustomerAuthController::class, 'getSubCategory']);
//Route::post('/get/products', [CustomerAuthController::class, 'getProducts']);
//Route::post('/get/category/search', [CustomerAuthController::class, 'getCategorySearch']);
//Route::post('/get/sub-category/search', [CustomerAuthController::class, 'getSubCategorySearch']);
//Route::post('/get/products/search', [CustomerAuthController::class, 'getProductsSearch']);

Route::post('/get/cart', [CustomerAuthController::class, 'getCart']);
Route::post('/add-cart', [CustomerAuthController::class, 'AddCart']);
Route::post('/update-cart', [CustomerAuthController::class, 'UpdateCart']);
Route::post('/delete-cart', [CustomerAuthController::class, 'DeleteCart']);


Route::post('/google-register', [CustomerAPIController::class, 'GoogleRegister']);

Route::post('/place-order', [CustomerTransactionAPIController::class, 'PlaceOrder']);
Route::post('/get/quote-enquiry', [CustomerTransactionAPIController::class, 'getQuoteEnquiry']);


// Customer Profile
Route::post('/login', [CustomerAPIController::class, 'login']);
Route::post('/otp_verification', [CustomerAPIController::class, 'OtpVerification']);
Route::middleware([AuthenticateWithToken::class])->group(function () {
    Route::post('/update/nick_name', [CustomerAPIController::class, 'updateNickName']);
    Route::post('/update/profile', [CustomerAPIController::class, 'profileUpdate']);
    Route::post('/get/product', [MasterController::class, 'getProduct']);
    Route::post('/wishlist/add', [WishlistController::class, 'addWishlist']);
    Route::post('/wishlist/remove', [WishlistController::class, 'removeWishlist']);
    Route::post('/wishlist/my_wishlist', [WishlistController::class, 'my_wishlist']);
    Route::post('/get/customer/products', [MasterController::class, 'getCustomerProducts']);
    Route::post('/get/customer/product', [MasterController::class, 'getCustomerProduct']);
    Route::post('/support/get/ticket', [SupportAPIController::class, 'GetTicket']);
    Route::post('/support/create-ticket', [SupportAPIController::class, 'CreateTicket']);
});

// Master
Route::get('/get/gender', [MasterController::class, 'getGender']);
Route::get('/get/country', [MasterController::class, 'getCountry']);
Route::get('/get/price-ranges', [MasterController::class, 'getPriceRanges']);
Route::post('/get/states', [MasterController::class, 'getState']);
Route::post('/get/districts', [MasterController::class, 'getDistrict']);
Route::post('/get/city', [MasterController::class, 'getCity']);
Route::post('/get/postal-code', [MasterController::class, 'getPostalCode']);
Route::post('/get/category-type', [MasterController::class, 'GetCategoryType']);
Route::post('/get/category', [MasterController::class, 'getCategory']);
Route::post('/get/sub-category', [MasterController::class, 'getSubCategory']);
Route::post('/get/products', [MasterController::class, 'getProducts']);

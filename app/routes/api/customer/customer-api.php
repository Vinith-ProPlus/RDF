<?php

use App\Http\Controllers\api\customer\CustomerAuthController;
use App\Http\Controllers\api\customer\CustomerAPIController;
use App\Http\Controllers\api\customer\CustomerTransactionAPIController;
use App\Http\Controllers\api\customer\MasterController;
use App\Http\Controllers\api\customer\WishlistController;
use App\Http\Controllers\api\GeneralAPIController;
use App\Http\Controllers\api\LanguageAPIController;
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




Route::post('/google-register', [CustomerAPIController::class, 'GoogleRegister']);

Route::post('/place-order', [CustomerTransactionAPIController::class, 'PlaceOrder']);
Route::post('/get/quote-enquiry', [CustomerTransactionAPIController::class, 'getQuoteEnquiry']);

// Customer Profile
Route::post('/login', [CustomerAPIController::class, 'login']);
Route::post('/otp_verification', [CustomerAPIController::class, 'OtpVerification']);
Route::get('/guest/translation/{page}/{lang}', [LanguageAPIController::class, 'guestTranslations']);
Route::middleware([AuthenticateWithToken::class])->group(function () {
    Route::post('/customer/homeScreen', [CustomerAPIController::class, 'customerHomeScreen']);
    Route::post('/customer/translation', [LanguageAPIController::class, 'customerTranslations']);
    Route::post('/update/nick_name', [CustomerAPIController::class, 'updateNickName']);
    Route::post('/update/language', [CustomerAPIController::class, 'updateLanguage']);
    Route::post('/update/profile', [CustomerAPIController::class, 'profileUpdate']);
    Route::post('/profile', [CustomerAPIController::class, 'profileDetails']);
    Route::post('/customer/delete-account', [CustomerAPIController::class, 'deleteAccount']);
    Route::post('/wishlist/add', [WishlistController::class, 'addWishlist']);
    Route::post('/wishlist/remove', [WishlistController::class, 'removeWishlist']);
    Route::post('/wishlist/my_wishlist', [WishlistController::class, 'my_wishlist']);
    Route::post('/get/customer/products', [MasterController::class, 'getCustomerProducts']);
    Route::post('/get/customer/product', [MasterController::class, 'getCustomerProduct']);
    Route::post('/support/get/ticket', [SupportAPIController::class, 'GetTicket']);
    Route::post('/support/create-ticket', [SupportAPIController::class, 'CreateTicket']);

//    Cart
    Route::post('/customer/get/cart', [CustomerAuthController::class, 'getCart']);
    Route::post('/customer/add-cart', [CustomerAuthController::class, 'AddCart']);
    Route::post('/customer/update-cart', [CustomerAuthController::class, 'UpdateCart']);
    Route::post('/customer/delete-cart', [CustomerAuthController::class, 'DeleteCart']);

//    Shipping Address
    Route::post('/customer/get/saddress', [CustomerAuthController::class, 'getSAddress']);
    Route::post('/customer/set-default-saddress', [CustomerAuthController::class, 'SetDefault']);
    Route::post('/customer/create-saddress', [CustomerAuthController::class, 'createSAddress']);
    Route::post('/customer/update-saddress', [CustomerAuthController::class, 'updateSAddress']);
    Route::post('/customer/delete-saddress', [CustomerAuthController::class, 'DeleteSAddress']);

//    Order
    Route::post('/order/create/cart', [CustomerAuthController::class, 'cartOrder']);
    Route::post('/order/create/buy-now', [CustomerAuthController::class, 'buyNowOrder']);
    Route::post('/order/create/buy-now/preview', [CustomerAuthController::class, 'buyNowOrderPreview']);
    Route::post('/get/OrderList', [CustomerAuthController::class, 'customerOrderList']);
    Route::post('/order/update/payment-success', [CustomerAuthController::class, 'paymentSuccessStatus']);

//    Review
    Route::post('/review/create', [CustomerAuthController::class, 'createReview']);
    Route::post('/review/like/create', [CustomerAuthController::class, 'saveReviewLike']);

//    Check Coupon
    Route::post('/customer/check-coupon', [MasterController::class, 'checkCoupon']);

//    Notification
    Route::post('/get/notifications', [CustomerAuthController::class, 'getNotifications']);
    Route::post('/get/notifications-count', [CustomerAuthController::class, 'getNotificationsCount']);
    Route::post('/notification-read', [CustomerAuthController::class, 'NotificationRead']);
});

// Master
Route::get('/get/latest/mobile_version', [MasterController::class, 'latestMobileVersion']);
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
Route::post('/get/product', [MasterController::class, 'getProduct']);
Route::post('/tmp/file-upload', [GeneralAPIController::class, 'tmpFileUpload']);

Route::post('homeSearch', [CustomerAPIController::class, 'homeSearch'])->name('homeSearch');
Route::post('/guest/homeScreen', [CustomerAPIController::class, 'guestHomeScreen']);
Route::post('/get/stages', [GeneralAPIController::class, 'getStages']);
Route::post('/get/support-type', [GeneralAPIController::class, 'getSupportType']);
Route::post('/get/cms', [GeneralAPIController::class, 'getCMS']);
Route::post('/get/banner-images', [GeneralAPIController::class, 'getBannerImages']);

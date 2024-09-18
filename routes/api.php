<?php

use App\Http\Controllers\Api\AttributeController;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\BannerController;
use App\Http\Controllers\Api\BrandController;
use App\Http\Controllers\Api\CartController;
use App\Http\Controllers\Api\CategoryController;
use App\Http\Controllers\Api\CouponController;
use App\Http\Controllers\Api\DashboardController;
use App\Http\Controllers\Api\OrderController;
use App\Http\Controllers\Api\PaymentController;
use App\Http\Controllers\Api\ProductController;
use App\Http\Controllers\Api\ProductVariantController;
use App\Http\Controllers\Api\UserController;
use App\Models\Brand;
use Doctrine\DBAL\Schema\Index;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

// login
Route::post('register', [AuthController::class, 'register']);
Route::post('login', [AuthController::class, 'login']);
Route::post('forgetpassword', [AuthController::class, 'forgetPassword']);
Route::post('resetpassword', [AuthController::class, 'resetPassword'])->name('password.reset');
Route::get('resetpassword', [AuthController::class, 'getTokenResetPassword']);
Route::get('logout', [AuthController::class, 'logout'])->middleware('auth:sanctum');

// User
Route::get('profile', [UserController::class, 'profile']);
Route::get('users', [UserController::class, 'index']);
Route::get('user/{id}', [UserController::class, 'show']);
Route::post('user/add', [UserController::class, 'store']);
Route::put('user/update/{id}', [UserController::class, 'update']);
Route::delete('user/delete/{id}', [UserController::class, 'destroy']);
Route::patch('user/updateStatus/{id}', [UserController::class, 'updateStatus']);
Route::patch('user/changeRole/{id}', [UserController::class, 'changeRole']);


//coupon
Route::prefix('coupon/')->group(function () {
    Route::get('list-coupon', [CouponController::class, 'index']);
    Route::post('add', [CouponController::class, 'store']);
    Route::get('showById/{id}', [CouponController::class, 'showById']);
    Route::post('getByCode', [CouponController::class, 'getByCode']);
    Route::put('update/{id}', [CouponController::class, 'update']);
    Route::patch('updateStatus/{id}', [CouponController::class, 'updateStatus']);

    Route::delete('delete/{id}', [CouponController::class, 'destroy']);
});
Route::get('make-code-coupon', [CouponController::class, 'makeCode']);

//dashboard
Route::get('dashboard', [DashboardController::class, 'index']);
Route::get('productByCategory/{id}', [DashboardController::class, 'getProductByCategoryId']);

// Cart routes
Route::middleware('auth:sanctum')->group(function () {
    Route::post('/cart/add', [CartController::class, 'addToCart']);
    Route::get('/cart', [CartController::class, 'viewCart']);
    Route::delete('/cart/{itemId}', [CartController::class, 'removeFromCart']);
    Route::put('/cart/{itemId}', [CartController::class, 'updateCart']);
    Route::delete('/cart', [CartController::class, 'clearCart']); // Clear Cart
    Route::post('/cart/checking/{id}', [CartController::class, 'checkingCart']); // Checking
    Route::post('/cart/checkout', [CartController::class, 'checkout']); // Checkout

    // order
    Route::apiResource('order', OrderController::class);

    Route::get('/list-order', [CartController::class, 'viewOrder']);
    Route::PUT('/update-status/{id}', [OrderController::class, 'updateStatus']);
    Route::post('/orders/{orderId}/cancel', [CartController::class, 'cancelOrder']);
    Route::get('/orders/{orderId}/detail', [CartController::class, 'detail']);
});
Route::get('/payment/return', [PaymentController::class, 'handleReturn']);



// banners
Route::apiResource('banners', BannerController::class);
Route::put('/banners/toggle/{id}', [BannerController::class, 'toggleStatus']);

//categories
Route::apiResource('categories', CategoryController::class);
Route::apiResource('brands', BrandController::class);
Route::post('/categories/restore/{id}', [CategoryController::class, 'restore']);

//products
Route::resource('products', ProductController::class);
// Route::post('product/{id}', [ProductController::class, 'updatez']);
// Route::post('products/{productId}/toggle-attribute', [ProductController::class, 'toggleProductAttribute']);
Route::post('/products/{product}/variants', [ProductController::class, 'updateVariants']);

Route::post('products/{productId}/variants/{variantId}', [ProductController::class, 'updateProductVariant']);
Route::put('/products/variants/update-multiple', [ProductController::class, 'updateMultipleVariants']);
Route::delete('/products/variants/{id}', [ProductController::class, 'deleteVariant']);

Route::post('/product/restore/{id}', [ProductController::class, 'restore']);

//Attribute
Route::get('/attributes', [AttributeController::class, 'index']);
Route::post('/attributes', [AttributeController::class, 'store']);
Route::put('/attributes/{id}', [AttributeController::class, 'update']);
Route::delete('/attributes/{id}', [AttributeController::class, 'destroy']);
// Route::delete('/attributes/{attributeId}/values/{valueId}', [AttributeController::class, 'destroyValue']);
Route::patch('/attributes/{attributeId}/values/{valueId}/restore', [AttributeController::class, 'restoreValue']);

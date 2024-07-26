<?php

use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\BannerController;
use App\Http\Controllers\Api\BrandController;
use App\Http\Controllers\Api\CartController;
use App\Http\Controllers\Api\CategoryController;
use App\Http\Controllers\Api\ProductController;
use App\Http\Controllers\Api\ProductVariantController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;


// login
Route::post('register', [AuthController::class, 'register']);
Route::post('login', [AuthController::class, 'login']);
Route::post('forgetpassword', [AuthController::class, 'forgetPassword']);
Route::post('resetpassword', [AuthController::class, 'resetPassword'])->name('password.reset');
Route::get('resetpassword', [AuthController::class, 'getTokenResetPassword']);

// Cart session
Route::post('/cart/add', [CartController::class, 'addToCart']);
Route::get('/cart', [CartController::class, 'viewCart']);
Route::delete('/cart/{itemId}', [CartController::class, 'removeFromCart']);
Route::put('/cart/{itemId}', [CartController::class, 'updateCart']);
Route::delete('/cart', [CartController::class, 'clearCart']); // Clear Cart
Route::post('/cart/checkout', [CartController::class, 'checkout']); // Checkout


Route::middleware('auth:sanctum')->group(function () {
    Route::get('/user', function (Request $request) {
        return $request->user();
    });

    // Route::post('/cart/add', [CartController::class, 'addToCart']);
    // Route::get('/cart', [CartController::class, 'viewCart']);
    // Route::delete('/cart/{itemId}', [CartController::class, 'removeFromCart']);
    // Route::put('/cart/{itemId}', [CartController::class, 'updateCart']);
    // Route::delete('/cart', [CartController::class, 'clearCart']); // Clear Cart
    // Route::post('/cart/checkout', [CartController::class, 'checkout']); // Checkout
});



// banners
Route::apiResource('banners', BannerController::class);
Route::put('/banners/toggle/{id}', [BannerController::class, 'toggleStatus']);

//categories
Route::apiResource('categories', CategoryController::class);
Route::apiResource('brands', BrandController::class);
Route::post('/categories/restore/{id}', [CategoryController::class, 'restore']);

//products
Route::apiResource('products', ProductController::class);
Route::post('/product/restore/{id}', [ProductController::class, 'restore']);

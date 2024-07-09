<?php

use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\BannerController;
use App\Http\Controllers\Api\BrandController;
use App\Http\Controllers\Api\CategoryController;
use App\Http\Controllers\Api\ProductController;
use App\Http\Controllers\Api\ProductVariantController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;



Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
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
// product variants
Route::apiResource('product-variants', ProductVariantController::class);

Route::post('register', [AuthController::class, 'register']);
Route::post('login', [AuthController::class, 'login']);

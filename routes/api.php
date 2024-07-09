<?php

use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\BannerController;
use App\Http\Controllers\Api\BrandController;
use App\Http\Controllers\Api\CategoryController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;



Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::apiResource('banners', BannerController::class);
Route::apiResource('categories', CategoryController::class);
Route::apiResource('brands', BrandController::class);

Route::post('/categories/restore/{id}', [CategoryController::class, 'restore']);
Route::put('/banners/toggle/{id}', [BannerController::class, 'toggleStatus']);
Route::put('/brands/toggle/{id}', [BrandController::class, 'toggleStatus']);

Route::post('register', [AuthController::class, 'register']);
Route::post('login', [AuthController::class, 'login']);

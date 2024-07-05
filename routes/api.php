<?php

use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\BannerController;
use App\Http\Controllers\Api\CategoryController;
use App\Http\Controllers\Api\ProductController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;



Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::apiResource('banners', BannerController::class);
Route::put('/banners/toggle/{id}', [BannerController::class, 'toggleStatus']);
//
Route::apiResource('categories', CategoryController::class);
Route::post('/categories/restore/{id}', [CategoryController::class, 'restore']);
//
Route::apiResource('products', ProductController::class);
Route::post('/product/restore/{id}', [ProductController::class, 'restore']);


Route::post('register', [AuthController::class, 'register']);
Route::post('login', [AuthController::class, 'login']);
// Route::get('/categories', function () {
//     $data = [
//         'message' => 'Xin chào từ JSON!',
//         'timestamp' => now()
//     ];

//     // Trả về dữ liệu dưới dạng JSON
//     return response()->json($data);
// });

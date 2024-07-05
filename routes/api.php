<?php

use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\BannerController;
use App\Http\Controllers\Api\CategoryController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;



Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::apiResource('banners', BannerController::class);
Route::apiResource('categories', CategoryController::class);
// Route::apiResource('products', CategoryController::class);

Route::post('/categories/restore/{id}', [CategoryController::class, 'restore']);
Route::put('/banners/toggle/{id}', [BannerController::class, 'toggleStatus']);


// Route::post('/categories/restore/{id}', [CategoryController::class, 'restore']);

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

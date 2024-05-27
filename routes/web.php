<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('index');
});

Route::get('/dashboard', function () {
    return ('Dash Board');
})->name('hello');

Route::get('/categories', function () {
    $data = [
        'message' => 'Xin chào từ JSON!',
        'timestamp' => now()
    ];

    // Trả về dữ liệu dưới dạng JSON
    return response()->json($data);
});


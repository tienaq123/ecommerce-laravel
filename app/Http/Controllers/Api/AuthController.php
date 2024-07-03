<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\LoginRequest;
use App\Http\Requests\RegisterRequest;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    public function register(RegisterRequest $request)
    {
        $user = User::create([
            'name' => $request->input('name'),
            'email' => $request->input('email'),
            'date_of_birth' => $request->input('date_of_birth'),
            'password' => $request->input('password'),
        ]);
        return response()->json([
            'status' => true,
            'message' => 'Success',
            'token' => $user->createToken($user->name)->plainTextToken,
            'data' => $user
        ], 200);
    }
    public function login(LoginRequest $request)
    {
        try {
            if (!Auth::attempt($request->only(['email', 'password']))) {
                return response()->json([
                    'status' => false,
                    'message' => "Sai email hoặc mật khẩu",
                ], 402);
            }
            $user = User::where('email', $request->email)->first();
            return response()->json([
                'status' => true,
                'message' => 'Đăng nhập thành công',
                'data' => $user,
                'token' => $user->createToken('API token')->plainTextToken
            ]);
        } catch (\Throwable $th) {
            return response()->json([
                'status' => false,
                'messages' => $th->getMessage()
            ], 500);
        }
    }
}

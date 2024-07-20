<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\LoginRequest;
use App\Http\Requests\RegisterRequest;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Password;
use Illuminate\Auth\Events\PasswordReset;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;


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

    public function forgetPassword(Request $request)
    {

        $validation = Validator::make(
            $request->all(),
            [
                'email' => 'required|email'
            ]
        );
        if (!$validation->fails()) {
            try {
                $status = Password::sendResetLink(
                    $request->only('email')
                );
                if ($status === Password::RESET_LINK_SENT) {
                    return response()->json(['status' => true, 'message' => 'Vui lòng kiểm tra email']);
                }
            } catch (\Throwable $th) {
                if ($status !== Password::RESET_LINK_SENT) {
                    return response()->json([
                        'status' => false,
                        'messages' => $th->getMessage()
                    ], 500);
                }
            }
        } else {
            return response()->json([
                'status' => false,
                'message' => 'Validation Error',
                'data' => $validation->errors()
            ], 422);
        }
    }
    public function resetPassword(Request $request)
    {
        $validation = Validator::make(
            $request->all(),
            [
                'password' => 'required',
                're_password' => 'required_with:password|same:password'
            ]
        );
        if (!$validation->fails()) {
            $status = Password::reset(
                $request->only('email', 'password', 're_password', 'token'),
                function (User $user, string $password) {
                    $user->forceFill([
                        'password' => Hash::make($password)
                    ])->setRememberToken(Str::random(60));

                    $user->save();
                    event(new PasswordReset($user));
                }
            );
            return $status === Password::PASSWORD_RESET
                ? response()->json(['status' => true, 'message' => 'Đổi mật khẩu thành công'])
                : response()->json(['status' => false, 'message' => 'Đổi mật khẩu thất bại']);
        } else {
            return response()->json([
                'status' => false,
                'message' => 'Validation Error',
                'data' => $validation->errors()
            ], 422);
        }
    }
}

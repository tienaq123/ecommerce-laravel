<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{

    public function __construct()
    {
        $this->middleware(['role:admin', 'auth:sanctum']);
    }
    public function index(Request $request)
    {
        $keyword = $request->keyword;
        $per_page = $request->per_page ?? 10;

        $query = User::where(function ($query) use ($keyword) {
            if (isset($keyword) && !empty($keyword)) {
                $query->where('name', 'like', '%' . $keyword . '%')
                    ->orWhere('email', 'like', '%' . $keyword . '%')
                    ->orWhere('phone_number', 'like', '%' . $keyword . '%')
                    ->orWhere('address', 'like', '%' . $keyword . '%');
            }
        });
        $user = $query->paginate($per_page);
        return response()->json([
            'status' => true,
            'message' => 'Success get users',
            'data' => $user
        ], 200);
    }

    public function store(Request $request)
    {
        $validation = Validator::make(
            $request->all(),
            [
                'email' => 'required|email|unique:users,email',
                'name' => 'required|string|max:255',
                'date_of_birth' => 'required|date',
                'role' => 'required',
                'password' => 'required|string|min:6',
                're_password' => 'required_with:password|same:password'
            ],
        );
        if (!$validation->fails()) {
            try {
                $payload = $request->except('re_password');
                $user = User::create($payload);
                return response()->json([
                    'status' => true,
                    'message' => 'Create user success',
                    'data' => $user,
                ], 200);
            } catch (\Throwable $th) {
                return response()->json([
                    'status' => false,
                    'message' => 'Create user fail',
                    'data' => []
                ]);
            }
        } else {
            return response()->json([
                'status' => false,
                'message' => 'Validate errors',
                'error' => $validation->errors()
            ]);
        }
    }

    public function show(string $id)
    {
        //
    }
    public function update(Request $request, string $id)
    {
        $user = User::find($id);
        if (!empty($user)) {
            $user->update($request->only(['name', 'email', 'password', 'address', 'date_of_birth']));
            return response()->json([
                'status' => true,
                'message' => 'Update user success',
            ], 200);
        } else {
            return false;
        }
    }

    public function destroy(string $id)
    {
        //
    }
}

<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\CategoryResource;
use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator as FacadesValidator;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $categories = Category::with('children.children.children')->whereNull('parent_id')->get();
        return response()->json([
            'status' => true,
            'message' => 'Success categories',
            'data' => CategoryResource::collection($categories)
        ], 200);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validation = FacadesValidator::make(
            $request->all(),
            [
                'name' => ['required', 'unique:categories'],
                'parent_id' => ['numeric'],
            ]
        );

        if ($validation->fails()) {
            return response()->json([
                'status' => false,
                'message' => 'ErrorValidated',
                'data' => $validation->errors()
            ], 422);
        }

        $data = $request->all();
        $category = Category::create($data);
        return response()->json([
            'status' => true,
            'message' => 'Success',
            'data' => new CategoryResource($category)
        ], 200);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $category = Category::find($id);
        if (!$category) {
            return response()->json([
                'status' => false,
                'message' => 'Không tồn tại',
                'data' => []
            ], 404);
        }
        $validation = FacadesValidator::make(
            $request->all(),
            [
                'name' => 'required|unique:categories,name,' . $id . ',id',
                'parent_id' => ['numeric'],
            ]
        );

        if ($validation->fails()) {
            return response()->json([
                'status' => false,
                'message' => 'Error',
                'data' => $validation->errors()
            ], 422);
        }

        $data = $request->all();
        $category->update($data);
        return response()->json([
            'status' => true,
            'message' => 'Success',
            'data' => new CategoryResource($category)
        ], 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $category = Category::where('id', $id)->first();
        if (!$category) {
            return response()->json([
                'status' => false,
                'msg' => 'Not exist',
                'data' => []
            ]);
        }
        $category->delete();
        return response()->json([
            'status' => true,
            'msg' => 'Success delete',
            'data' => new CategoryResource($category)
        ]);
    }

    public function restore(string $id)
    {
        $category = Category::withTrashed()->where('id', $id)->first();
        if (!$category) {
            return response()->json([
                'status' => false,
                'msg' => 'Not exist',
                'data' => []
            ]);
        }
        $category->restore();
        return response()->json([
            'status' => true,
            'msg' => 'Success restore',
            'data' => new CategoryResource($category)
        ]);
    }
}

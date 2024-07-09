<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\Products\ProductResource;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        // $sortBy = $request->get('sort_by', 'id');
        // $sortOrder = $request->get('sort_order', 'asc');
        // $search = $request->get('search', '');
        // $perPage = $request->get('per_page', 10);

        // $products = Product::when($search, function ($query, $search) {
        //     return $query->where('name', 'like', "%{$search}%")
        //         ->orWhere('description', 'like', "%{$search}%");
        // })
        //     ->orderBy($sortBy, $sortOrder)
        //     ->paginate($perPage);

        // return ProductResource::collection($products)->response();
        $products = Product::with(['category', 'brand', 'productImages', 'productVariants.attributes'])->get();
        return response()->json([
            'status' => true,
            'message' => 'Success get products',
            'data' => ProductResource::collection($products)
        ], 200);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validation = Validator::make(
            $request->all(),
            [
                'name' => 'required|string|max:255',
                'description' => 'nullable|string',
                'price' => 'required|numeric',
                'price_old' => 'nullable|numeric',
                'quantity' => 'required|integer',
                'category_id' => 'nullable|exists:categories,id',
                'brand_id' => 'nullable|exists:brands,id',
                'promotion' => 'nullable|string',
                'status' => 'nullable|string',
            ]
        );

        if ($validation->fails()) {
            return response()->json([
                'status' => false,
                'message' => 'Validation Error',
                'data' => $validation->errors()
            ], 422);
        }

        $product = Product::create($request->all());
        return response()->json([
            'status' => true,
            'message' => 'Product created successfully',
            'data' => new ProductResource($product)
        ], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $product = Product::find($id);
        if (!$product) {
            return response()->json([
                'status' => false,
                'message' => 'Product not found',
                'data' => []
            ], 404);
        }

        return response()->json([
            'status' => true,
            'message' => 'Success',
            'data' => new ProductResource($product)
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $product = Product::find($id);
        if (!$product) {
            return response()->json([
                'status' => false,
                'message' => 'Product not found',
                'data' => []
            ], 404);
        }

        $validation = Validator::make(
            $request->all(),
            [
                'name' => 'required|string|max:255',
                'description' => 'nullable|string',
                'price' => 'required|numeric',
                'price_old' => 'nullable|numeric',
                'quantity' => 'required|integer',
                'category_id' => 'nullable|exists:categories,id',
                'brand_id' => 'nullable|exists:brands,id',
                'promotion' => 'nullable|string',
                'status' => 'nullable|string',
            ]
        );

        if ($validation->fails()) {
            return response()->json([
                'status' => false,
                'message' => 'Validation Error',
                'data' => $validation->errors()
            ], 422);
        }

        $product->update($request->all());
        return response()->json([
            'status' => true,
            'message' => 'Product updated successfully',
            'data' => new ProductResource($product)
        ], 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $product = Product::find($id);
        if (!$product) {
            return response()->json([
                'status' => false,
                'message' => 'Product not found',
                'data' => []
            ], 404);
        }

        $product->delete();
        return response()->json([
            'status' => true,
            'message' => 'Product deleted successfully',
            'data' => new ProductResource($product)
        ], 200);
    }

    /**
     * Restore the specified resource from storage.
     */
    public function restore(string $id)
    {
        $product = Product::withTrashed()->find($id);
        if (!$product) {
            return response()->json([
                'status' => false,
                'message' => 'Product not found',
                'data' => []
            ], 404);
        }

        $product->restore();
        return response()->json([
            'status' => true,
            'message' => 'Product restored successfully',
            'data' => new ProductResource($product)
        ], 200);
    }
}

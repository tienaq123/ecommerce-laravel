<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\Products\ProductVariantResource;
use App\Models\ProductVariant;
use App\Models\VariantAttribute;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ProductVariantController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validation = Validator::make($request->all(), [
            'product_id' => 'required|exists:products,id',
            'sku' => 'required|string|max:50',
            'stock' => 'required|integer',
            'price' => 'required|numeric',
            'thumbnail' => 'nullable|string',
            'attributes' => 'required|array',
            'attributes.*.attribute_id' => 'required|exists:attributes,id',
            'attributes.*.value_id' => 'required|exists:attribute_values,id',
        ]);

        // Check validation failure
        if ($validation->fails()) {
            return response()->json([
                'status' => false,
                'message' => 'Validation failed',
                'errors' => $validation->errors()
            ], 422);
        }

        // Create Product Variant
        $productVariant = ProductVariant::create([
            'product_id' => $request->product_id,
            'sku' => $request->sku,
            'stock' => $request->stock,
            'price' => $request->price,
            'thumbnail' => $request->thumbnail,
        ]);

        // Attach Attributes
        foreach ($request->attributes as $attribute) {
            VariantAttribute::create([
                'variant_id' => $productVariant->id,
                'attribute_id' => $attribute['attribute_id'],
                'value_id' => $attribute['value_id'],
            ]);
        }

        // Return response
        return response()->json([
            'status' => true,
            'message' => 'Variant created successfully',
            'data' => new ProductVariantResource($productVariant)
        ], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}

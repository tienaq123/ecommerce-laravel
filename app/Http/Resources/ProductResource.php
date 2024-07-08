<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ProductResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        // return parent::toArray($request);
        return [
            // 'id' => $this->id,
            // 'name' => $this->name,
            // 'description' => $this->description,
            // 'price' => $this->price,
            // 'price_old' => $this->price_old,
            // 'quantity' => $this->quantity,
            // 'view' => $this->view,
            // 'category_id' => $this->category_id,
            // 'brand_id' => $this->brand_id,
            // 'promotion' => $this->promotion,
            // 'status' => $this->status,
            // 'created_at' => $this->created_at,
            // 'updated_at' => $this->updated_at,
            'id' => $this->id,
            'name' => $this->name,
            'description' => $this->description,
            'price' => $this->price,
            'price_old' => $this->price_old,
            'quantity' => $this->quantity,
            'view' => $this->view,
            'category' => new CategoryResource($this->category),
            // 'brand' => new BrandResource($this->brand),
            'promotion' => $this->promotion,
            'status' => $this->status,
            // 'images' => ProductImageResource::collection($this->productImages),
            'variants' => ProductVariantResource::collection($this->productVariants),
            'attributes' => $this->attributes->map(function ($attribute) {
                return [
                    'name' => $attribute->name,
                    'value' => $attribute->pivot->value_id,
                    'additional_price' => $attribute->pivot->additional_price,
                ];
            }),
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }
}

<?php

namespace App\Http\Resources\Products;

use App\Http\Resources\CategoryResource;
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
        return [
            'id' => $this->id,
            'name' => $this->name,
            'description' => $this->description,
            'price' => $this->price,
            'price_old' => $this->price_old,
            'quantity' => $this->quantity,
            'view' => $this->view,
            'category_id' => $this->category_id,
            'brand_id' => $this->brand_id,
            'promotion' => $this->promotion,
            'status' => $this->status,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'category' => new CategoryResource($this->whenLoaded('category')),
            // 'brand' => new BrandResource($this->whenLoaded('brand')),
            // 'productImages' => ProductImageResource::collection($this->whenLoaded('productImages')),
            'productVariants' => ProductVariantResource::collection($this->whenLoaded('productVariants')),
            'attributes' => ProductAttributeResource::collection($this->whenLoaded('attributes')),
        ];
    }
}

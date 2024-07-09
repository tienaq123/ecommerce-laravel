<?php

namespace App\Http\Resources\Products;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ProductVariantResource extends JsonResource
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
            'id' => $this->id,
            'product_id' => $this->product_id,
            'sku' => $this->sku,
            'stock' => $this->stock,
            'price' => $this->price,
            'thumbnail' => $this->thumbnail,
            'attributes' => $this->attributes->map(function ($attribute) {
                return [
                    'attribute_id' => $attribute->pivot->attribute_id,
                    'value_id' => $attribute->pivot->value_id,
                ];
            }),
        ];
    }
}

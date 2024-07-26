<?php

namespace App\Http\Resources\Products;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ProductVariantResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'product_id' => $this->product_id,
            'sku' => $this->sku,
            'stock' => $this->stock,
            'price' => $this->price,
            'thumbnail' => $this->thumbnail,
            'attributes' => $this->attributes->map(function ($attribute) {
                $value = $attribute->values->firstWhere('id', $attribute->pivot->value_id);
                return value($value);
                // return [
                //     'attribute_id' => $attribute->pivot->attribute_id,
                //     'attribute_name' => $attribute->name,
                //     'value_id' => $attribute->pivot->value_id,
                //     'value_name' => $value,
                // ];
            }),
        ];
    }
}

<?php

namespace App\Http\Resources\Products;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ProductAttributeResource extends JsonResource
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
            'variant_id' => $this->variant_id,
            'attribute_id' => $this->attribute_id,
            'value_id' => $this->value_id,
            'attribute' => new AttributeResource($this->whenLoaded('attribute')),
            'value' => new AttributeValueResource($this->whenLoaded('value')),
        ];
    }
}

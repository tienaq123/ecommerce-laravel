<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * @property integer $variant_id
 * @property integer $attribute_id
 * @property integer $value_id
 * @property AttributeValue $attributeValue
 * @property Attribute $attribute
 * @property ProductVariant $productVariant
 */
class VariantAttribute extends Model
{
    /**
     * @var array
     */
    protected $fillable = ['variant_id', 'attribute_id', 'value_id'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function attributeValue()
    {
        return $this->belongsTo('App\Models\AttributeValue', 'value_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function attribute()
    {
        return $this->belongsTo('App\Models\Attribute');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function productVariant()
    {
        return $this->belongsTo('App\Models\ProductVariant', 'variant_id');
    }
}

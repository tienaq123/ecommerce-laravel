<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

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
    use SoftDeletes;

    protected $fillable = ['variant_id', 'attribute_id', 'value_id'];

    public function attributeValue()
    {
        return $this->belongsTo(AttributeValue::class, 'value_id');
    }

    public function attribute()
    {
        return $this->belongsTo(Attribute::class);
    }

    public function productVariant()
    {
        return $this->belongsTo(ProductVariant::class, 'variant_id');
    }
}

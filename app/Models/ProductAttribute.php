<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

/**
 * @property integer $product_id
 * @property integer $attribute_id
 * @property integer $value_id
 * @property float $additional_price
 * @property string $deleted_at
 * @property AttributeValue $attributeValue
 * @property Product $product
 * @property Attribute $attribute
 */
class ProductAttribute extends Model
{
    use SoftDeletes;

    protected $fillable = ['product_id', 'attribute_id', 'value_id', 'additional_price'];

    public function attributeValue()
    {
        return $this->belongsTo(AttributeValue::class, 'value_id');
    }

    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    public function attribute()
    {
        return $this->belongsTo(Attribute::class);
    }
}

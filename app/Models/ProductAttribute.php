<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

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
    /**
     * @var array
     */
    protected $fillable = ['product_id', 'attribute_id', 'value_id', 'additional_price', 'deleted_at'];

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
    public function product()
    {
        return $this->belongsTo('App\Models\Product');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function attribute()
    {
        return $this->belongsTo('App\Models\Attribute');
    }
}

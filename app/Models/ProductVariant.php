<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * @property integer $id
 * @property integer $product_id
 * @property string $sku
 * @property integer $stock
 * @property float $price
 * @property string $thumbnail
 * @property string $deleted_at
 * @property string $created_at
 * @property string $updated_at
 * @property OrderItem[] $orderItems
 * @property Product $product
 * @property VariantAttribute[] $variantAttributes
 */
class ProductVariant extends Model
{
    /**
     * @var array
     */
    protected $fillable = ['product_id', 'sku', 'stock', 'price', 'thumbnail', 'deleted_at', 'created_at', 'updated_at'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function orderItems()
    {
        return $this->hasMany('App\Models\OrderItem', 'variant_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function variantAttributes()
    {
        return $this->hasMany('App\Models\VariantAttribute', 'variant_id');
    }
    public function attributes()
    {
        return $this->belongsToMany(Attribute::class, 'variant_attributes')->withPivot('value_id');
    }
}

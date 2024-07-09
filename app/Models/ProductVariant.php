<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

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
    use SoftDeletes;

    protected $fillable = ['product_id', 'sku', 'stock', 'price', 'thumbnail'];

    public function orderItems()
    {
        return $this->hasMany(OrderItem::class, 'variant_id');
    }

    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    public function variantAttributes()
    {
        return $this->hasMany(VariantAttribute::class, 'variant_id');
    }

    public function attributes()
    {
        return $this->belongsToMany(Attribute::class, 'variant_attributes', 'variant_id', 'attribute_id')
            ->withPivot('value_id');
    }
}

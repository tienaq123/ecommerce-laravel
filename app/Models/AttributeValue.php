<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

/**
 * @property integer $id
 * @property integer $attribute_id
 * @property string $value
 * @property string $deleted_at
 * @property string $created_at
 * @property string $updated_at
 * @property Attribute $attribute
 * @property ProductAttribute[] $productAttributes
 * @property VariantAttribute[] $variantAttributes
 */
class AttributeValue extends Model
{
    use SoftDeletes;
    protected $fillable = ['attribute_id', 'value'];

    public function attribute()
    {
        return $this->belongsTo(Attribute::class);
    }

    public function productAttributes()
    {
        return $this->hasMany(ProductAttribute::class, 'value_id');
    }

    public function variantAttributes()
    {
        return $this->hasMany(VariantAttribute::class, 'value_id');
    }
}

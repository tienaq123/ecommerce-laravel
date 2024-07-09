<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

/**
 * @property integer $id
 * @property string $name
 * @property string $display_type
 * @property string $deleted_at
 * @property string $created_at
 * @property string $updated_at
 * @property AttributeValue[] $attributeValues
 * @property ProductAttribute[] $productAttributes
 * @property VariantAttribute[] $variantAttributes
 */
class Attribute extends Model
{
    use SoftDeletes;
    protected $fillable = ['name', 'display_type'];

    public function attributeValues()
    {
        return $this->hasMany(AttributeValue::class);
    }

    public function productAttributes()
    {
        return $this->hasMany(ProductAttribute::class);
    }

    public function variantAttributes()
    {
        return $this->hasMany(VariantAttribute::class);
    }
}

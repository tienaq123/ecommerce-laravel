<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

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
    /**
     * @var array
     */
    protected $fillable = ['name', 'display_type', 'deleted_at', 'created_at', 'updated_at'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function attributeValues()
    {
        return $this->hasMany('App\Models\AttributeValue');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function productAttributes()
    {
        return $this->hasMany('App\Models\ProductAttribute');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function variantAttributes()
    {
        return $this->hasMany('App\Models\VariantAttribute');
    }
}

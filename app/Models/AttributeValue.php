<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

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
    /**
     * @var array
     */
    protected $fillable = ['attribute_id', 'value', 'deleted_at', 'created_at', 'updated_at'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function attribute()
    {
        return $this->belongsTo('App\Models\Attribute');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function productAttributes()
    {
        return $this->hasMany('App\Models\ProductAttribute', 'value_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function variantAttributes()
    {
        return $this->hasMany('App\Models\VariantAttribute', 'value_id');
    }
}

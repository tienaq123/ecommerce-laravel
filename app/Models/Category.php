<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Kyslik\ColumnSortable\Sortable;

class Category extends Model
{
    use HasFactory;
    use Sortable;
    use SoftDeletes;

    protected $fillable = ['name', 'description', 'parent_id', 'status'];

    public function children()
    {
        return $this->hasMany(Category::class, 'parent_id');
    }

    public function parent()
    {
        return $this->belongsTo(Category::class, 'parent_id');
    }

    public function products()
    {
        return $this->hasMany(Product::class);
    }

    public function allChildren()
    {
        return $this->children()->with('allChildren');
    }

    public function allChildrenIds()
    {
        $ids = $this->children->pluck('id')->toArray();
        foreach ($this->children as $child) {
            $ids = array_merge($ids, $child->allChildrenIds());
        }
        return $ids;
    }
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Kyslik\ColumnSortable\Sortable;

class Banner extends Model
{
    use HasFactory;
    use SoftDeletes;
    use Sortable;

    protected $fillable = ['title', 'image_url', 'link', 'description', 'active'];
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class HistoryPoint extends Model
{
    use HasFactory;
    protected $fillable = ['user_id', 'points', 'description'];

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }
}

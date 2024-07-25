<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class GuestOrder extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $fillable = [
        'order_id', 'name', 'email', 'phone_number',
        'address_detail', 'ward', 'district', 'city'
    ];

    public function order()
    {
        return $this->belongsTo(Order::class, 'order_id');
    }
}

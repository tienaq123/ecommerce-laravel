<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;
    protected $fillable = [
        'user_id', 'total_amount', 'status_id',
        'shipping_method', 'payment', 'address_detail',
        'ward', 'district', 'city'
    ];

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function items()
    {
        return $this->hasMany(OrderItem::class, 'order_id');
    }

    public function status()
    {
        return $this->belongsTo(OrderStatus::class, 'status_id');
    }

    public function history()
    {
        return $this->hasMany(OrderHistory::class, 'order_id');
    }
    public function guestOrder()
    {
        return $this->hasOne(GuestOrder::class, 'order_id');
    }
}

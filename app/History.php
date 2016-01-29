<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class History extends Model
{
    protected $fillable = ['product_id', 'customer_id', 'price', 'quantity', 'command_at', 'status'];

    protected $dates = ['command_at'];

    public function product()
    {
        return $this->belongsTo('App\Product');
    }

    public function customer()
    {
        return $this->belongsTo('App\Customer');
    }
}

<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Picture extends Model
{
    protected $fillable = ['title', 'uri', 'size', 'type', 'product_id'];

    public function products()
    {
        return $this->belongsTo('App\Product');
    }
}

<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Customer extends Model
{
    protected $fillable = ['user_id', 'address', 'number_card', 'number_command'];

    public function user()
    {
        return $this->belongsTo('App\User'); // possède Clef secondaire donc belongs
    }

    public function histories()
    {
        return $this->hasMany('App\History');
    }

}

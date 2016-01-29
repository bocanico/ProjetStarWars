<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $fillable = ['name', 'slug', 'abstract', 'content', 'price', 'quantity', 'category_id', 'published_at', 'status'];

    protected $dates = ['published_at'];

    public function category()
    {
        return $this->belongsTo('App\Category');
    }

    public function tags()
    {
        return $this->belongsToMany('App\Tag');
    }

    public function picture()
    {
        return $this->hasOne('App\Picture');
    }

    public function histories()
    {
        return $this->hasMany('App\History');
    }

    public function getNameAttribute($value)
    {
        return ucfirst($value);
    }
/*
    public function getPublishedAtAttribute($value)
    {
        return ucfirst($value);
    }*/


    // Les méthodes set sont appellées automatiquement. Si le nom a un '_', il ne faut pas le mettre ex: category_id => CategoryId
    public function setSlugAttribute($value)
    {
        $this->attributes['slug'] = (empty($value)) ? str_slug($this->name) : str_slug($value);
    }

    public function setCategoryIdAttribute($value)
    {
        $this->attributes['category_id'] = ($value == 0) ? null : $value;
    }

    public function setPublishedAtAttribute($value)
    {
        $maDate = Carbon::createFromFormat('Y-m-d', $value);
//        dd($maDate);
        $this->attributes['published_at'] = (empty($value)) ? '0000-00-00 00:00:00' : $maDate;
    }

    public function scopeOnline($query)
    {
        return $query->where('status', '=', 'opened');
    }
}

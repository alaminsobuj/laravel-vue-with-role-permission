<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Categorys extends Model
{
    use HasFactory;
    public function Subcategorys(){

     return $this->hasMany('App\Models\SubCategory','cat_id','id');
     // return $this->hasMany(Customer::class);
    }

    public function contents(){

     return $this->hasMany('App\Models\Content','category_id','id');
     // return $this->hasMany(Customer::class);
    }
}

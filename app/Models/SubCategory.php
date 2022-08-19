<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SubCategory extends Model
{
    use HasFactory;
     public function categories(){


      return $this->belongsTo('App\Models\Categorys','cat_id','id');
      // return $this->belongsTo(Category::class);
    }

     public function contents(){

     return $this->hasMany('App\Models\Content','subcategory_id','id');
     // return $this->hasMany(Customer::class);
    }
}

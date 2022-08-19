<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
class Content extends Model
{
     use HasFactory;
     use SoftDeletes;

     public function categories(){
      return $this->belongsTo('App\Models\Categorys','category_id','id');
    }
    public function sub_categories(){
      return $this->belongsTo('App\Models\Subcategory','subcategory_id','id');
    }
}

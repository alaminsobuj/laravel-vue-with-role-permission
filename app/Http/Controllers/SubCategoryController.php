<?php

namespace App\Http\Controllers;

use App\Models\SubCategory;
use Illuminate\Http\Request;

class SubCategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $categories = SubCategory::with('categories')->get();
  
        return response()->json([
           "subcategories" => $categories
        ],200);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
        $request->validate([
            'cat_sub_name' => 'required',
            'cat_id' => 'required',
        ]);
        $admins=new SubCategory();

        $admins->cat_sub_name=$request->cat_sub_name;
        $admins->cat_id=$request->cat_id;
    
        $admins->save();

        return ['status'=>'success'];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\SubCategory  $subCategory
     * @return \Illuminate\Http\Response
     */
    public function show(SubCategory $subCategory)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\SubCategory  $subCategory
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
        $categoryById=SubCategory::find($id);

        return response()->json(['subcategory_id'=>$categoryById]); 
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\SubCategory  $subCategory
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,$id)
    {
        //

        $cat_info=SubCategory::find($id);

        $cat_info->cat_sub_name=$request->cat_sub_name;
    
        $cat_info->save();
        return ['status'=>'success'];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\SubCategory  $subCategory
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
          SubCategory::destroy($id);

        return response()->json('The book successfully deleted');
    }

    public function categoryActive(Request $request, $id){
        $cat_info=SubCategory::find($id);;
        $cat_info->status='1';
        $cat_info->save();
         return ['status'=>'success'];
    }
    public function categoryinActive(Request $request, $id){
        $cat_info=SubCategory::find($id);
        $cat_info->status='0';
        $cat_info->save();
         return ['status'=>'success'];
    }
}

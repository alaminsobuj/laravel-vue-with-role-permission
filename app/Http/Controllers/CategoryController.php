<?php

namespace App\Http\Controllers;
use App\Models\Categorys;
use Illuminate\Http\Request;


class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        // return $categories = Categorys::paginate(8);
        $categories = Categorys::all();
        return response()->json([
           "categories" => $categories
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

        $request->validate([
            'cat_name' => 'required',
        ]);
        $admins=new Categorys();

        $admins->cat_name=$request->cat_name;
    
        $admins->save();
         return response()->json(['success'=>'Done!']);




        
        //===================this comment section is working 

        // $count=$request->get('myArray');
        // foreach ($count as $key => $value) {
        //     $admins=new Categorys();
        //     $admins->cat_name=$value;
        //     $admins->save();
        // }

        // return ['status'=>'success',$request->cat_name];

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function show(Category $category)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function edit($category_id)
    {
        //         
        $categoryById=Categorys::find($category_id);

        return response()->json(['categoryById'=>$categoryById]); 
                  
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
 

        $cat_info=Categorys::find($id);

        $cat_info->cat_name=$request->cat_name;
    
        $cat_info->save();
          return ['status'=>'success'];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        Categorys::destroy($id);

        return response()->json('The book successfully deleted');
    }

    public function formValidation($request){

        $this->validate($request,['cat_name'=>'required']);

    }

    public function categoryActive(Request $request, $id){
        $cat_info=Categorys::find($id);
        $cat_info->status='1';
        $cat_info->save();
         return ['status'=>'success'];
    }
    public function categoryinActive(Request $request, $id){
        $cat_info=Categorys::find($id);
        $cat_info->status='0';
        $cat_info->save();
         return ['status'=>'success'];
    }


   
}

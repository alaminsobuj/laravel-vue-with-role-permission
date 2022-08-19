<?php

namespace App\Http\Controllers;

use App\Models\Content;
use App\Models\SubCategory;
use Illuminate\Http\Request;

class ContentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        // $content = Content::all();
        $content = Content::with(['categories','sub_categories'])->get();
        return response()->json([
           "contentlist" => $content
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
        $file_url="";
        if($request->file !=''){
            $uploadPath = public_path('uploads');
            $fileName =$request->file->getClientOriginalName();
            $newFileName=time().'.'.$request->file->getClientOriginalExtension();
             $file_url=$newFileName;
            $request->file->move($uploadPath,$newFileName);
        }
        $content=new Content();
        $content->category_id=$request->category_id;
        $content->subcategory_id=$request->subcategory_id;
        $content->title=$request->title;
        $content->description=$request->description;
        $content->video_url=$request->video_url;
        $content->file= $file_url;
    
        $content->save();
        return ['status'=>'success'];

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Content  $content
     * @return \Illuminate\Http\Response
     */
    public function show(Content $content)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Content  $content
     * @return \Illuminate\Http\Response
     */
    public function edit($content_id)
    {
        //
        $categoryById=Content::find($content_id);

        return response()->json(['editcontent'=>$categoryById],200); 
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Content  $content
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,$content_id)
    {
        //
        $file_url="";
        $content= Content::find($content_id);
        if($request->file !=''){
            $uploadPath = public_path('uploads');
            $fileName =$request->file->getClientOriginalName();
            $newFileName=time().'.'.$request->file->getClientOriginalExtension();
            $file_url=$newFileName;
            $request->file->move($uploadPath,$newFileName);
            $content->file=$file_url;
        }
        $content->category_id=$request->category_id;
        $content->subcategory_id=$request->subcategory_id;
        $content->title=$request->title;
        $content->description=$request->description;
        $content->video_url=$request->video_url;
        $content->file= $file_url;
    
        $content->save();
        return ['status'=>'success'];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Content  $content
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {  
         $getfile=Content::find($id);
     
         if($getfile->file !=''){
          $uploadPath = public_path('uploads/'.$getfile->file);
          unlink($uploadPath);
         }
         Content::destroy($id);

         return response()->json('The book successfully deleted');
         // return ['status'=>'success'];
    }
    public function getsubcategory($id){
        $categoryById=SubCategory::where('cat_id',$id)->get();

        return response()->json(['subcategoryList'=>$categoryById],200); 
    }
}

<?php
namespace App\Http\Controllers;
    
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\User;
use Spatie\Permission\Models\Role;
use DB;
use Hash;
    
class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $user_list = DB::table('users')
        ->join('model_has_roles','users.id','=','model_has_roles.model_id') 
        ->join('roles','model_has_roles.role_id','=','roles.id')
        ->select('users.*','roles.name as role_name')
        ->get();
        return response()->json([
           "userlist" => $user_list
        ],200);
    }
    
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $roles = Role::pluck('name','name')->all();
        return view('users.create',compact('roles'));
    }
    
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => 'required',
            'email' => 'required|email|unique:users,email',
            'password' => 'required|same:cpassword',
            'cpassword' => 'required',
            'roles' => 'required'
        ]);
    
        $input = $request->all();
         if(!empty($input['password'])){ 
            $input['password'] = Hash::make($input['password']);
        }else{
            $input = array_except($input,array('password'));    
        }
   
    
        $user = User::create($input);
        $user->assignRole($request->input('roles'));
         return response()->json([
           "status" =>'success'
        ],200);
        // return redirect()->route('users.index')
        //                 ->with('success','User created successfully');
    }
    
    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $user = User::find($id);
        return view('users.show',compact('user'));
    }
    
    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($user_id)
    {  
        $user_list = DB::table('users')
        ->join('model_has_roles','users.id','=','model_has_roles.model_id') 
        ->join('roles','model_has_roles.role_id','=','roles.id')
        ->select('users.*','roles.id as roles')
        ->where('users.id',$user_id)
        ->first();
        // return view('users.edit',compact('user','roles','userRole'));
         return response()->json(['userById'=>$user_list]); 
    }
    
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {  
        
        $this->validate($request, [
            'name' => 'required',
            'email' => 'required|email|unique:users,email,'.$id,
            'password' => 'same:cpassword',
            'roles' => 'required'
        ]);
    
        $input = $request->all();
        if(!empty($input['password'])){ 
            $input['password'] = Hash::make($input['password']);
        }else{
            unset($input['password']);
            // $input = array_except($input,array('password'));    
        }
    
        $user = User::find($id);
        $user->update($input);
        DB::table('model_has_roles')->where('model_id',$id)->delete();
    
        $user->assignRole($request->input('roles'));
    
        // return redirect()->route('users.index')
        //                 ->with('success','User updated successfully');
        return response()->json([
            "status" =>'success'
         ],200);
    }
    
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        User::find($id)->delete();
        return response()->json([
            "status" =>'success'
         ],200);
    }
}
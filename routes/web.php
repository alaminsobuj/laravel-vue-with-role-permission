<?php

use Illuminate\Support\Facades\Route;
use  App\Http\Controllers\CategoryController;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
// Route::get('categorys', [App\Http\Controllers\Categorys::class, 'index'])->name('categorys');

Route::post('CategoryController', [App\Http\Controllers\CategoryController::class, 'store'])->name('CategoryController');

Route::get('/categoryList', [CategoryController::class, 'index'])->name('categoryList');
Route::get('/edit_category/{category_id}', [CategoryController::class, 'edit'])->name('edit_category');
Route::post('/update_category/{id}', [App\Http\Controllers\CategoryController::class, 'update'])->name('update_category');

Route::get('/categorydelete/{id}', [App\Http\Controllers\CategoryController::class, 'destroy'])->name('categorydelete');
Route::get('/categoryActive/{id}', [App\Http\Controllers\CategoryController::class, 'categoryActive'])->name('categoryActive');
Route::get('/categoryinActive/{id}', [App\Http\Controllers\CategoryController::class, 'categoryinActive'])->name('categoryinActive');

Route::post('/subCategorySave', [App\Http\Controllers\SubCategoryController::class, 'store'])->name('subCategorySave');
Route::get('/subcategoryList', [App\Http\Controllers\SubCategoryController::class, 'index'])->name('subcategoryList');
Route::get('/editsubcategory/{category_id}', [App\Http\Controllers\SubCategoryController::class, 'edit'])->name('editsubcategory');
Route::post('/update_subcategory/{id}', [App\Http\Controllers\SubCategoryController::class, 'update'])->name('update_subcategory');

Route::get('/categorysubdelete/{id}', [App\Http\Controllers\SubCategoryController::class, 'destroy'])->name('categorysubdelete');
Route::get('/subcategoryActive/{id}', [App\Http\Controllers\SubCategoryController::class, 'categoryActive'])->name('subcategoryActive');
Route::get('/subcategoryinActive/{id}', [App\Http\Controllers\SubCategoryController::class, 'categoryinActive'])->name('subcategoryinActive');


// route for subcategory by id
Route::get('/getsubcategoryBycategoryid/{category_id}', [App\Http\Controllers\ContentController::class, 'getsubcategory'])->name('getsubcategoryBycategoryid');


Route::post('/ContentSave', [App\Http\Controllers\ContentController::class, 'store'])->name('ContentSave');
Route::get('/contentList', [App\Http\Controllers\ContentController::class, 'index'])->name('contentList');
Route::get('/Contentbdelete/{id}', [App\Http\Controllers\ContentController::class, 'destroy'])->name('Contentbdelete');
Route::get('/edit_content/{id}', [App\Http\Controllers\ContentController::class, 'edit'])->name('edit_content');
Route::post('/updatecontent/{id}', [App\Http\Controllers\ContentController::class, 'update'])->name('updatecontent');


// Role permission
    Route::resource('roles','RoleController');
    // Route::resource('users','UserController');
    Route::resource('products','ProductController');

// user list 
Route::get('/userList', [App\Http\Controllers\UserController::class, 'index'])->name('userList');
Route::post('/userSave', [App\Http\Controllers\UserController::class, 'store'])->name('userSave');
Route::get('/edit_user/{user_id}', [App\Http\Controllers\UserController::class, 'edit'])->name('edit_user');
Route::post('/userUpdate/{user_id}', [App\Http\Controllers\UserController::class, 'update'])->name('userUpdate');
Route::get('/deleteUser/{id}', [App\Http\Controllers\UserController::class, 'destroy'])->name('deleteUser');


// role list 
Route::get('/roleList', [App\Http\Controllers\RoleController::class, 'index'])->name('roleList');
Route::post('/roleSave', [App\Http\Controllers\RoleController::class, 'store'])->name('roleSave');
Route::get('/roleedit/{id}', [App\Http\Controllers\RoleController::class, 'edit'])->name('roleedit');
Route::post('/roleupdate/{id}', [App\Http\Controllers\RoleController::class, 'update'])->name('roleupdate');
Route::get('/deleterole/{id}', [App\Http\Controllers\RoleController::class, 'destroy'])->name('deleterole');

//permission list 
Route::get('/permissionList', [App\Http\Controllers\RoleController::class, 'getPermissionList'])->name('permissionList');

//  Route for user wise permission list
Route::get('/roleWisePermissionList', [App\Http\Controllers\RoleController::class, 'roleWisePermissionList'])->name('roleWisePermissionList');






 

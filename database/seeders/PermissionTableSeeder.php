<?php

namespace Database\Seeders;
use Spatie\Permission\Models\Permission;
use Illuminate\Database\Seeder;

class PermissionTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
       $permissions = [
           'role-list',
           'role-create',
           'role-edit',
           'role-delete',
           'category-list',
           'category-create',
           'category-edit',
           'category-delete',
           'subcategory-list',
           'subcategory-create',
           'subcategory-edit',
           'subcategory-delete',
           'content-list',
           'content-create',
           'content-edit',
           'content-delete',
           'user-list',
           'user-create',
           'user-edit',
           'user-delete'
        ];
   
        foreach ($permissions as $permission) {
             Permission::create(['name' => $permission]);
        }
    }
}

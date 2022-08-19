import dasboard from './components/admin/dashboard/index.vue';
import add_category from './components/admin/category/add_category.vue';
import categorylist from './components/admin/category/categoryList.vue';
import editcategory from './components/admin/category/edit_category.vue';

// subcategory
import addSubcategory from './components/admin/subcategory/add_subcategory.vue';
import Subcategorylist from './components/admin/subcategory/subcategorylist.vue';
import editSubcategory from './components/admin/subcategory/edit_subcategory.vue';

// content
import addContent from './components/admin/content/add_content.vue';
import contentlist from './components/admin/content/list_content.vue';
import editContent from './components/admin/content/edit_content.vue';

// User
import addUser from './components/admin/user/add.vue';
import userList from './components/admin/user/list.vue';
import editUser from './components/admin/user/edit.vue';

// User Role
import addRole from './components/admin/role/add.vue';
import roleList from './components/admin/role/list.vue';
import editRole from './components/admin/role/edit.vue';



export const routes = [
  
  { 
  	path: '/', 
    component: dasboard 
   },

   // category 
   { 
  	path: '/add_category', 
    component: add_category 
   },
   { 
  	path: '/categorylist', 
    component: categorylist 
   },
   { 
   
    path: '/edit_category/:categoryid', 
    component: editcategory 
   },

   // subcategory
   { 
    path: '/addsubcategory', 
    component: addSubcategory 
   },
   { 
    path: '/subcategorylist', 
    component: Subcategorylist 
   },
   { 
   
    path: '/editsubcategory/:subcategoryid', 
    component: editSubcategory 
   },

   // content
   { 
    path: '/addcontent', 
    component: addContent 
   },
   { 
    path: '/contentlist', 
    component: contentlist 
   },
   { 
   
    path: '/editContent/:contentid', 
    component: editContent 
   },

   // user
   { 
    path: '/addUser', 
    component: addUser 
   },
   { 
    path: '/users', 
    component: userList 
   },
   { 
   
    path: '/editUser/:user_id', 
    component: editUser 
   },
   // role
   { 
    path: '/addRole', 
    component: addRole 
   },
   { 
    path: '/roleList', 
    component: roleList 
   },
   { 
    path: '/editRole/:role_id', 
    component: editRole 
   },
 
]



// var allRoutes=[];
// import camelCase  from 'lodash/camelCase';
// const requireModule = require.context('./modules',true,/\.js$/);
// const importedRoutes=[];
// requireModule.keys().forEach(fileName=> {
//     let str =fileName.split('/')
//     str = str[1]
//     if(fileName ===`./${str}/router/index.js`){
//         const moduleName = camelCase(
//             fileName.replace(/{\.\/|\.js}/g)
//            )
//            importedRoutes.push(...requireModule(fileName).default);
//     }
// });

// allRoutes ==allRoutes.context(routes,importedRoutes)
// const routess =allRoutes;


import Axios from "axios"
export default {

	state: {

       category: [],
       subcategory: [],
       content: [],
       user: [],
       role: [],
       permission: [],
       roleWisePermission:[],

	},

	getters: {

       getCategoryFormGetters(state){ //take parameter state

          return state.category
       },
       getsubCategoryFormGetters(state){ //take parameter state

          return state.subcategory
       },
       getcontentFormGetters(state){ //take parameter state

          return state.content
       }, 
       userlist(state){ //take parameter state

          return state.user
       },
       rolelist(state){ //take parameter state

          return state.role
       },
       permissionlist(state){ //take parameter state

          return state.permission
       },
       roleWisePermissionList(state){
         return state.roleWisePermission
       },

	},

	actions: {
       allCategoryFromDatabase(context){

          axios.get("/categoryList")

               .then((response)=>{
                  // console.log(response.data.categories)
                  context.commit("categories",response.data.categories) //categories will be run from mutation

               })

               .catch(()=>{
                  
                  console.log("Error........")
                  
               })
       },
       allsubCategoryFromDatabase(context){

          axios.get("/subcategoryList")

               .then((response)=>{
                  // console.log(response.data.categories)
                  context.commit("subcategories",response.data.subcategories) //categories will be run from mutation

               })

               .catch(()=>{
                  
                  console.log("Error........")
                  
               })
       },
       allcontentFromDatabase(context){

          axios.get("/contentList")

               .then((response)=>{
                  // console.log(response.data.categories)
                  context.commit("contentlist",response.data.contentlist) //categories will be run from mutation

               })

               .catch(()=>{
                  
                  console.log("Error........")
                  
               })
       }, 
       getUserList(context){
          axios.get("/userList")

               .then((response)=>{
                  // console.log(response.data.categories)
                  context.commit("userlist",response.data.userlist) //categories will be run from mutation

               })
               .catch(()=>{
                  console.log("Error........")
               })
       },
       getRoleList(context){
          axios.get("/roleList")

               .then((response)=>{
                  // console.log(response.data.categories)
                  context.commit("rolelist",response.data.rolelist) //categories will be run from mutation

               })
               .catch(()=>{
                  console.log("Error........")
               })
       },
       getPermissionList(context){
          axios.get("/permissionList")

               .then((response)=>{
                  // console.log(response.data.categories)
                  context.commit("permissionlist",response.data.permissionlist) //categories will be run from mutation

               })
               .catch(()=>{
                  console.log("Error........")
               })
       },
       getRoleWisePermissionList(context){
         Axios.get('/roleWisePermissionList').then((response)=>{
            context.commit('roleWisePermissionList',response.data.roleWisePermissionList)
         })
      },

	},

	mutations: {
       categories(state,data) {
          return state.category = data
       },
       subcategories(state,response) {
          return state.subcategory = response
       },
       contentlist(state,response) {
          return state.content = response
       },
       userlist(state,response) {
          return state.user = response
       },
       rolelist(state,response) {
          return state.role = response
       },
       permissionlist(state,response) {
          return state.permission = response
       },
       roleWisePermissionList(state,response){
         return state.roleWisePermission = response;
       },

	}
}
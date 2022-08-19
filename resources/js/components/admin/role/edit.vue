<template>
	  <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Quick Example</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form role="form" @submit.prevent="roleUpdate">
              <div class="row">
               <div class="col-md-4">
                <div class="card-body">
                  <div class="form-group">
                    <label for="name">Role Name</label>
                    <input v-model='form.name' type="text" class="form-control" id="name" placeholder="Role" name='name' >
                  </div>
                </div>
                  <div class="card-footer">
                    <button type="submit"  class="btn btn-primary">Submit</button>
                  </div>
                </div>
                <!-- /.card-body -->
               <div class="col-md-8">
                     <div class="card">
                       <div class="card-header">
                          <div class="row">
                             <div class="col-md-3">List</div>
                             <div class="col-md-3">Add</div>
                             <div class="col-md-3">Edit</div>
                             <div class="col-md-3">Delete</div>

                          </div>
                       </div>
                      
                        <div class="row">

                          <div class="col-md-3" v-for= "permission in getAllPermission" :key='permission.id'>
                               
                                <div class="row">
                                  <div class="col-md-3">
                                      <div class="form-group">
                                        <!-- <input v-model='form.permission' type="checkbox" class="form-control" id="gg" name='permission' :value="permission.id"> -->

                                           <input type="checkbox" class="form-control" id="exampleInputEmail1" v-model="form.permission"  :value="permission.id"
                                     name="permission">
                                            

                                      </div>
                                  </div> 
                                  <div class="col-md-9">
                                    {{permission.name}}
                                  </div>

                                </div>
                           </div>
                          
                        </div>
                     </div>
                </div>
              </div>

              </form>
            </div>
</template>

<script>
// import axios from 'axios'
export default {
   name:'edit',
  data () {

  return {
      form: new Form({
      name: '',
      permission:[],
   
     })
     
    }

  },

   mounted() {
      this.$store.dispatch("getPermissionList")

    },
    computed: {
      getAllPermission(){ //final output from here
          return this.$store.getters.permissionlist
      }
    },
 created(){
          axios.get('/roleedit/'+this.$route.params.role_id).then((response) =>{
         	     this.form.name = response.data.role.name;
                // for(let i=0;i<response.data.permission.length;i++){
                // for(let j=1;j<=response.data.SelectedRoleLength;j++){

                //   if(response.data.permission[i].id == response.data.rolePermissions[j] ){
                    // this.form.permission[i]=response.data.rolePermissions[j];
                  
                //   }
                // }

                  for(let i=0;i<response.data.permission.length;i++){
                  let s=0;
                  for(let j=0;j<=response.data.SelectedRoleLength;j++){
                  let userStr = response.data.rolePermissions;
                  const resultArray = Object.keys(userStr).map(function(key) {
                    return [Number(key), userStr[key]];
                  });
                     let rolePermissions= resultArray[j][s];
                     this.form.permission[j]=rolePermissions;
                }
                }


          
         })  
    },
  methods: {
  roleUpdate () {
     let self = this;
       this.form.post(`/roleupdate/${this.$route.params.role_id}`)
      .then(response=>{
          // console.log(response.data[0]);
          // return false;
        this.$router.push('/roleList');
          Toast.fire({
              icon: 'success',
              title: 'Role Create Successfully'
          })
      }).catch(function (error) {
        // handle error

        console.log(error);
      }).then(function () {
        // always executed
      });
    },
 
  }
          
}
</script> 
<style></style>
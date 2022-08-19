<template>
	 <div class="row">
      <div class="col-12">
        <div class="card card-outline card-info">
          <div class="card-header">
            <h3 class="card-title">
				

				  <div class="text-right" v-for="checkPermission in getRoleWisePermissionList" :key="checkPermission.id">
					<div v-if="checkPermission.name=='user-create'">
					<router-link to ="/addUser" >Add</router-link> 
					</div>
				</div>
            </h3>
          </div>
	          <div class="card-body">
	                 <div class="table-responsive">
	                    <table id="example1" class="table table-bordered table-striped">
	                        <thead>
	                            <tr>
	                                <th>Sl</th>
	                                <th>User Name</th>
	                                <th>Email</th>
	                                <th>Role</th>
	                                <th>Status</th>
	                                <th>Action</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	                            <!-- v-for="(categorylist,index) in getCategoryList" :key='categorylist.id -->
	                            <tr v-for="(user,index) in getAlluser" :key='user.id'>
	                                <td>{{index+1}}</td>
	                                <td> {{ user.name }}</td>
	                                <td> {{ user.email }}</td>
	                                <td> {{ user.role_name }}</td>
	                                <td>Active</td>
	                 
	                                <td>
                                     <div v-for="checkPermission in getRoleWisePermissionList" :key="checkPermission.id">	
									 <div v-if="checkPermission.name=='user-edit'">
                                    <router-link :to="`editUser/${user.id}`" class="btn btn-info">
					                 <i class="fas fa-edit"></i>
					                </router-link>
									</div>
									<div v-if="checkPermission.name=='user-delete'">
	                                	<a class="btn btn-danger" @click.prevent="deleteUser(user.id)"><i class="fa fa-trash text-white"></i></a>
									</div>
									</div>
									</td>
                                  
	                            </tr>
	                        
	                        </tbody>
	                    </table>
	                </div>
	          </div>
          <!-- /.card-body -->
       
        </div>
        <!-- /.card -->
      </div>
    </div> 
</template>


 <script>
export default {

     name: "List",
  
      mounted() {

        this.$store.dispatch("getUserList")
        this.$store.dispatch('getRoleWisePermissionList')
      },
      computed: {
        getAlluser(){ //final output from here
            return this.$store.getters.userlist
        },
		 getRoleWisePermissionList(){      

			// alert(this.$store.getters.roleWisePermissionList);
			return this.$store.getters.roleWisePermissionList
		}
      },

      methods:{
      	deleteUser(id){
        
      		axios.get(`/deleteUser/${id}`).then((response) => {
                    // this.$router.push({name: 'home'});
                     // this.$router.push('/categorylist');
                     this.$store.dispatch("getUserList")
                     Toast.fire({
				        icon: 'success',
				        title: 'User Delete Successfully',
				        
				      })
                })
      	}
      }

};
</script>
 <style></style>
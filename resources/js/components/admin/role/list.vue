<template>
	 <div class="row">
      <div class="col-12">
        <div class="card card-outline card-info">
          <div class="card-header">
            <h3 class="card-title">
				 <div class="text-right" v-for="checkPermission in getRoleWisePermissionList" :key="checkPermission.id">
					<div v-if="checkPermission.name=='role-create'">
					<router-link to ="/addRole" >Add</router-link> 
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
	                                <th>Role Name</th>
	                                <th>Status</th>
	                                <th>Action</th>
	                              
	                               
	                            </tr>
	                        </thead>
	                        <tbody>
	                            <!-- v-for="(categorylist,index) in getCategoryList" :key='categorylist.id -->
	                            <tr v-for="(role,index) in getAllRole" :key='role.id'>
	                                <td>{{index+1}}</td>
	                                <td> {{ role.name }}</td>
	                                <td>Active</td>
	                               
	                               
	                                <td>
									 <div v-for="checkPermission in getRoleWisePermissionList" :key="checkPermission.id">	
									 <div v-if="checkPermission.name=='role-edit'">
                                     <router-link :to="`editRole/${role.id}`" class="btn btn-info">
					                 <i class="fas fa-edit"></i>
					                </router-link>
									</div>
									 <!-- </div>  -->
									<!-- <div v-for="checkPermission in getRoleWisePermissionList">	 -->
									 <div v-if="checkPermission.name=='role-delete'">
	                                	 <a  @click.prevent ="categoryDelete(role.id)" class="btn  btn-danger"><i class="fas fa-trash"></i></a>
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

        this.$store.dispatch("getRoleList")
		 this.$store.dispatch('getRoleWisePermissionList')

      },
      computed: {
        getAllRole(){ //final output from here
            return this.$store.getters.rolelist
        },
        getRoleWisePermissionList(){      

			// alert(this.$store.getters.roleWisePermissionList);
			return this.$store.getters.roleWisePermissionList
		},


      },

      methods:{
      categoryDelete(id){
			axios.get(`/deleterole/${id}`).then((response)=>{
				this.$store.dispatch("getRoleList")
				Toast.fire({
					icon: 'success',
					title: 'Category deleted successfully'
				})
			})
			}

      }

};
</script>
<style></style>

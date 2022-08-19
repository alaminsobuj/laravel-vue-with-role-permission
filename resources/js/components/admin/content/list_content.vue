<template>
	 <div class="row">
      <div class="col-12">
        <div class="card card-outline card-info">
          <div class="card-header">
            <h3 class="card-title">
            	   
            </h3>
          </div>
	          <div class="card-body">
	                 <div class="table-responsive">
	                    <table id="example1" class="table table-bordered table-striped">
	                        <thead>
	                            <tr>
	                                <th>Sl</th>
	                                <th>Title</th>
	                                <th>Category</th>
	                                <th>Subcategory</th>
	                                <th>Status</th>
	                                <th>Action</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	                           
	                            <tr v-for="(content,index) in getAllCategory" :key='content.id'>
	                                <td>{{index+1}}</td>
	                                <td> {{ content.title}}</td>
	                                <td> {{ content.categories.cat_name}}</td>
	                                <td> {{ content.sub_categories.cat_sub_name}}</td>
	                                <td>Active</td>
	                 
	                                <td>
									 <div v-for="checkPermission in getRoleWisePermissionList" :key="checkPermission.id">	
									 <div v-if="checkPermission.name=='content-edit'">
                                     <router-link :to="`editContent/${content.id}`" class="btn btn-info">
					                 <i class="fas fa-edit"></i>
					                </router-link>
									</div>
									 <div v-if="checkPermission.name=='content-delete'">
	                                	<a class="btn btn-danger" @click.prevent="deleteContent(content.id)"><i class="fa fa-trash text-white"></i></a>
	                               
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

     name: "content",
  
      mounted() {

        this.$store.dispatch("allcontentFromDatabase")
		 this.$store.dispatch('getRoleWisePermissionList')

      },
      computed: {
        getAllCategory(){ //final output from here
            return this.$store.getters.getcontentFormGetters
        },
		getRoleWisePermissionList(){      

			// alert(this.$store.getters.roleWisePermissionList);
			return this.$store.getters.roleWisePermissionList
		},
      },

      methods:{
       deleteContent(id){
        
      		axios.get(`/Contentbdelete/${id}`).then((response) => {
                    // this.$router.push({name: 'home'});
                     this.$router.push('/contentlist');
                    this.$store.dispatch("allcontentFromDatabase")
                     Toast.fire({
				        icon: 'success',
				        title: 'Category Delete Successfully',
				        
				      })
                })
      	}
      }

};
</script>
<style></style>
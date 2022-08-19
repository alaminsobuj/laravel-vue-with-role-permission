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
	                                <th>Category Name</th>
	                                <th>Sub Category Name</th>
	                                <th>Status</th>
	                                <th>Action</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	     
	                            <tr v-for="(subcategories,index) in getAllCategory" :key='subcategories.id'>
	                                <td>{{index+1}}</td>
	                                <td> {{ subcategories.categories.cat_name }}</td>
	                                <td> {{ subcategories.cat_sub_name }}</td>
	                                <td> <span v-if="subcategories.status=='0'"><a class="btn btn-danger text-white" @click.prevent="categoryActive(subcategories.id)">Inactive</a></span>    
                                        <span v-else><a class="btn btn-info text-white" @click.prevent="categoryinActive(subcategories.id)">Active</a></span></td>
	                 
	                                <td>
									 <div v-for="checkPermission in getRoleWisePermissionList" :key="checkPermission.id">	
									 <div v-if="checkPermission.name=='subcategory-edit'">	
                                     <router-link :to="`editsubcategory/${subcategories.id}`" class="btn btn-info">
					                 <i class="fas fa-edit"></i>
					                </router-link>
									 </div>
									 <div v-if="checkPermission.name=='subcategory-delete'">
	                                	<a class="btn btn-danger" @click.prevent="deletesubCategory(subcategories.id)"><i class="fa fa-trash text-white"></i></a>
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

         this.$store.dispatch("allsubCategoryFromDatabase")
		 this.$store.dispatch('getRoleWisePermissionList')

      },
      computed: {
        getAllCategory(){ //final output from here
            return this.$store.getters.getsubCategoryFormGetters
        },
		 getRoleWisePermissionList(){      

			// alert(this.$store.getters.roleWisePermissionList);
			return this.$store.getters.roleWisePermissionList
		}
      },

      methods:{
        categoryActive(id){
            axios.get(`/subcategoryActive/${id}`).then((response) => {
                    // this.$router.push({name: 'home'});
                     // this.$router.push('/categorylist');
					 this.$store.dispatch("allsubCategoryFromDatabase")
					Toast.fire({
					icon: 'success',
					title: 'Category Active Successfully',
					
					})
			})
		  },
		  categoryinActive(id){
            axios.get(`/subcategoryinActive/${id}`).then((response) => {
                    // this.$router.push({name: 'home'});
                     // this.$router.push('/categorylist');
					 this.$store.dispatch("allsubCategoryFromDatabase")
					Toast.fire({
					icon: 'success',
					title: 'Category Active Successfully',
					
					})
			})
		  },


       deletesubCategory(id){
        
      		axios.get(`/categorysubdelete/${id}`).then((response) => {
                    // this.$router.push({name: 'home'});
                     // this.$router.push('/categorylist');
                    this.$store.dispatch("allsubCategoryFromDatabase")
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
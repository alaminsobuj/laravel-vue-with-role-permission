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
	                                <th>Status</th>
	                                <th>Action</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	                            <!-- v-for="(categorylist,index) in getCategoryList" :key='categorylist.id -->
	                            <tr v-for="(category,index) in getAllCategory" :key='category.id'>
	                            <!-- <tr v-for="(category,index) in laravelData.data" :key='category.id'> -->

	                                <td>{{index+1}}</td>
	                                <td> {{ category.cat_name }}</td>
	                                <td>
										<span v-if="category.status=='0'"><a class="btn btn-danger text-white" @click.prevent="categoryActive(category.id)">Inactive</a></span>    
                                        <span v-else><a class="btn btn-info text-white" @click.prevent="categoryinActive(category.id)">Active</a></span>              

	                                <td>
									<div v-for="checkPermission in getRoleWisePermissionList" :key="checkPermission.id">	
									 <div v-if="checkPermission.name=='category-edit'">	
                                     <router-link :to="`edit_category/${category.id}`" class="btn btn-info">
					                 <i class="fas fa-edit"></i>
					                </router-link>
									 </div>
									 <div v-if="checkPermission.name=='category-delete'">
	                                	<a class="btn btn-danger" @click.prevent="deleteCategory(category.id)"><i class="fa fa-trash text-white"></i></a>
	                                 </div>
									 </div>
									</td>
                                  
	                            </tr>
	                             <!-- <pagination :data="laravelData" @pagination-change-page="getResults"></pagination> -->
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

<!-- validation from check here 
https://dev.to/cleancodestudio/vue-form-validation-laravel-inspired-jej -->

<script>
export default {

     name: "List",
       // normal procesudre 
      mounted() {

        this.$store.dispatch("allCategoryFromDatabase")
		 this.$store.dispatch('getRoleWisePermissionList')

      },
      computed: {
        getAllCategory(){ //final output from here
            return this.$store.getters.getCategoryFormGetters
        },
		getRoleWisePermissionList(){      

			// alert(this.$store.getters.roleWisePermissionList);
			return this.$store.getters.roleWisePermissionList
		},
      },

      methods:{
		  categoryActive(id){
            axios.get(`/categoryActive/${id}`).then((response) => {
                    // this.$router.push({name: 'home'});
                     // this.$router.push('/categorylist');
					this.$store.dispatch("allCategoryFromDatabase")
					Toast.fire({
					icon: 'success',
					title: 'Category Active Successfully',
					
					})
			})
		  },
		  categoryinActive(id){
            axios.get(`/categoryinActive/${id}`).then((response) => {
                    // this.$router.push({name: 'home'});
                     // this.$router.push('/categorylist');
					this.$store.dispatch("allCategoryFromDatabase")
					Toast.fire({
					icon: 'success',
					title: 'Category Active Successfully',
					
					})
			})
		  },
      	deleteCategory(id){
        
      		axios.get(`/categorydelete/${id}`).then((response) => {
                    // this.$router.push({name: 'home'});
                     // this.$router.push('/categorylist');
                     this.$store.dispatch("allCategoryFromDatabase")
                     Toast.fire({
				        icon: 'success',
				        title: 'Category Delete Successfully',
				        
				      })
                })
      	}
      }


    // data() {
	// 	return {
	// 		// Our data object that holds the Laravel paginator data
	// 		laravelData: {},
	// 	}
	// },

	// mounted() {
	// 	// Fetch initial results
	// 	this.getResults();
	// },

	// methods: {
	// 	// Our method to GET results from a Laravel endpoint
	// 	getResults(page = 1) {
	// 		axios.get('categoryList?page=' + page)
	// 			.then(response => {
	// 				this.laravelData = response.data;
	// 			});
	// 	},

	// 	 	deleteCategory(id){
        

    //   		axios.get(`/categorydelete/${id}`).then((response) => {
    //   			this.getResults();
    //                 // this.$router.push({name: 'home'});
    //                  // this.$router.push('/categorylist');
    //                  this.$store.dispatch("allCategoryFromDatabase")
    //                  Toast.fire({
	// 			        icon: 'success',
	// 			        title: 'Category Delete Successfully',
				        
	// 			      })
    //             })
    //   	}

	// }

};
</script>
<style></style>
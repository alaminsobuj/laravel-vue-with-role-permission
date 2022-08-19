<template>
	  <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Quick Example</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form role="form" @submit.prevent="subCategorySave">
               
                <div class="card-body">
                  <div class="form-group">
                    <label for="cat_sub_name">Sub Category</label>
                    <input v-model='form.cat_sub_name' type="text" class="form-control" id="cat_sub_name" placeholder="Sub Category" name='cat_sub_name' >
                      <span v-if="form.errors.has('cat_sub_name')" v-html="form.errors.get('cat_sub_name')" :class="{ 'text-red is-invalid': form.errors.has('cat_sub_name') }"></span>
                  </div>
                  <div class="form-group">
                    <label for="cat_name">Category</label>
                    <!-- <input v-model='form.cat_name' type="text" class="form-control" id="cat_name" placeholder="Sub Category" name='cat_name' > -->
                    <select class="form-control" v-model="form.cat_id" name="cat_id">
                    	 <option value="">Select Category</option>
                    	 <option :value="category.id"  v-for="category in getAllCategory" :key='category.id'>{{category.cat_name}}</option>
                    </select>
                    <div v-if="form.errors.has('cat_id')" v-html="form.errors.get('cat_id')" :class="{ 'text-red is-invalid': form.errors.has('cat_id') }" />
                  </div>
                  
                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                  <button type="submit"  class="btn btn-primary">Submit</button>
                </div>
              </form>
            </div>
</template>

<script>
// import axios from 'axios'
export default {
   name:'add_subcategory',

   
    mounted() {

        this.$store.dispatch("allCategoryFromDatabase")

      },
      computed: {
        getAllCategory(){ //final output from here
            return this.$store.getters.getCategoryFormGetters
        }
     },

  data () {

  return {
      form: new Form({
      cat_sub_name: '',
      cat_id: '',
   
     })
      
     
    }

  },
  methods: {
  subCategorySave () {
     let self = this;

      this.form.post('subCategorySave')
      // .then(function (response) {
      //   // handle success
      //   // console.log(response);
      //   alert('laskdfalksdf');
      //    this.$router.push('/categorylist');

      // });
      .then(response=>{
          // console.log(response.data[0]);
        this.$router.push('/subcategorylist');
          Toast.fire({
              icon: 'success',
              title: 'Category Create Successfully'
          })
      }).catch(function (error) {
        // handle error

        // console.log(error);
      }).then(function () {
        // always executed
      });
    },
 
  }
          
}
</script> 
<style></style>
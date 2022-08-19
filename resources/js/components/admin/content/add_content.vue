<template>
	  <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Quick Example</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form role="form" @submit.prevent="contentsave" enctype="multipart/form-data" method="post">
               
                <div class="card-body">
              
                  <div class="form-group">
                    <label for="cat_name">Category</label>
              
                    <select class="form-control" v-model="category_id" name="category_id" @change="getSubcategory">
                    	 <option value="">Select Category</option>
                    	 <option :value="category.id"  v-for="category in getAllCategory" :key='category.id'>{{category.cat_name}}</option>
                    </select>
                    <div v-if="errors && errors.category_id">{{errors.category_id[0]}}</div>

                  </div>
                  <div class="form-group">
                    <label for="cat_name">Sub Category</label>
                
                    <select class="form-control" v-model="subcategory_id" name="subcategory_id">
                    	 <option value="">Select Category</option>
                    	 <option :value="sub_cat.id"  v-for="sub_cat in subcategory" :key='sub_cat.id'>{{sub_cat.cat_sub_name}}</option>
                    </select>
                     <div v-if="errors && errors.subcategory_id">{{errors.subcategory_id[0]}}</div>

                  </div>
                   <div class="form-group">
                    <label for="title">Content Title</label>
                    <input v-model='title' type="text" class="form-control" id="title" placeholder="Title" name='title' >
                    <div v-if="errors && errors.title">{{errors.title[0]}}</div>

                  </div>
                  <div class="form-group">
                    <label for="title">Content Description</label>
                   
                    <textarea v-model='description' type="text" class="form-control" id="description" placeholder="Description" name="description"></textarea>
                      <div v-if="errors && errors.description">{{errors.description[0]}}</div>
                  </div> 
                  <div class="form-group">
                    <label for="video_url">Content video url</label>
                    <input v-model='video_url' type="text" class="form-control" id="video_url" placeholder="video_url" name='video_url' >
                      <div v-if="errors && errors.video_url">{{errors.video_url[0]}}</div>

                  </div> 
                  <div class="form-group">
                    <label for="file">Content video url</label>
                
                    <input  type="file" class="form-control" id="file" v-on:change="getFiles">
                    <div v-if="errors && errors.file">{{errors.file[0]}}</div>
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
   name:'asdfasdfsd',

   
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
      subcategory:[],
      category_id:'',
      subcategory_id:'',
      title:'',
      description:'',
      video_url:'',
      file:'',
      errors:{},

     
    }

  },
  methods: {
  getFiles(e){
     this.file=e.target.files[0];
  },
  getSubcategory(){
     axios.get('/getsubcategoryBycategoryid/'+this.category_id).then((response) =>{
        this.subcategory=response.data.subcategoryList;
       })
  },
  contentsave (e) {
  	 const config = {
                    headers: {
                        'content-type': 'multipart/form-data'
                    }
                }
      let form = new FormData();
      form.append('category_id',this.category_id);
      form.append('subcategory_id',this.subcategory_id);
      form.append('title',this.title);
      form.append('description',this.description);
      form.append('video_url',this.video_url);
      form.append('file',this.file);

    

     axios.post('/ContentSave', form, config)
      .then(response=>{
          // console.log(response.data[0]);
        this.$router.push('/contentlist');
          Toast.fire({
              icon: 'success',
              title: 'Category Create Successfully'
          })
      }).catch(function (error) {
        // handle error
       // this.errors=error.response.data.errors;
        // console.log(error);
      }).then(function () {
        // always executed
      });
    },
 
  }
          
}
</script> 
<style></style>
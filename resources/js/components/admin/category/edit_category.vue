<template>
	<div class="card card-primary">
		<div class="card-header">
            <h3 class="card-title">Quick Example</h3>
         </div>
         <form role="form" @submit.prevent="categoryUpdate">
            <div class="card-body">
                  <div class="form-group">
                  	<label for="category">Category</label>
                    <input  type="text" class="form-control" id="category" placeholder="category" name='cat_name' v-model='form.cat_name' >
                  </div>
            </div>

         <div class="card-footer">
                  <button type="submit"  class="btn btn-primary">Submit</button>
                </div>
         </form>
    
    </div>
</template>


<script>
  export default {
     name:'ssss',
       mounted() {
         axios.get('/edit_category/'+this.$route.params.categoryid).then((response) =>{
         	this.form.fill(response.data.categoryById)
         })

       },
     data () {
  	  return {
  	      form: new Form({
  	      cat_name: '',
  	     })
  	     
  	    }
    },
    methods: {

     categoryUpdate() {
        this.form.post(`/update_category/${this.$route.params.categoryid}`)
        .then((response) => {
          
            this.$router.push('/categorylist');
        });
      }
   
    }
            
  };
</script>
<style></style>
<template>
	  <div class="card card-primary">
     <!-- <form> -->
      <div class="input-group mb-3" v-for="(input,k) in inputs" :key="k" >
          <input type="text" class="form-control" name="username[]" v-model="input.name" :key="input.id" :id="'username_'+input.id">

          <div class="input-group-prepend">
            <button class="btn btn-outline-secondary"  @click="add(k)" v-show="k == inputs.length-1" type="button"> <i class="fas fa-plus-circle"></i></button>

            <button class="btn btn-outline-secondary"  type="button" @click="remove(k)"
      v-show="k || ( !k && inputs.length > 1)"> <i
      class="fas fa-minus-circle"></i></button>
          </div>
         
        <!-- </form> -->
      </div>
       <button type="button" class="btn btn-primary" @click="save_addrow">Save changes</button>

          <!--   <div class="card-body">

              <div class="row">
                <div class="form-group" v-for="(input,k) in inputs" :key="k">
                   <label for="Test" class="col-sm-4">Test</label>
                   <div class=" col-sm-8">
                     <input type="text" class="form-control" v-model="input.name" />

                    <input type="text" class="form-control" v-model="input.party" />
                  
                      <i class="fas fa-plus-circle"
                        @click="add(k)"
                        v-show="k == inputs.length-1"
                      ></i>
                      <button class="btn">button</button>
                    
                   </div>
                </div>
              </div>
            </div> -->
              <div class="card-header">
                <h3 class="card-title">Quick Example</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
             
              <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                Launch demo modal
              </button>

              <!-- Modal -->
              <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <div class="modal-body">
          <form role="form" @submit.prevent="categorySave">
               
                <div class="card-body">
                  <div class="form-group" >
                    <label for="category">Category</label>
                    <!-- <input v-model='form.cat_name' type="text"  id="category" placeholder="category" name='cat_name' class="form-control"  :class="{ 'is-invalid': form.errors.has('cat_name') }">
                      <has-error :form="form" field="cat_name"></has-error> -->

                  <input v-model='form.cat_name' type="text"  id="category" placeholder="category" name='cat_name' class="form-control">
                  <div v-if="form.errors.has('cat_name')" v-html="form.errors.get('cat_name')" :class="{ 'text-red is-invalid': form.errors.has('cat_name') }" />

                  </div>
                  
                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                  <button type="submit"  class="btn btn-primary">Submit</button>
                </div>
              </form>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                      <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                  </div>
                </div>
              </div>


                 
            </div>

</template>

<script>
// import axios from 'axios'

export default {
   name:'add_category',
  data () {

  return {
      form: new Form({
      cat_name: '',
   
     }),
       inputs: [
          {
            id: 0,
            name: "",
            username: [],
            party: ""
          }
        ],

      allerros: [],
       success : false,

     
    }

  },
  methods: {
     add(index) {
        this.inputs.push({id:this.inputs.length, name: ""});
      },
      remove(index) {
        this.inputs.splice(index,1);
      },

  save_addrow (event){
    var multival=[];
    // console.log(this.inputs);
     for( var i = 0; i < this.inputs.length; i++ ){
         multival[i]= this.inputs[i].name;
      }
      // alert(multival);
      axios.post("CategoryController", {myArray: multival})
       .then(function (response) {
        // handle success
        console.log(response);
      });
  },
  categorySave () {
     let self = this;

      this.form.post('CategoryController')
      // .then(function (response) {
      //   // handle success
      //   // console.log(response);
      //   alert('laskdfalksdf');
      //    this.$router.push('/categorylist');
      // });
      .then(response=>{
          // console.log(response.data[0]);
        this.$router.push('/categorylist');
         this.allerros = [];
         this.form.cat_name ='';
         this.success = true;
          Toast.fire({
              icon: 'success',
              title: 'Category Create Successfully'
          })
         $("#exampleModal").modal('hide');
      }).catch(function (error) {
       // this.errors = error.response.data;
       this.allerros = error.response.data.errors;
        this.success = false;
      }).then(function () {
        // always executed
      });
    },
 
  }
          
}
</script> 
<style></style>
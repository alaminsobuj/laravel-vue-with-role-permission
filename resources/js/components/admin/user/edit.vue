<template>
	  <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Quick Example</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form role="form" @submit.prevent="userSave">
               
                <div class="card-body">
                  <div class="form-group">
                    <label for="name">Name</label>
                    <input v-model='form.name' type="text" class="form-control" id="name" placeholder="name" name='name' :class="{'is-invalid':form.errors.has('name')} ">
                      <div class="text-danger" v-if="form.errors.has('name')" v-html="form.errors.get('name')" />
                  </div>
                  <div class="form-group">
                    <label for="email">Email</label>
                    <input v-model='form.email' type="email" class="form-control" id="email" placeholder="email" name='email'  :class="{'is-invalid':form.errors.has('email')} ">
                    <div class="text-danger" v-if="form.errors.has('email')" v-html="form.errors.get('email')" />
                  </div>
                  <div class="form-group">
                    <label for="password">Password</label>
                    <input v-model='form.password' type="text" class="form-control" id="password" placeholder="password" name='password'  :class="{'is-invalid':form.errors.has('password')} ">
                    <div class="text-danger" v-if="form.errors.has('password')" v-html="form.errors.get('password')" />

                  </div>
                  <div class="form-group">
                    <label for="cpassword">Confirm Password</label>
                    <input v-model='form.cpassword' type="text" class="form-control" id="password" placeholder="Password" name='cpassword'  :class="{'is-invalid':form.errors.has('cpassword')} ">
                     <div class="text-danger" v-if="form.errors.has('cpassword')" v-html="form.errors.get('cpassword')" />
                  </div>

    
                  <div class="form-group">
                    <label for="roles">Role Assign</label>
                    <select class="form-control" v-model="form.roles" name="roles"  :class="{'is-invalid':form.errors.has('roles')} ">
                       <option value="">Select Role</option>
                       <option :value="roles.id"  v-for="roles in getAllRole" :key='roles.id'>{{roles.name}}</option>
                    </select>
                       <div class="text-danger" v-if="form.errors.has('roles')" v-html="form.errors.get('roles')" />
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
   name:'save',
  data () {

  return {
      form: new Form({
          name :'',
          email:'',
      password :'',
      cpassword:'',
      roles:[],

   
     })
     
    }

  },
    mounted() {
    	 this.$store.dispatch("getRoleList")
    

     },

     created(){
          axios.get('/edit_user/'+this.$route.params.user_id).then((response) =>{
         	this.form.fill(response.data.userById)
            this.form.password = ''
         })  
    },
  computed: {
    getAllRole(){ //final output from here
        return this.$store.getters.rolelist
    }
  },
  methods: {
  userSave () {
     let self = this;

      this.form.post(`/userUpdate/${this.$route.params.user_id}`)
      .then(response=>{
          // console.log(response.data[0]);
        this.$router.push('/users');
          Toast.fire({
              icon: 'success',
              title: 'User Create Successfully'
          })
      }).catch(function (error) {

      });
    },
 
  }
          
}
</script> 
<style></style>
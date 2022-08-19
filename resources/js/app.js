
require('./bootstrap');

window.Vue = require('vue').default;

import { Form, Error} from 'vform'
window.Form = Form;


//sweetalert2
import Swal from 'sweetalert2'

window.Swal = Swal;

const Toast = Swal.mixin({
  toast: true,
  position: 'top-end',
  showConfirmButton: false,
  timer: 3000,
  timerProgressBar: true,

  didOpen: (toast) => {
    toast.addEventListener('mouseenter', Swal.stopTimer)
    toast.addEventListener('mouseleave', Swal.resumeTimer)
  }
})

window.Toast = Toast;




// // vue router support
// import VueRouter from 'vue-router';

// Vue.use(VueRouter);

//vuex support
import Vuex from 'vuex'
Vue.use(Vuex)
import storeData from "./store/store"

const store = new Vuex.Store(
   storeData
)


Vue.component('example-component', require('./components/ExampleComponent.vue').default);
Vue.component('admin-master', require('./components/admin/adminmaster.vue').default);
Vue.component('pagination', require('laravel-vue-pagination'));
// vue router support
import VueRouter from 'vue-router';

Vue.use(VueRouter);
import { routes } from './routes';

const router = new VueRouter({
  routes,
  mode:'hash'
})

const app = new Vue({
    el: '#app',
    router,
    store
});

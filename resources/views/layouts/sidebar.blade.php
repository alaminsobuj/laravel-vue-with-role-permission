<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    
    <a href="index3.html" class="brand-link">
      <img src="{{ asset('assets/dist/img/AdminLTELogo.png')}}" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
           style="opacity: .8">
      <span class="brand-text font-weight-light">AdminLTE 3</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="{{ asset('assets/dist/img/user2-160x160.jpg')}}" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">{{Auth::user()->name}}</a>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item has-treeview">
            <router-link to ="/" class="nav-link ">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                Dashboard
               
              </p>
            </router-link>
            <router-link to ="/allpage" class="nav-link ">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
              allpage
               
              </p>
            </router-link>
            <router-link to ="/allPageList" class="nav-link ">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
              allPageList
               
              </p>
            </router-link>
          </li> 
        
            <li class="nav-item has-treeview">
            <a href="#" class="nav-link ">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                All Category
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
               @can('category-create')
                <router-link to ="/add_category" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Add Category</p>
                </router-link>
                @endcan
                @can('category-list')
                <router-link to="/categorylist" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>All Category</p>
                </router-link>
                @endcan
                @can('subcategory-create')
                <router-link to="/addSubcategory" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Add Subcategory</p>
                </router-link>
                @endcan
                @can('subcategory-list')
                <router-link to="/subcategorylist" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>All Subcategory</p>
                </router-link>
                @endcan
              </li>
           
            </ul>
          </li> 
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link ">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                Content
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
            @can('content-create')
              <li class="nav-item">
                <router-link to ="/addcontent" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Add Content</p>
                </router-link>
                
              </li>
              @endcan
              @can('content-list')
              <li class="nav-item">
                <router-link to ="/contentlist" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Content List</p>
                </router-link>
              </li>
              @endcan
           
            </ul>
          </li>
          @can('user-list')
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link ">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                User
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <router-link to ="/users" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>User</p>
                </router-link>
                
              </li>
            </ul>
            
          </li> 
          @endcan
          @can('role-list')
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link ">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                Role
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
              
              <ul class="nav nav-treeview">
              <li class="nav-item">
                <router-link to ="/roleList" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Role</p>
                </router-link>
                
              </li>
            </ul>
          </li> 
          @endcan
          
        
         
         

         
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>

      <!-- Page Content-->
      <main class="page-content">
              <section class="bg-image-06">
                <div class="breadcrumb-wrapper">
                  <div class="shell context-dark section-30 section-lg-top-120">
                    <h5>Enter the World of Travel</h5>
                    <h1 class="offset-top-20 text-ubold">Login/Register</h1>
                    <ol class="breadcrumb">
                      <li><a href="./">Home</a></li>
                      <li><a href="#">Pages</a></li>
                      <li>Login/Register
                      </li>
                    </ol>
                  </div>
                </div>
              </section>
        <section class="section-80 section-md-120">
          <div class="shell">
            <ul class="nav-custom">
              <li><a href=<?php echo base_url("login");?>>Login</a></li>
              <li><a href=<?php echo base_url("register");?> class="active">Register</a></li>
            </ul>
            <div class="range range-xs-center">
              <div class="cell-sm-8 cell-md-6 cell-lg-4">
                <!-- RD Mailform-->
                <form data-form-output="form-output-global" method="post" action="<?php echo base_url('crud/tambah_aksi'); ?>"  class="text-left">
                  <div class="form-group">
                    <label  class="form-label form-label-outside">Username or e-mail</label>
                    <input  type="text" name="username"  class="form-control form-control-gray">
                  </div>
                 
                  <div class="form-group">
                    <label  class="form-label form-label-outside">Password</label>
                    <input  type="password" name="password" class="form-control form-control-gray">
                  </div>

                   <div class="form-group">
                    <label  class="form-label form-label-outside">Fullname</label>
                    <input  type="text" name="fullname"  class="form-control form-control-gray">
                     <input  type="hidden" name="level"  class="form-control form-control-gray" value="user">
                  </div>
                  <button type="submit" class="btn btn-primary btn-block btn-sm offset-top-22">sign up</button>
                </form>
              </div>
            </div>
          </div>
        </section>
      </main>
   
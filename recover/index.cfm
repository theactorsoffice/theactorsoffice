<cfparam name="u" default="" />
<cfparam name="p" default="" />
<CFINCLUDE template="/include/remote_load.cfm" />
<cfoutput>#recoverid#</cfoutput><cfabort>
<cfif #isdefined('recoverid')# >
<cfoutput>Select * from taousers where userid = #recoverid#</cfoutput>
<cfquery name="U" datasource="#dsn#">
Select * from taousers where userid = #recoverid#
</cfquery>
<cfelse>
<cfquery name="U" datasource="#dsn#">
Select * from taousers where recover = '#recover#'
</cfquery>
</cfif>


	<cfif #u.recordcount# is not "1">
<cflocation url="/app/dashboard/" />

</cfif>
<cfoutput>
    <cfset cookie.recover = '#recover#' /></cfoutput>
<cfparam name="pwrong" default="N" />

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>Password Change | The Actor's Office</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="The Actor's Office Application" name="description" />
        <meta content="Jodie Bentley" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="/app/assets/images/favicon.ico">

        <!-- App css -->
        <link href="/app/assets/css/app.min.css?ver=#rand()#" rel="stylesheet" type="text/css" id="app-style" />
        <!-- icons -->
        <link href="/app/assets/css/icons.min.css" rel="stylesheet" type="text/css" />

    </head>

    <body class="loading" style="background-color: #406E8E;  font-family: 'Source Sans Pro', sans-serif;">

        <div class="account-pages mt-5 mb-5">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-8 col-lg-6 col-xl-5">
                        <div class="card ">

                            <div class="card-body p-4">
                                
                                <div class="text-center w-85 m-auto">
                                    <div class="auth-logo">
                                        <a href="index.html" class="logo logo-dark text-center">
                                            <span class="logo-lg">
                                                <img src="/assets/images/taowhite.png" alt="" style="width:100%">
                                            </span>
                                        </a>
                    
                                        <a href="index.html" class="logo logo-light text-center">
                                            <span class="logo-lg">
                                                <img src="/assets/images/logo-dark.png" alt="" style="width:100%">
                                            </span>
                                        </a>
                                    </div>
                                    <h5>Password Change</h5>
                                    <p class="text-muted mb-4 mt-3" style="font-size:14px;">Enter your information below to change your password.</p>
                                </div>

                                <form action="setup2.cfm" method="post"  autocomplete="off" class="parsley-examples"
                                       data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden"
  data-parsley-trigger="keyup" data-parsley-validate
                                      >
<input type="hidden" name="pwrong" value="N" />
                                    
                                    <Cfoutput>
                  <input type="hidden" name="new_userid" value="#u.userid#" />      
                                    <div class="row">
                                    
                                                    <div class="form-group mb-2 col-md-6">
                                        <label for="customerfirst"><strong>Name: </strong><span class="text-danger"></span></label>
                                       <span>#u.userfirstname# #u.userlastname#</span>
                                    </div>
                                    
                                        
                             
                                    
                                   
                                        </cfoutput>
                                        
                                                <div class="form-group mb-2  col-md-12">
                                            <label for="pass1">Password<span class="text-danger">*</span></label>
                                            <input id="pass1" type="password" name="pass1" placeholder="Password" 
                                                    data-parsley-minlength="8" data-parsley-required 
                                                     data-parsley-minlength-message="Password must be a min of 8 chars"
                                                   
                                                   class="form-control">
                                        </div>
                                        <div class="form-group mb-2  col-md-12">
                                            <label for="passWord2">Confirm Password <span class="text-danger">*</span></label>
                                            <input data-parsley-equalto="#pass1" name="pass2" type="password"   data-parsley-error-message="Passwords must match" 
                                                   data-parsley-minlength="8" data-parsley-required  data-parsley-minlength-message="Password must be a min of 8 chars"
                                                   placeholder="Password" class="form-control" id="passWord2">
                                        </div>

                                        
                                        
                                        
                                        
                         

                                    <div class="form-group mb-0 text-center col-md-12">
                                        <button class="btn btn-block" style="color: white;background-color: #406E8E;border-color:#406E8E;" type="submit" value="create"> Update Password </button>
                                    </div>
</div>
                                  
                                </form>


                        
                            </div> <!-- end card-body -->
                        </div>
                        <!-- end card -->

                      <!-- end row -->

                    </div> <!-- end col -->
                </div>
                <!-- end row -->
            </div>
            <!-- end container -->
        </div>
        <!-- end page -->


        <footer class="footer footer-alt text-white-50">
              &copy; 2021 The Actor's Office &trade; - All Right Reserved.
        </footer>

        <!-- Vendor js -->
        <script src="/assets/js/vendor.min.js"></script>

        <script src="/assets/libs/parsleyjs/parsley.min.js"></script>
        
        <!-- App js -->
        <script src="/assets/js/app.min.js"></script>
 <script>      
 $(document).ready(function() {
    $(".parsley-examples").parsley()
});
 </script>  
        
<script>
  $(document).ready(function(){
      
    $('#email_address').parsley();

    window.ParsleyValidator.addValidator('checkemail', {
      validateString: function(value)
      {
        return $.ajax({
          url:'fetch.php',
          method:"POST",
          data:{email:value},
          dataType:"json",
          success:function(data)
          {
            return true;
          }
        });
      }
    });

  });
</script>
        
    </body>
</html>
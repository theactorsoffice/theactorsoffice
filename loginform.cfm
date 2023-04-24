<cfinclude template="/include/remote_load.cfm" />

<cfquery name="fix"  datasource="#dsn#"  > 
					 SELECT u.userID  
                FROM taousers u
                INNER JOIN thrivecart t ON t.id = u.customerid
     INNER JOIN userstatuses us on us.userstatus = u.userstatus
                WHERE t.`status` = 'Completed' and u.userstatus <> 'active' 
                </cfquery> 

<cfloop query="fix">
    
 <cfset new_userid = fix.userid />
<cfquery name="fix2"  datasource="#dsn#"  > 
                Update taousers set userstatus = 'active' where userid = #new_userid#
   
                </cfquery> 

</cfloop>
 

<cfif #isdefined('session.userid')# > 
    
 <cfset StructDelete(Session, "userid")>
     
    </cfif>   
   
        
        <cfparam name="pgrecover" default="N" />

<cfparam name="pwrong" default="" /><cfparam name="u" default="" /><cfparam name="p" default="" />
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>Log In | The Actor's Office</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="The Actor's Office Application - The Actors Office" name="description" />
        <meta content="Jodie Bentley" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                    <meta name="robots" content="noindex">
        <!-- App favicon -->
        <link rel="shortcut icon" href="/app/assets/images/favicon.ico">
                  <link href="/app/assets/images/favicon.ico?rev=0.883930575695"  rel="shortcut icon"
                 type="text/css"  />
                
                    <script src="/app/assets/js/jquery-3.6.0.min.js"></script>
                    
                                <link href="/app/assets/css/app.min.css?rev=0.883930575695"  rel="stylesheet"
                 type="text/css" id="app-style" />
                
                                <link href="/app/assets/css/icons.min.css?rev=0.883930575695"  rel="stylesheet"
                 type="text/css"  />

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
                                                <img src="/app/assets/images/taowhite.png" alt="" height="60">
                                            </span>
                                        </a>
                    
                                        <a href="index.html" class="logo logo-light text-center">
                                            <span class="logo-lg">
                                                <img src="/app/assets/images/logo-dark.png" alt="" height="22">
                                            </span>
                                        </a>
                                    </div>
                                    <p class="text-muted mb-4 mt-3" style="font-size:14px;">Enter your email address and password.</p>
                                </div>
<Cfoutput>
		<cfif #pgrecover# is "Y">
	 
                                  <center>   <p style="color:green;">    Password Changed!</p></center>
               
		<cfset pgrecover = "N" />
	</cfif>
	
	<cfif #pwrong# is "Y">
	 <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                       Incorrect Email Address and Password!
                                    </div>
		<cfset pwrong = "N" />
	</cfif>
	
    
     
           
           
           
            <form id="demo-form" action="/app/login2.cfm" method="Post"> 
                <cfif #isdefined('xu')#>
                    <cfoutput>
                <input type="hidden" name="xu" value="#xu#" /></cfoutput>
                </cfif>
<input type="hidden" name="pwrong" value="N" /><input type="hidden" name="pwpass" value="Y" />
                                    <div class="form-group mb-3">
                                        <label for="emailaddress">Email Address</label>
                                        <input class="form-control" type="email" value="<cfoutput>#u#</cfoutput>" id="j_username" name="j_username" required="" placeholder="Enter your email">
                                    </div>

                                    <div class="form-group mb-3">
                                        <label for="password">Password</label>
                                        <div class="input-group input-group-merge">
                                            <input type="password" id="j_password" name="j_password" value="<cfoutput>#p#</cfoutput>" class="form-control" placeholder="Enter your password"> 
                                            <div class="input-group-append" data-password="false">
                                                <div class="input-group-text">
                                                    <span class="password-eye font-12"></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group mb-3">
                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" id="checkbox-signin" checked>
                                            <label class="custom-control-label" for="checkbox-signin">Remember me</label>
                                        </div>
                                    </div>

                                    <div class="form-group mb-0 text-center">
                                        <button class="btn btn-block" style="color: white;background-color: ##406E8E;border-color:##406E8E;" type="submit" value="Log In"> Log In </button>
                                    </div>

                                </form>
	</Cfoutput>

                            <cfif #isdefined('tessss')#>    <div class="text-center" >
                                    <h5 class="mt-3 text-muted">Sign in with</h5>
                                    <ul class="social-list list-inline mt-3 mb-0">
                                        <li class="list-inline-item">
                                            <a href="javascript: void(0);" class="social-list-item border-primary text-primary"><i class="mdi mdi-facebook"></i></a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a href="javascript: void(0);" class="social-list-item border-danger text-danger"><i class="mdi mdi-google"></i></a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a href="javascript: void(0);" class="social-list-item border-info text-info"><i class="mdi mdi-twitter"></i></a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a href="javascript: void(0);" class="social-list-item border-secondary text-secondary"><i class="mdi mdi-github"></i></a>
                                        </li>
                                    </ul>
                                </div></cfif>

                            </div> <!-- end card-body -->
                        </div>
                        <!-- end card -->

                    <div class="row mt-3">
                            <div class="col-12 text-center">
                                <p> <a href="auth-recoverpw.cfm" class="text-white-50 ml-1">Forgot your password?</a></p>     <cfif #isdefined('tessss')#>   
                                <p class="text-white-50">Don't have an account? <a href="auth-register.html" class="text-white ml-1"><b>Sign Up</b></a></p>
                            </div> <!-- end col -->
                        </div></cfif>
                        <!-- end row -->

                    </div> <!-- end col -->
                </div>
                <!-- end row -->
            </div>
            <!-- end container -->
        </div>
        <!-- end page -->


        <footer class="footer footer-alt text-white-50">
              &reg; 2022 The Actor's Office &trade; - All Right Reserved.
        </footer>

        <!-- Vendor js -->
        <script src="/app/assets/js/vendor.min.js"></script>
        


        <!-- App js -->
        <script src="/app/assets/js/app.min.js"></script>
        
    </body>
</html>
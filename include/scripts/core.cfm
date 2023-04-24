
    <!DOCTYPE html>

<cfinclude template="/include/pgload.cfm" />
<cfinclude template="/include/qry/menuitems.cfm">
    
    <cfset rev = "1.4" />
    
    
    <html lang="en">

    <head>
        <cfoutput>
            <meta charset="utf-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <title>#appName# | #pgTitle#</title>
            <meta content="#appDescription#" name="description" />
            <meta content="#appAuthor#" name="author" />
            <meta name="robots" content="noindex">
        </cfoutput>


        <cfloop query="FindLinksT">
            <cfoutput>
                <cfif "#findlinkst.linktype#" is "script">
                    <script src="#findlinkst.linkurl#?version=#rev#"></script>
                    <cfelseif "#findlinkst.linktype#" is "script_include">

                        <cfinclude template="#findlinkst.linkurl#?version=#rev#">

                            <cfelse>
                                <link href="#findlinkst.linkurl#" <cfif #findlinkst.rel# is not ""> rel="#rel#"
                </cfif> type="text/css" <cfif #findlinkst.hrefid# is not "">id="#findlinkst.hrefid#"</cfif> />
                </cfif>
            </cfoutput>
        </cfloop>
 
<cfset currentURL = cgi.server_name />
<cfset host = ListFirst(currentURL, ".") />
<cfif #host# is "app">
    <cfset hostcolor = "##406E8E" />
</cfif>
<cfif #host# is "dev">
    <cfset hostcolor = "##8b0000" />
</cfif>
<cfif #host# is "uat">
    <cfset hostcolor = "purple" />
</cfif>
<style>
body.authentication-bg {
    background-color: <cfoutput>#hostcolor#</cfoutput>;
	background-size: cover;
	background-position: center
}
    .navbar-custom {
	background-color: <cfoutput>#hostcolor#</cfoutput>;
	
}
    
    
</style>
   </head>

    <!-- body start -->

    <body >
        <!-- Begin page -->
        <div id="wrapper">
            <!-- Topbar Start -->
            <cfinclude template="/include/topbar.cfm" />
            <!-- end Topbar -->
            <!-- ========== Left Sidebar Start ========== -->
            <cfinclude template="/include/leftbar.cfm" />
            <!-- Left Sidebar End -->
            <!-- ============================================================== -->
            <!-- Start Page Content here -->
            <!-- ============================================================== -->
            <div class="content-page">
                <div class="content">
                    <!-- Start Content-->
                    <div class="container-fluid">
                        <!-- start page title -->
                        <div class="row">
                            <div class="col-12">
                                <div class="page-title-box">
                                    <div class="page-title-right">
                                        <ol class="breadcrumb m-0">
                                            <li class="breadcrumb-item"> <a href="<cfoutput>#home#/</cfoutput>">
                                                    <cfoutput>#appName# </cfoutput>
                                                </a>
                                            </li>

                                            <li class="breadcrumb-item"><a href="<cfoutput>/app/#compdir#</cfoutput>">
                                                    <cfoutput>#compName#</cfoutput>
                                                </a></li>


                                            <li class="breadcrumb-item active">
                                                <cfoutput>#pgName# </cfoutput>
                                            </li>


                                        </ol>
                                    </div>
                                    
                                    
                                    
                                    <h4 class="page-title">
                                        <cfoutput>
                                            <cfif #session.userid# is "303453453">#pgid# </cfif>#pgHeading#
                                            <A href="" data-bs-toggle="modal" data-bs-target="##custom-modal-diagnostic"></A>

                                            <cfif #pgid# is "89">
                                                <cfset session.pgrtn="D" />
                                                <span style="font-size:14px;"><a style="color: ##406e8e !important;" data-bsremote="true" data-bs-toggle="modal" data-bs-target="##paneladd" title="Add Custom Panel"><i class="fe-plus-circle"></i></a></span>

                                            </cfif>


                                            <cfif #pgid# is "5">
                                                <cfparam name="rcontactid" default="0" />
                                                <cfset session.pgrtn="D" />
                                                <span style="font-size:14px;"><a href="/app/appoint-add/?returnurl=calendar-appoint&amp;rcontactid=#rcontactid#&pgrtn=D" style="color: ##406e8e !important;" title="Add Appointment"><i class="fe-plus-circle"></i></a></span>

                                            </cfif>

                                        </cfoutput>
                                    </h4>
                                    
 
                                </div>
                            </div>
                        </div>
                        <!-- end page title -->
                        
      <script>
                         
$('#menu a').click(function (e) {
   e.preventDefault();
   $(this).parent().removeClass('active');
});
                        </script>
                        
        
                    
                         <cfif #pgFilename# is not "">
<cfoutput>
                        <cfinclude template="/include/#pgFilename#" />
</cfoutput>
                    </cfif>                
                     
                    </div> <!-- container -->
                </div> <!-- content -->
                <!-- Footer Start -->
                <cfinclude template="/include/footer.cfm" />
                <!-- end Footer -->
            </div>
            <!-- ============================================================== -->
            <!-- End Page content -->
            <!-- ============================================================== -->
        </div>
        <!-- END wrapper -->
        <!--- cfinclude template="/include/rightbar.cfm" --->


 
        <cfloop query="FindLinksB">
            <cfoutput>

                <cfif "#findlinksb.linktype#" is "script">


                    <script src="#findlinksb.linkurl#"></script>


                    <cfelseif "#findlinksb.linktype#" is "script_include">

                        <cfinclude template="#findlinksb.linkurl#">

                            <cfelse>

                                <link href="#findlinksb.linkurl#?rev=#rev#" <cfif #findlinksb.rel# is not ""> rel="#findlinksb.rel#"
                </cfif> type="text/css" <cfif #findlinksb.hrefid# is not "">id="#findlinksb.hrefid#"</cfif> />

                </cfif>

            </cfoutput>

        </cfloop>
           
                    <cfparam name="pgdir" default="">
                <cfparam name="pgid" default="0" />
                <script>
                    $(document).ready(function() {
                        $("#remoteSupportForm").on("show.bs.modal", function(event) {
                            // Place the returned HTML into the selected element
                            $(this).find(".modal-body").load("/include/RemoteSupportForm.cfm<cfoutput>?pgid=#pgid#&pgdir=#pgdir#&qstring=#cgi.query_string#&userrole=#userrole#</cfoutput>");
                        });
                    });
                </script>

                <div id="remoteSupportForm" class="modal fade " tabindex="-1" role="dialog" aria-labelledby="standard-modalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header" style="background-color: #f3f7f9;">
                                <h4 class="modal-title" id="standard-modalLabel">Support Center</h4>
                                <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="false"></button>
                            </div>
                            <div class="modal-body">
                            </div>
                        </div>
                    </div>
                </div>


        <script>
            $("#remoteSupportForm").draggable({
                handle: ".modal-header"
            });
        </script>

    </body>

    </html>
        
        <cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" /><cfinclude template="/include/bigbrotherinclude.cfm" /> 
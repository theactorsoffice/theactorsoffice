










<script>
$( function() {
  $( "#sortable" ).sortable();
  $( "#sortable" ).disableSelection();
} );
</script>


<div id="sortable" class="nomobile">

<cfif #ctaction# is "config">
    
    <div class="row">

        <div class="col-md-12">

            <form action="/include/savedashboard.cfm" >
    
                <center> 
      
                    <input type="submit" class="btn btn-primary editable-submit btn-sm waves-effect waves-light" value="Save Configuration" />

                </center> 

                <p>&nbsp;</p>
    
            </form>

        </div>

    </div>

    <div class="row"  id="simple-dragula" data-plugin="dragula" >

<cfelse>
    
    <div class="row"  data-masonry='{"percentPosition": true }'>

</cfif>

<cfset k=0 />

        <cfloop query="dashboards">

            <cfoutput>


                <cfset new_sitetypename="#replace('#dashboards.pntitle#',' Links','','All')#" />



            </cfoutput>


            <cfquery name="find_sitetypeid">
                SELECT * FROM sitetypes_user WHERE sitetypename = '#new_sitetypename#' and userid = #session.userid#
            </cfquery>

            <cfif #find_sitetypeid.recordcount# is "1">
                <cfset new_sitetypeid=find_sitetypeid.sitetypeid />

            </cfif>

            <cfoutput>
                <cfset k=#k# + 1 />
            </cfoutput>





            <cfset cardclass="" />

            <cfoutput>

                <div class="col-xl-#dashboards.pnColXl# col-md-#dashboards.pnColMd#">

                    <!-- Portlet card -->
<cfif #ctaction# is "view">
                    <cfset dashborder = "" />
                    
    <cfelse>
        <cfset dashborder = "border-success" />
                    </cfif>
                    <div class="card #dashborder#" style="border: 1px solid ##e5e5e5;border-radius:3px;">

                        <div class="card-body" dir="ltr">

                            <div class="card-widgets">
   <cfif #isdefined('blhblah')#>
                                <a data-bs-toggle="collapse" href="##cardCollpase#k#" role="button" aria-expanded="false" aria-controls="cardCollpase#k#"><i class="mdi mdi-plus"></i></a>

                             

                                    <a href="javascript: void(0);" data-bs-toggle="remove"><i class="mdi mdi-close"></i></a>

                                </cfif>

                            </div>

                            <h6 class="header-title">#dashboards.pnTitle# <cfif #dashboards.pntitle# is "Relationship Reminders"> 
                            <span class="badge bg-secondary small-badge">#nots_total#</span> </cfif></h6>

                            <div id="cardCollpase#k#" class="collapse pt-1 show">

            </cfoutput>



            <cfif #dashboards.pnfilename# is not "">

                <cfoutput>

                    <cfset pntitle="#dashboards.pnTitle#" />

                </cfoutput>

                <cfinclude template="/include/#dashboards.pnFilename#" />



            </cfif>




    </div> <!-- end collapse-->

</div> <!-- end card-body-->

</div> <!-- end card-->

</div>






</cfloop>

</div>
<!-- end row -->



</div>










<div class="mobile">

    <div class="row">

        <div class="col-xl-12">

            <div id="accordion_systems" class="mb-3">
                
                
                <cfloop query="dashboards">
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                      <cfoutput>

                <cfset new_sitetypename="#replace('#dashboards.pntitle#',' Links','','All')#" />


            </cfoutput>

            <cfquery name="find_sitetypeid">
                SELECT * FROM sitetypes_user WHERE sitetypename = '#new_sitetypename#' and userid = #session.userid#
            </cfquery>

            <cfif #find_sitetypeid.recordcount# is "1">
                <cfset new_sitetypeid=find_sitetypeid.sitetypeid />

            </cfif>

            <cfoutput>
                <cfset k=#k# + 1 />
            </cfoutput>





            <cfset cardclass="" />

       
                
                
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                       
                    
<cfif #new_sitetypeid# is "#target_id#">

    <cfset header_aria_exanded="true" />
    
    <cfset collapse_show = "collapse show" />

</cfif>

<cfif #new_sitetypeid# is not "#target_id#">

    <cfset header_aria_exanded="false" />
    
    <cfset collapse_show = "collapse" />

</cfif>              
    

    <div class="card mb-1">
               
                    <div class="card-header" id="heading_system_<cfoutput>#dashboards.currentrow#</cfoutput>">

                        <h5 class="m-0" style="width:100%'">

                            <a class="text-dark collapsed" data-bs-toggle="collapse" href="#collapse_system_<cfoutput>#dashboards.currentrow#</cfoutput>" aria-expanded="#header_aria_expanded#">

                                <cfoutput>#dashboards.pnTitle# <cfif #dashboards.pntitle# is "Relationship Reminders"> 
                            <span class="badge bg-secondary">#nots_total#</span> </cfif></cfoutput>  

                            </a>

                        </h5>

                    </div>

                    <div id="collapse_system_<cfoutput>#dashboards.currentrow#</cfoutput>" class="<cfoutput>#collapse_show#</cfoutput>" aria-labelledby="collapse_system_<cfoutput>#dashboards.currentrow#</cfoutput>" data-bs-parent="#accordion_systems"  >


                        <div class="card-body">

                            <p>
                                         <cfif #dashboards.pnfilename# is not "">

                <cfoutput>

                    <cfset pntitle="#dashboards.pnTitle#" />

                </cfoutput>

                <cfinclude template="/include/#dashboards.pnFilename#" />



            </cfif>

                            </p>

                        </div>

                    </div>

                </div>
                 
    
    
    
    
    
    
    
    
    
    
            </cfloop>  

            </div>

        </div>

    </div>

</div>





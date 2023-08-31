<script>
function getIndexInParent (el) {
  return Array.from(el.parentNode.children).indexOf(el)
}
</script>

<script>
// Move item in an array immutably
function moveItem (array, fromIndex, toIndex) {
  const arrayCopy = array.slice()
  const item = arrayCopy[fromIndex]
  arrayCopy.splice(fromIndex, 1) // remove field that's moving
  arrayCopy.splice(toIndex, 0, item) // add it back
  return arrayCopy
}
</script>

<cfparam name="pgaction" default="View" />
<cfparam name="nots_total" default="0" />
<cfparam name="batchlist" default="0" />

<cfif #pgaction# is "batch">
<cfif #batchlist# is not "0">
    
    
    
    
    
    
    
    
    
    <cfquery datasource="#dsn#" name="cnotsconfirm">
SELECT
                n.notID
          
                
                FROM funotifications n

    
                WHERE n.notid in (#batchlist#)
 
 
            </cfquery>

        
        
        
        
        

    <script type="text/javascript">
    $(window).on('load', function() {
        $('#batchconfirm').modal('show');
    });
</script>
    
    <div id="batchconfirm" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">

    <div class="modal-dialog">

        <div class="modal-content">

            <div class="modal-header">

                <h4 class="modal-title">

                    <cfoutput>Batch #batchtype# confirmation</cfoutput>

                </h4>
                
           

                <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>

            </div>

            <div class="modal-body">
             
                <cfoutput>
                      <form action="/include/batch#batchtype#.cfm">
                          <input type="hidden" name="batchlist" value="#batchlist#" />
                    <center>You are about to #batchtype# #numberformat(cnotsconfirm.recordcount)# reminders.</center>
                          <p>&nbsp;</p>
                            <center><input type="submit" value="Confirm" class="btn btn-primary btn-sm" /></center> 
                    </form>
                </cfoutput>

            </div>

        </div>

    </div>

</div>

</cfif>
    <cfset pgaction = "view" />
    </cfif>

<cfparam name="QUOTEOFTHEDAY" default="" />

<cfparam name="new_sitetypeid" default="0" />

<cfparam name="target_id" default="0">
    
<cfset pgcol=4 />
<script>
    $('[rel="tooltip"]').on('click', function() {
        $(this).tooltip('hide')
    })
</script>
<cfoutput>
    <div id="paneladd" class="modal fade" tabindex="-1" aria-labelledby="standard-modalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" style="background-color: ##f3f7f9;">
                    <h4 class="modal-title" id="standard-modalLabel">Custom Panel Add</h4>
                    <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>

                </div>
                <div class="modal-body">
                </div>
            </div>
        </div>
    </div>




    <script>
        $(document).ready(function() {
            $("##paneladd").on("show.bs.modal", function(event) {
                // Place the returned HTML into the selected element
                $(this).find(".modal-body").load("/include/remotePanelAdd.cfm?userid=#userid#&pgrtn=Z");
            });
        });
    </script>




</cfoutput>



<cfparam name="ctaction" default="view">

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
    
      <center> <input type="submit" class="btn btn-primary editable-submit btn-sm waves-effect waves-light" value="Save Configuration" /></center> 
    <p>&nbsp;</p>
    
    </form>
    </div>
    </div>
    </cfif>

<cfif #ctaction# is "config">
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





<script>
function openAllUrls() {
  const urls = siteurl_list.split(',');
  urls.forEach((url) => {
    window.open(url.trim(), '_blank');
  });
}
</script>

<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), " \")#" />
<cfinclude template="/include/bigbrotherinclude.cfm" />
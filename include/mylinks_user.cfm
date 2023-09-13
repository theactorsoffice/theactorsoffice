

<cfquery name="mylinks_user"  >	
SELECT 
s.id
,s.sitetypeid
,s.sitename
,s.siteurl
,s.siteicon
,s.sitetypeid
,t.sitetypename
,t.pntitle

FROM sitelinks_user s INNER JOIN sitetypes_user t ON t.sitetypeid = s.siteTypeid
WHERE s.userid = #userid# AND t.pntitle = '#pntitle#'
ORDER BY s.sitename
</cfquery>		
<cfquery name="all_links"  >	
SELECT 
  GROUP_CONCAT(s.siteurl ORDER BY s.siteurl ASC SEPARATOR ', ') AS siteurl_list
FROM sitelinks_user s 
INNER JOIN sitetypes_user t ON t.sitetypeid = s.siteTypeid
WHERE s.userid = #userid# AND t.pntitle = '#pntitle#';
</cfquery>


<cfoutput query="mylinks_user" maxrows="1">
<cfset new_sitetypeid = "#mylinks_user.sitetypeid#" />
</cfoutput>

    <cfoutput>

        <script>
            $(document).ready(function() {
                $("##addlink_#new_sitetypeid#").on("show.bs.modal", function(event) {
                    // Place the returned HTML into the selected element
                    $(this).find(".modal-body").load("/include/remotelinkAdd.cfm?new_sitetypeid=#new_sitetypeid#&userid=#userid#&target=dashboard_new");
                });
            });
        </script>

        <div id="addlink_#new_sitetypeid#" class="modal fade" tabindex="-1" aria-labelledby="standard-modalLabel" aria-hidden="true">

            <div class="modal-dialog">

                <div class="modal-content">

                    <div class="modal-header" style="background-color: ##f3f7f9;">

                        <h4 class="modal-title" id="standard-modalLabel">Add  #pntitle#</h4>

                        <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i>

                        </button>

                    </div>

                    <div class="modal-body">

                    </div>

                </div>

            </div>

        </div>

    </cfoutput>

<cfset siteurl_list = all_links.siteurl_list />

<cfoutput>
 
    <div class="card grid-item loaded" data-id="#dashboards.pnid#" >

    <div class="card-header" id="heading_system_#dashboards.currentrow#">

        <h5 class="m-0">

            <a class="text-dark collapsed" data-bs-toggle="collapse"  href="##collapse_system_#dashboards.currentrow#"  >

                #dashboards.pnTitle# 
 
            </a>

        </h5>

    </div>

</cfoutput>

    <div class="card-body">

        <div class="row">

        <cfloop query="mylinks_user">


        
    <cfoutput>

        <script>
            $(document).ready(function() {
                $("##updatelink_#mylinks_user.id#").on("show.bs.modal", function(event) {
                    // Place the returned HTML into the selected element
                    $(this).find(".modal-body").load("/include/remotelinkUpdate.cfm?id=#mylinks_user.id#&target=dashboard_new");
                });
            });
        </script>


        <div id="updatelink_#mylinks_user.id#" class="modal fade" tabindex="-1" aria-labelledby="standard-modalLabel" aria-hidden="true">

            <div class="modal-dialog">

                <div class="modal-content">

                    <div class="modal-header" style="background-color: ##f3f7f9;">

                        <h4 class="modal-title" id="standard-modalLabel">#mylinks_user.sitetypename# Link Update</h4>

                        <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true">

                            <i class="mdi mdi-close-thick"></i>

                        </button>

                    </div>

                    <div class="modal-body">

                    </div>

                </div>

            </div>

        </div>

    </cfoutput>






            <div class="col-md-12">
                                                
                <Cfoutput>

                    <a href="#mylinks_user.siteurl#" class="text-reset font-14 py-1 px-1 d-inline-block"  target="#mylinks_user.sitename#"  title="#mylinks_user.sitename#" >

                    <img src="/app/assets/images/retina-circular-icons/14/#mylinks_user.siteicon#" style="width:14px;" alt="#mylinks_user.sitename#" />
            
                        #mylinks_user.sitename#

                    </a> 





 <span id="edit_#mylinks_user.id#" class="hide-edit-icon" data-card-id="#dashboards.pnid#">
        <a title="Edit" href="" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##updatelink_#mylinks_user.id#">
 <i class="mdi mdi-square-edit-outline"></i>
 </a>
 </span>


                </Cfoutput>
            
            </div><!-- end col-md-12 -->

        </cfloop>

            <div class="col-md-12 col-lg-12">

                <Cfoutput>
 
 <button onclick="openAllUrls('#siteurl_list#')" style="border: 1px solid ##406E8E!important;
    outline: none!important; color: ##406E8E!important;" class="badge badge-light text-dark">
  
  <i class="mdi  mdi-book-plus-multiple"></i> Open All

</button> 

           

            </div><!-- end col-md-12 -->

        </div><!--row end-->

</div><!--card-body end -->
    
 <div class="card-footer bg-light d-flex justify-content-between">

 
 

<button class="btn btn-link toggle_edit_mode" data-card-id="#dashboards.pnid#"><i class="mdi mdi-square-edit-outline"></i></button>


      <a class="btn btn-link" href="addlink.cfm" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##addlink_#new_sitetypeid#"><i class="fe-plus-circle"></i></a>

    </cfoutput>

  </div><!--end card footer -->
    
</div><!--end card -->

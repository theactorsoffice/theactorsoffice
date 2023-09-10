<cfinclude template="/include/qry/mylinks_user.cfm" />  

<cfset siteurl_list = all_links.siteurl_list />

<cfoutput>
 
<div class="card grid-item loaded" data-id="#dashboards.pnid#">
 
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

            <div class="col-md-12">
                                                
                <Cfoutput>

                    <a href="#mylinks_user.siteurl#" class="text-reset font-14 py-1 px-1 d-inline-block"  target="#mylinks_user.sitename#"  title="#mylinks_user.sitename#" >

                    <img src="/app/assets/images/retina-circular-icons/32/#mylinks_user.siteicon#" style="width:14px;" alt="#mylinks_user.sitename#" />
            
                        #mylinks_user.sitename#

                    </a> 
                                                            
                    <span id="edit_#mylinks_user.id#"><i class="mdi mdi-square-edit-outline"></i></span>

                </Cfoutput>
            
            </div><!-- end col-md-12 -->

        </cfloop>

            <div class="col-md-12 col-lg-12">

                <Cfoutput>
 


<button onclick="openAllUrls('#siteurl_list#')" class="badge badge-blue">
  <i class="mdi  mdi-book-plus-multiple"></i>
</button>



                </cfoutput>

            </div><!-- end col-md-12 -->

        </div><!--row end-->

</div><!--card-body end -->
    
 <div class="card-footer bg-light d-flex justify-content-between">

    <cfoutput>

      <a href="" class="btn btn-link"><i class="mdi mdi-square-edit-outline"></i></a>

      <a href="" class="btn btn-link"><i class="fe-plus-circle"></i></a>

    </cfoutput>

  </div><!--end card footer -->
    
</div><!--end card -->

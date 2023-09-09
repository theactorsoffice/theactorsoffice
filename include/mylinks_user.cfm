
<cfinclude template="/include/qry/mylinks_user.cfm" />  

<Cfoutput>

    <cfset siteurl_list = "#all_links.siteurl_list#" />

    <button onclick="openAllUrls('#siteurl_list#')" class="badge badge-blue">Open All</button>

</cfoutput>

<div class="row">

    <cfloop query="mylinks_user">

        <div class="col-md-12 col-lg-12">
                                                
            <Cfoutput>

                <a href="#mylinks_user.siteurl#" class="text-reset font-14 py-1 px-1 d-inline-block"  target="#mylinks_user.sitename#"  title="#mylinks_user.sitename#" >

                    <img src="/app/assets/images/retina-circular-icons/32/#mylinks_user.siteicon#" style="width:14px;" alt="#mylinks_user.sitename#" />
        
                    #mylinks_user.sitename#

                </a> 
                                                        
                <span id="edit_#mylinks_user.new_sitype_id#">
                                                        
                    <i class="mdi mdi-square-edit-outline"></i>

                </span>

            </Cfoutput>
            
        </div>

    </cfloop>
    
    <div class="col-md-12 col-lg-12">

     <p>

      <cfoutput>  
      
       <a href=""><i class="mdi mdi-square-edit-outline"></i></a>

       <a href=""><i class="fe-plus-circle"></i></a>

       </cfoutput>
       
     </p>

    </div>
    
</div>
    


<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" />

<cfinclude template="/include/bigbrotherinclude.cfm" /> 

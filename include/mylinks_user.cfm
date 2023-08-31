
<cfinclude template="/include/qry/mylinks_user.cfm" />  
<!--- This is just an example of how the siteurl_list might be set in ColdFusion --->
<Cfoutput>
<cfset siteurl_list = "#all_links.siteurl_list#">

<!--- Embed the siteurl_list into JavaScript --->
<script>
  const siteurl_list = "#siteurl_list#";
</script></cfoutput>
<button onclick="openAllUrls()">Open All URLs</button>


<div class="row">
<cfloop query="mylinks_user">
    <div class="col-md-12 col-lg-12">
                                                    <cfoutput>
                                                        <cfif #mylinks_user.currentrow# is "1">
                                                       
                                                        </cfif>
                                                   <a href="#mylinks_user.siteurl#" class="text-reset font-14 py-1 px-1 d-inline-block"  target="#mylinks_user.sitename#"  title="#mylinks_user.sitename#" >
                                                   <img src="/app/assets/images/retina-circular-icons/32/#mylinks_user.siteicon#" style="width:14px;" alt="#mylinks_user.sitename#"  /> #mylinks_user.sitename#
                                                </a>
                                                
                                                
                                                
                                                </Cfoutput>
        
    </div>
        </cfloop>
    
    
     <div class="col-md-12 col-lg-12">
     <p style="text-align: center;">
      <cfoutput>   <a href="/app/myaccount/?t1=1&target_id=#new_sitetypeid#"><i class="mdi mdi-square-edit-outline"></i></a></cfoutput>
     </p>
 </div>
    
    
    </div>
    


<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" /><cfinclude template="/include/bigbrotherinclude.cfm" /> 

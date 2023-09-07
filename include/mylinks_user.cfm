
<cfinclude template="/include/qry/mylinks_user.cfm" />  
<!--- This is just an example of how the siteurl_list might be set in ColdFusion --->
<Cfoutput>
<cfset siteurl_list = "#all_links.siteurl_list#">

<!--- Embed the siteurl_list into JavaScript --->

 <button onclick="openAllUrls('#siteurl_list#')" class="badge badge-blue">Open All</button>

</cfoutput>
<div class="row">
<cfloop query="mylinks_user">
    <div class="col-md-12 col-lg-12">
                                                    <cfoutput>
                                                        <cfif #mylinks_user.currentrow# is "1">
                                                       
                                                        </cfif>




<a href="#mylinks_user.siteurl#" class="text-reset font-14 py-1 px-1 d-inline-block"  target="#mylinks_user.sitename#"  title="#mylinks_user.sitename#" >

<cfif #mylinks_user.siteicon# is "unknown.png">
<cfset fullURL = mylinks_user.siteurl> <!-- Let's say fullURL = "http://www.example.com/some/path?param=value" -->
<cfset urlArray = listToArray(fullURL, "/")> <!-- Split by "/" -->

<!-- Check if the URL starts with "http://" or "https://" -->
<cfif listFirst(fullURL, ":") is "http" or listFirst(fullURL, ":") is "https">
    <cfset domainName = urlArray[3]> <!-- The domain should be the 3rd element in the array -->
<cfelse>
    <cfset domainName = urlArray[1]> <!-- If no "http://", it should be the first -->
</cfif>

 


<img  src=https://t3.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=#domainName#&size=14" style="width:14px;" alt="#mylinks_user.sitename#" />


<cfelse>
<img src="/app/assets/images/retina-circular-icons/32/#mylinks_user.siteicon#" style="width:14px;" alt="#mylinks_user.sitename#"  />
</cfif>

#mylinks_user.sitename#
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

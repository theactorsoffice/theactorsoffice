
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

 <Cfset siteurl = "#mylinks_user.siteurl#" />
   <!-- Add 'http' if missing -->
    <cfif NOT findNoCase("http", siteurl)>
        <cfset siteurl = "http://" & siteurl />
    </cfif>

    <!-- Extract the root URL -->
    <cfset protocol = listFirst(siteurl, "://") & "://">
    <cfset tempUrl = listRest(siteurl, "://")>
    <cfset domain = listFirst(tempUrl, "/")>
    <cfset rootUrl = protocol & domain>

<cfif left(domain, 4) is "www.">
    <cfset domain = right(domain, len(domain) - 4)>
</cfif>
 

<img  src="https://icon.horse/icon/#domain#?apikey=996ca328-b4b1-47a7-8d41-e5255525ab6b&fallback_bg=406e8e&size=small&ignore_other_sizes=false" style="width:14px;" alt="#mylinks_user.sitename#" /> 


   <cfhttp url="https://icon.horse/icon/#domain#?apikey=996ca328-b4b1-47a7-8d41-e5255525ab6b&fallback_bg=406e8e&size=small&ignore_other_sizes=false" method="get" getAsBinary="yes" result="icoResult"></cfhttp>



</cfoutput>




 <cfif icoResult.statusCode EQ "200 OK">
            <!-- File Paths -->
            <cfset tempDir = GetTempDirectory()>
            <cfset tempFileName = tempDir & CreateObject("java", "java.io.File").separator & "favicon_#mylnks_user.id#.ico">
            <cfset pngFileName = tempDir & CreateObject("java", "java.io.File").separator & "favicon_#mylinks_user.id#.png">
            
            <!-- Write the ICO file -->
            <cffile action="write"
                    file="#tempFileName#"
                    output="#icoResult.fileContent#"
                    mode="777">
            </cffile>
            
            <!-- Convert ICO to PNG using ImageMagick -->
            <cfexecute name="C:\Program Files\ImageMagick-7.1.1-Q16-HDRI\magick.exe" 
                       arguments="convert #tempFileName# #pngFileName#"
                       timeout="60">
            </cfexecute>
            
            <!-- Read PNG and Save -->
            <cfimage action="read" source="#pngFileName#" name="imageObj">
            <cfimage action="write" destination="#image_dir#\custom_#id#.png" source="#imageObj#" format="png"></cfimage>
            
            <!-- Update Record -->
            <cfset new_siteicon = "custom_#id#.png">
            <cfquery datasource="abo" name="update">
                update sitelinks_user 
                set siteicon = '#new_siteicon#'
                where id = #mylinks_user.id#
            </cfquery>





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

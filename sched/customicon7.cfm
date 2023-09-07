


<cfquery datasource="abod" name="x" maxrows="50">
SELECT id,sitename,siteurl,siteicon FROM sitelinks_user WHERE iscustom = 1 AND siteicon = 'unknown.png' 
</cfquery>

<cfloop query="x">
    <cfset id = x.id />
    <cfset siteurl = x.siteurl />

   

 

<cftry>

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
    
    
    <cfset image_dir = "C:\home\theactorsoffice.com\wwwroot\app-subdomain_1.5\app\assets\images\retina-circular-icons\32" />
<cfset image_dir_dev = "C:\home\theactorsoffice.com\wwwroot\dev-subdomain\app\assets\images\retina-circular-icons\32" />
<cfset image_dir_uat = "C:\home\theactorsoffice.com\wwwroot\uat-subdomain\app\assets\images\retina-circular-icons\32" />

 
<cfhttp url="https://icon.horse/icon/#domain#?apikey=996ca328-b4b1-47a7-8d41-e5255525ab6b&fallback_bg=406e8e&size=small&ignore_other_sizes=false" method="get" getAsBinary="yes" result="icoResult"></cfhttp>

 
 <cfif icoResult.statusCode EQ "200 OK">
 


<!-- Save the downloaded image to a temp file -->


 
<cfset tempFile = "#image_dir#\temp\custom_#id#.tmp">
<cfset pngFile = "#image_dir#\custom_#id#.png">

<cffile action="write" file="#tempFile#" output="#icoResult.filecontent#">

      <cfexecute name="C:\Program Files\ImageMagick-7.1.1-Q16-HDRI\magick.exe" 
                   arguments="convert #tempFile# #pngFile#"
                   timeout="60">
        </cfexecute>



<!-- Now the image is in PNG format and stored at #pngFile# -->

<!-- Repeat for dev and uat directories -->
<cfset pngFile_dev = "#image_dir_dev#\custom_#id#.png">
 
      <cfexecute name="C:\Program Files\ImageMagick-7.1.1-Q16-HDRI\magick.exe" 
                   arguments="convert #tempFile# #pngFile_dev#"
                   timeout="60">
        </cfexecute>

<cfset pngFile_uat = "#image_dir_uat#\custom_#id#.png">

      <cfexecute name="C:\Program Files\ImageMagick-7.1.1-Q16-HDRI\magick.exe" 
                   arguments="convert #tempFile# #pngFile_uat#"
                   timeout="60">
        </cfexecute>

            <!-- Update Record -->
            <cfset new_siteicon = "custom_#id#.png">
            <cfquery datasource="abod" name="update">
                update sitelinks_user 
                set siteicon = '#new_siteicon#'
                where id = #x.id#
            </cfquery>
     <cfquery datasource="abod" name="update">
                update sitelinks_user 
                set siteicon = '#new_siteicon#'
                where id = #x.id#
            </cfquery>


</cfif>

 <cfoutput>
   
    <cfquery datasource="abod" name="find" maxrows=1>
SELECT id,sitename,siteurl,siteicon FROM sitelinks_user WHERE id = #id#
</cfquery>



<img src="/app/assets/images/retina-circular-icons/32/#find.siteicon#" style="width:14px;" alt="#find.sitename#"  /><BR>
#find.sitename#<BR>
    </cfoutput>

<cfcatch>
error<BR>
</cfcatch>
</cftry>
</cfloop>

 
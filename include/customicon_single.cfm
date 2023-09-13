<!-- id and siteurl needed -->

<cfparam name="dbug" default="Y" />

 <cfquery datasource="#dsn#" name="x" >
     SELECT id,sitename,siteurl,siteicon FROM sitelinks_user WHERE id = #id#
 </cfquery>

 <Cfset siteurl = x.siteurl />

     <cfif NOT findNoCase("http", siteurl)>

         <cfset siteurl="http://" & siteurl />

     </cfif>

     <!-- Extract the root URL -->

     <cfset protocol=listFirst(siteurl, "://" ) & "://" />

     <cfset tempUrl=listRest(siteurl, "://" ) />

     <cfset domain=listFirst(tempUrl, "/" ) />

     <cfset rootUrl=protocol & domain />

     <cfif left(domain, 4) is "www.">

         <cfset domain=right(domain, len(domain) - 4) />

     </cfif>

     <cfoutput>

         <cfset image_dir="C:\home\theactorsoffice.com\wwwroot\#host#-subdomain#suffix#\app\assets\images\retina-circular-icons\14" />

     </cfoutput>

     <cfset image_dir_app="C:\home\theactorsoffice.com\wwwroot\app-subdomain_1.5\app\assets\images\retina-circular-icons\14" />

     <cfset image_dir_dev="C:\home\theactorsoffice.com\wwwroot\dev-subdomain\app\assets\images\retina-circular-icons\14" />

     <cfset image_dir_uat="C:\home\theactorsoffice.com\wwwroot\uat-subdomain\app\assets\images\retina-circular-icons\14" />

     <cfhttp url="https://icon.horse/icon/#domain#?apikey=996ca328-b4b1-47a7-8d41-e5255525ab6b&fallback_bg=406e8e&size=small&ignore_other_sizes=false" method="get" getAsBinary="yes" result="icoResult"></cfhttp>

     <cfif #dbug# is "Y">
     
     <cfdump var="#icoResult#">

     <p><cfoutput>cfhttp: https://icon.horse/icon/#domain#?apikey=996ca328-b4b1-47a7-8d41-e5255525ab6b&fallback_bg=406e8e&size=small&ignore_other_sizes=false</cfoutput></p>

     </cfif>
     
     <cfif icoResult.statusCode EQ "200 OK">

     <!-- Determine the file extension based on Content-Type -->
    <cfset contentType = icoResult.responseHeader["Content-Type"]>
 
    <cfset fileExtension = ".ico"> <!-- Default to .ico -->
    <cfif contentType EQ "image/png">
        <cfset fileExtension = ".png">
    <cfelseif contentType EQ "image/jpeg">
        <cfset fileExtension = ".jpg">
    </cfif>

     <cfif #dbug# is "Y">

     <p>status is ok</p>

     </cfif>

         <cfset tempFile="#image_dir#\temp\custom_#id##fileExtension#" />

         <cfset pngFile="#image_dir#\custom_#id#.png" />

          <cfif #dbug# is "Y">

    <p>temp file: <cfoutput>#tempFile#</cfoutput></p>

    <p>png file: <cfoutput>#pngFile#</cfoutput></p>

 </cfif>

         <cffile action="write" file="#tempFile#" output="#icoResult.filecontent#" />

         <cfexecute name="C:\Program Files\ImageMagick-7.1.1-Q16-HDRI\magick.exe" arguments="convert #tempFile# #pngFile#" timeout="60">
         </cfexecute>

         <!-- Filename -->

         <cfset fileName="custom_#id#.png">

          <p>filename: <cfoutput>#filename#</cfoutput></p>

             <!-- Determine which environment we're in -->

            <cfif image_dir EQ image_dir_dev>

         <cffile action="copy" source="#image_dir_dev#\#pngfile#" destination="#image_dir_uat#" nameconflict="overwrite" />

            <cfelseif image_dir EQ image_dir_uat>

    <cffile action="copy" source="#image_dir_uat#\#pngfile#" destination="#image_dir_dev#" nameconflict="overwrite" />

            </cfif>

             <!-- Loop over the other two directories to copy the file -->

             <cfquery datasource="#dsn#" name="update">
                 update sitelinks_user
                 set siteicon = '#filename#'
                 where id = #id#
             </cfquery>

     


</cfif>

 
 <cfif  #dbug# is "y">
 
 <cfabort>
 </cfif>
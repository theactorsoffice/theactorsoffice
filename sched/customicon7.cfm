 <CFINCLUDE template="/include/remote_load.cfm" />

 <cfquery datasource="#dsn#" name="x" maxrows="50">
     SELECT id,sitename,siteurl,siteicon FROM sitelinks_user WHERE iscustom = 1 AND siteicon = 'unknown.png'
 </cfquery>

 <cfloop query="x">

      <cftry>

     <cfset id=x.id />

     <cfset siteurl=x.siteurl />

     <!-- Add 'http' if missing -->

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

         <cfset image_dir="C:\home\theactorsoffice.com\wwwroot\#host#-subdomain#suffix#\app\assets\images\retina-circular-icons\32" />

     </cfoutput>

     <cfset image_dir_app="C:\home\theactorsoffice.com\wwwroot\app-subdomain_1.5\app\assets\images\retina-circular-icons\32" />

     <cfset image_dir_dev="C:\home\theactorsoffice.com\wwwroot\dev-subdomain\app\assets\images\retina-circular-icons\32" />

     <cfset image_dir_uat="C:\home\theactorsoffice.com\wwwroot\uat-subdomain\app\assets\images\retina-circular-icons\32" />



     <cfhttp url="https://icon.horse/icon/#domain#?apikey=996ca328-b4b1-47a7-8d41-e5255525ab6b&fallback_bg=406e8e&size=small&ignore_other_sizes=false" method="get" getAsBinary="yes" result="icoResult"></cfhttp>

     <cfif icoResult.statusCode EQ "200 OK">

         <cfset tempFile="#image_dir#\temp\custom_#id#.tmp" />

         <cfset pngFile="#image_dir#\custom_#id#.png" />

         <cffile action="write" file="#tempFile#" output="#icoResult.filecontent#" />

         <cfexecute name="C:\Program Files\ImageMagick-7.1.1-Q16-HDRI\magick.exe" arguments="convert #tempFile# #pngFile#" timeout="60">
         </cfexecute>

         <!-- Filename -->

         <cfset fileName="custom_#id#.png">

             <!-- Determine which environment we're in -->

             <cfif image_dir EQ image_dir_dev>

                 <cfset otherDirs=[image_dir_uat, image_dir_app] />

                 <cfelseif image_dir EQ image_dir_uat>

                     <cfset otherDirs=[image_dir_dev, image_dir_app] />

                     <cfelseif image_dir EQ image_dir_app>

                         <cfset otherDirs=[image_dir_dev, image_dir_uat] />

             </cfif>

             <!-- Loop over the other two directories to copy the file -->

             <cfloop array="#otherDirs#" index="targetDir">

                 <cffile action="copy" source="#image_dir#\#fileName#" destination="#targetDir#\#fileName#" />

             </cfloop>

             <cfquery datasource="#dsn#" name="update">
                 update sitelinks_user
                 set siteicon = '#filename#'
                 where id = #id#
             </cfquery>

             <cfif #dsn# is "abo">

                 <cfquery datasource="abod" name="update">
                     update sitelinks_user
                     set siteicon = '#filename#'
                     where siteurl = '#siteurl#'
                 </cfquery>

             </cfif>

             <cfif #dsn# is "abod">

                 <cfquery datasource="abo" name="update">
                     update sitelinks_user
                     set siteicon = '#filename#'
                     where siteurl = '#siteurl#'
                 </cfquery>

             </cfif>

     </cfif>

 <cfcatch type="any">
    <cfoutput>
      <!-- Basic error information -->
      <p><strong>Error Type:</strong> #cfcatch.type#</p>
      <p><strong>Error Message:</strong> #cfcatch.message#</p>
      <p><strong>Error Detail:</strong> #cfcatch.detail#</p>
      
      <!-- Advanced error information -->
      <p><strong>Extended Info:</strong> #cfcatch.ExtendedInfo#</p>
      <p><strong>Error Code:</strong> #cfcatch.ErrorCode#</p>


    </cfoutput>
  </cfcatch>
</cftry>
 </cfloop>
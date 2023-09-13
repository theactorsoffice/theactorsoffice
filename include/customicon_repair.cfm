 <CFINCLUDE template="/include/remote_load.cfm" />

 <cfquery datasource="#dsn#" name="z" >
     SELECT id,sitename,siteurl,siteicon FROM sitelinks_user WHERE iscustom = 1 AND siteicon <> 'unknown.png'
 </cfquery>

<cfloop query="z">
   <cfoutput>

         <cfset image_dir="C:\home\theactorsoffice.com\wwwroot\#host#-subdomain#suffix#\app\assets\images\retina-circular-icons\14" />

     </cfoutput>

<cfset image_location = "#image_dir#\#z.siteicon#" />

<!-- check to see if #image_location# file is an image and exists.  -->

    <cfif FileExists(image_location) AND IsImageFile(image_location)>
        <!-- File exists and is an image, do nothing -->
    <cfelse>

<cfquery datasource="#dsn#" name="update" >
    UPDATE sitelinks_user set siteicon = 'unknown.png' where id = #z.id#
 </cfquery>
<cfoutput>#id# removed!<BR></cfoutput>
 </cfif>

</cfloop>
</cfif>

 <CFINCLUDE template="/include/remote_load.cfm" />

<cfquery datasource="#dsn#" name="x" maxrows="1">
SELECT id, sitename, siteurl, siteicon FROM sitelinks_user 
WHERE id = #new_id#
</cfquery>

<cfloop query="x">
    <cfset id = x.id />
    <cfset siteurl = x.siteurl />
<cfoutput>siteurl: #siteurl#<BR></cfoutput>
 
    <cfif NOT findNoCase("http", siteurl)>
        <cfset siteurl = "http://" & siteurl />
    </cfif>
 
    <cfset protocol = listFirst(siteurl, "://") & "://">
    <cfset tempUrl = listRest(siteurl, "://")>
    <cfset domain = listFirst(tempUrl, "/")>
    <cfset rootUrl = protocol & domain>

    <cfhttp url="#rootUrl#/favicon.ico"  timeout="30" method="get" getAsBinary="yes" result="result" />
<cfoutput>url: #rootUrl#/favicon.ico<BR></cfoutput>
    <!-- Check if cfhttp was successful and the content type indicates an image -->
    <cfif result.statusCode EQ "200 OK">

    result is okay!<BR>
      <cfif StructKeyExists(result.responseHeader, "Content-Type")>
    structkey exists!<BR>

        <!-- Temp file paths -->

        <cfset tempDir ="C:\home\theactorsoffice.com\wwwroot\app-subdomain_1.5\app\assets\images\retina-circular-icons\32\temp" />
<Cfoutput>tempdir: #tempDir#<BR></cfoutput>
        <cfset tempFileName = tempDir & CreateObject("java", "java.io.File").separator & "favicon_#id#.ico">
<Cfoutput>tempfilename: #tempFileName#<BR></cfoutput>
        <!-- Save the ICO file -->
 <!-- Delete the file if it already exists -->
<cfif FileExists("#tempFileName#")>
    <cffile action="delete" file="#tempFileName#">
</cfif>

        <cffile action="write"
        file="#tempFileName#"
        output="#result.fileContent#"
        mode="777" />



        <!-- Convert ICO to PNG using ImageMagick -->
        <cfset pngFileName = tempDir & CreateObject("java", "java.io.File").separator & "favicon_#id#.png">

        <!--- Check if PNG file already exists --->
<cfif FileExists("#pngFileName#")>
    <!--- Delete existing PNG file --->
    <cffile action="delete" file="#pngFileName#">
</cfif>

        <cfexecute name="C:\Program Files\ImageMagick-7.1.1-Q16-HDRI\magick.exe" 
                   arguments="convert #tempFileName# #pngFileName#"
                   timeout="60">
        </cfexecute>

        

        <!-- New image name and directory -->
        <cfset new_siteicon = "custom_#id#.png" />

        <Cfif #dsn# is "abo">
        <cfset image_dir = "C:\home\theactorsoffice.com\wwwroot\app-subdomain_1.5\app\assets\images\retina-circular-icons\32" />
        <cfelse>
        <cfset image_dir = "C:\home\theactorsoffice.com\wwwroot\dev-subdomain\app\assets\images\retina-circular-icons\32" />
        </cfif>

 <Cfoutput>new_siteicon: #new_siteicon#<BR></cfoutput>
 <Cfoutput>image_dir: #image_dir#<BR></cfoutput>

        <!-- Read PNG and Save -->

        <Cftry>
        
       <cfset readSuccess = false />

<!-- Check if pngFileName exists -->
<cfif FileExists("#pngFileName#")>
    <cfimage action="read" source="#pngFileName#" name="imageObj">
    <cfset readSuccess = true />
   <cfoutput> file exists! #pngFileName#</cfoutput><BR>
</cfif>

<!-- If primary pngFileName doesn't exist, try the one with '-0' suffix -->
<cfif NOT readSuccess>
    <cfset alternativeFileName = Replace(pngFileName, ".png", "-0.png")>
    
    <cfif FileExists("#alternativeFileName#")>
        <cfimage action="read" source="#alternativeFileName#" name="imageObj">

           <cfoutput> alt exists! #alternativeFileName#</cfoutput><BR>
    </cfif>
</cfif>




        <cfimage action="write" destination="#image_dir#\custom_#id#.png" source="#imageObj#" format="png"></cfimage>
<h2><cfoutput>#rootUrl#/favicon.ico</cfoutput> found!</h2>

        <cfquery datasource="#dsn#" name="update">
            update sitelinks_user 
            set siteicon = '#new_siteicon#'
            where id = #id#
        </cfquery>



<cfcatch type="any">

<cfoutput>not found: #pngfilename#<BR>          update sitelinks_user 
            set siteicon = 'Not Found'  
            where id = #x.id#<BR></cfoutput>  

        <cfquery datasource="#dsn#" name="update">
            update sitelinks_user 
            set siteicon = 'Not Found'
            where id = #x.id#
        </cfquery>

        <h2><cfoutput>#rootUrl#/favicon.ico</cfoutput> not found!</h2>
</cfcatch>
</cftry>

        <!-- Update Record -->


    <cfelse>
        <!-- Update record to show icon was not found -->
        <cfquery datasource="#dsn#" name="update">
            update sitelinks_user 
            set siteicon = 'Not Found'
            where id = #id#
        </cfquery>

        <h2><cfoutput>#rootUrl#/favicon.ico</cfoutput>not found!</h2>
    </cfif>
    <cfelse>
            <cfquery datasource="#dsn#" name="update">
            update sitelinks_user 
            set siteicon = 'Not Found'
            where id = #id#
        </cfquery>
    </cfif>
</cfloop>



  
 
  
  

  
  
       <cfquery datasource="#dsn#" name="x">
  SELECT id,userid,sitename,siteurl,siteicon FROM sitelinks_user WHERE siteicon LIKE 'custom%'
  </cfquery>

  <cfloop query="x">
     <cfquery datasource="#dsn#" name="update">
            update sitelinks_user 
            set siteicon = '#x.siteicon#'
            where userid = #x.userid#
            and siteurl = '#x.siteurl#'
        </cfquery>

  </cfloop>
  
  
  
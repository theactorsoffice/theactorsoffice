 

<cfquery datasource="abod" name="x">
SELECT id,sitename,siteurl,siteicon FROM sitelinks_user WHERE iscustom = 1 AND siteicon = 'unknown.png'
</cfquery>

<cfloop query="x">
    <cfset id = x.id />
    <cfset siteurl = x.siteurl />
    
    <!-- Add 'http' if missing -->
    <cfif NOT findNoCase("http", siteurl)>
        <cfset siteurl = "http://" & siteurl />
    </cfif>
  <Cfabort>
    <cftry>
        <cfhttp url="#siteurl#/favicon.ico" method="get" getAsBinary="yes" result="result"></cfhttp>
        
        <!-- Check if cfhttp was successful and the content type indicates an image -->
        <cfif result.statusCode EQ "200 OK" AND findNoCase("image/", result.responseHeader["Content-Type"])>
            <cffile action="write"
                    file="#GetTempDirectory()#/favicon.ico"
                    output="#result.fileContent#"
                    mode="777">
            </cffile>
            
            <!-- New image name and directory -->
            <cfset new_siteicon = "custom_#id#.png" />
            <cfset image_dir = "/app/assets/images/retina-circular-icons/14" />
            
            <!-- Convert to PNG and Save -->
            <cfimage action="read" source="#GetTempDirectory()#/favicon.ico" name="imageObj">
            <cfimage action="write" destination="#image_dir#/custom_#id#.png" source="#imageObj#" format="png"></cfimage>
            
            <!-- Update Record -->
            <cfquery datasource="abod" name="update">
            update sitelinks_user 
            set siteicon = '#new_siteicon#'
            where id = #id#
            </cfquery>
        </cfif>
        
        <cfcatch type="any">
            <!-- Log or do something -->
            <cflog file="fetch_favicon_error" text="Error fetching favicon for ID #id# - #cfcatch.message#">
        </cfcatch>
    </cftry>
</cfloop>

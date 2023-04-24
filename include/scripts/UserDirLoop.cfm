    <cfset currentURL = cgi.server_name />
    <cfset host = ListFirst(currentURL, ".") />
<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="x"      >
SELECT userid
,userFirstName
,userLastName
,userEmail
,userPassword
,userRole
,recordname
contactid

FROM taoUsers
</cfquery>
<cfoutput>
        <cfset uploads_root = "d:\home\theactorsoffice.com\wwwroot\#host#-subdomain\media-#host#\uploads" />
</cfoutput>



<cfloop query="x">

    <Cfoutput>

        <CFSET uploads_root_user = "#uploads_root#\#x.userid#" />
 
        <CFSET Temp_File_Root_Browser = "/media-#host#/uploads/user/#x.userid#" />
    
        <h3>uploads_root_user: #uploads_root_user#</h3>
        <h3>Temp_File_Root_Browser: #Temp_File_Root_Browser#</h3>
        

        
        <h1>#directoryExists(uploads_root_user)#</h1>
        
    </Cfoutput>
    <cfif #directoryExists(uploads_root_user)# is "True">
    already created<BR>
    <cfelse>
        <cfdirectory action="create" directory="#uploads_root_user#">
        
    </cfif>

    
</cfloop>

   
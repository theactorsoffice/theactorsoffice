      <CFINCLUDE template="/include/remote_load.cfm" />  

<cfquery datasource="#dsn#" name="x"       >   
SELECT * FROM pgpages WHERE compid > 109
</cfquery>

<cfloop query="x">
<cfoutput>
<cfset page_dir =   "C:\home\theactorsoffice.com\wwwroot\dev-subdomain\app\#x.pgdir#" />
    </cfoutput>
    
    
 <cfif #directoryExists(page_dir)# is "True">
    already created<BR>
    <cfelse>
        <cfdirectory action="create" directory="#page_dir#">
        
    </cfif>


</cfloop>
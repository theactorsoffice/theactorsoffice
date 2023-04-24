      <CFINCLUDE template="/include/remote_load.cfm" />  

<cfquery datasource="#dsn#" name="x"       >   
SELECT * FROM pgpages WHERE compid > 109
</cfquery>

<cfloop query="x">
<cfoutput>
<cfset page_dir =   "C:\home\theactorsoffice.com\wwwroot\dev-subdomain\app\#x.pgdir#" />
    </cfoutput>
    
    
            <cffile action="copy" source="C:\home\theactorsoffice.com\wwwroot\dev-subdomain\app\action\index.cfm" destination="#page_dir#\" />
    
    
    
     


</cfloop>
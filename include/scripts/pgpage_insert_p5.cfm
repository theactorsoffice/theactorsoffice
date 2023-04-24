      <CFINCLUDE template="/include/remote_load.cfm" />  


<cfquery datasource="#dsn#" name="z"       > 
SELECT compid, CONCAT(compdir,'-results') AS new_compdir FROM pgcomps WHERE compid > 109
</cfquery>

<cfloop query="z">
<cfquery datasource="#dsn#" name="update"       > 
    UPDATE pgcomps set compdir = '#z.new_compdir#' where compid = #z.compid#
    </cfquery>
    
</cfloop>

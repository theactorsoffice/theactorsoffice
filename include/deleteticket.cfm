   <CFINCLUDE template="/include/remote_load.cfm" />
<cfquery datasource="#dsn#" name="deleteticket"   >
    UPDATE tickets_tbl
       set ticketstatus = 'Closed' 
    ,isdeleted = 1
    where ticketid = #recid#
</cfquery>


<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" />

<cfinclude template="/include/bigbrotherinclude.cfm" /> 



<cfif #isdefined('oldverid')#>
<cflocation url="/app/version/?recid=#oldverid#" >
<cfelse>
<cflocation url="/app/admin-support/" >
</cfif>



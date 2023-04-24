<CFINCLUDE template="/include/remote_load.cfm" />
 
<cfquery name="audlocations_sel" datasource="#dsn#">
SELECT l.audlocid AS ID, l.audlocname AS Name FROM audlocations l WHERE l.userid = #userid# ORDER BY l.audlocname
</cfquery>

 
<CFINCLUDE template="/include/remote_load.cfm" />
 
<cfquery name="audlocations_sel" datasource="#dsn#">
SELECT l.audlocid AS ID, l.eventLocation AS Name FROM audlocations l WHERE l.userid = #userid# ORDER BY l.eventLocation
</cfquery>

 
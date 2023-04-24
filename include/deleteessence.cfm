<CFINCLUDE template="/include/remote_load.cfm" />

<cfquery name="delete"  datasource="#dsn#"  >
UPDATE essences SET isdeleted = 1 WHERE essenceid = #new_essenceid#
</cfquery>
 

    <cflocation url="/app/myaccount/?t3=1&tab3_expand=true" /> 

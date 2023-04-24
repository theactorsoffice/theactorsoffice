<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="update"  >
update tickets
 set ticketstatus = <cfqueryparam value="Pass" cfsqltype="cf_sql_varchar" />

    where ticketid = #recid#
    </cfquery>
    <cflocation url="/app/admin-support/" >
        
        



<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="uu"  >
select * from taousers where userid = #userid#
</cfquery>


<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="update"  >
update tickets
 set ticketstatus = <cfqueryparam value="Closed" cfsqltype="cf_sql_varchar" />
,ticketcompleteddate = CURDATE()
    ,ticketresponse = 'Closed by #uu.userfirstname# #uu.userlastname#'
    where ticketid = #recid#
    </cfquery>
    <cflocation url="/app/admin-support/" >
        
        



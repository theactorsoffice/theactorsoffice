<CFINCLUDE template="/include/remote_load.cfm" />

<cfquery name="results"  datasource="#dsn#" >	
SELECT
t.tlogid
,t.tlogid as recid
,t.ticketid
,u.recordname AS col1
,'User' AS head1
,'Date' AS head2
,'Time' AS head3
,'Details' AS head4
,'Status' AS head5
,t.tlogtimestamp as col2
,t.tlogtimestamp as col3
,t.tlogDetails as col4
,t.ticketstatus as col5
    
from ticketslog t
INNER JOIN taousers_tbl u ON u.userid = t.userid
where t.ticketid = #recid#
    
ORDER BY t.tlogtimestamp desc

    
</cfquery>		



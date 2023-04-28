<CFINCLUDE template="/include/remote_load.cfm" />

<cfquery name="updates"   datasource="#dsn#"  >
SELECT d.contactid,
'Name' as 'head1',
'Last Update' as 'head2',

d.contactfullname AS col1
,max(u.updatetimestamp) as col2

FROM contactdetails d
    
    inner join updatelog u on u.recid = d.contactid

WHERE d.contactStatus = 'Active' and d.userid = 1
	and u.userid = d.userid
    and u.compid = 1
    
    GROUP BY d.contactfullname
</cfquery>
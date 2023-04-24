<CFINCLUDE template="/include/remote_load.cfm" />

<cfquery name="updates"   datasource="#dsn#"  >
SELECT d.contactid,
'Name' as 'head1',
'Last Update' as 'head2',

CONCAT_WS(' ',
      
        IF(LENGTH(d.contactfirst),d.contactfirst,NULL),
        IF(LENGTH(d.contactMiddle),d.contactMiddle,NULL),
        IF(LENGTH(d.contactLast),d.contactLast,NULL),
        IF(LENGTH(d.contactSuffix),d.contactSuffix,NULL)
) AS col1
,max(u.updatetimestamp) as col2

FROM contactdetails d
    
    inner join updatelog u on u.recid = d.contactid

WHERE d.contactStatus = 'Active' and d.userid = 1
	and u.userid = d.userid
    and u.compid = 1
    
    GROUP BY CONCAT_WS(' ',
     
        IF(LENGTH(d.contactfirst),d.contactfirst,NULL),
        IF(LENGTH(d.contactMiddle),d.contactMiddle,NULL),
        IF(LENGTH(d.contactLast),d.contactLast,NULL),
        IF(LENGTH(d.contactSuffix),d.contactSuffix,NULL))
</cfquery>
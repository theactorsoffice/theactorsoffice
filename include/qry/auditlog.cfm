<cfset sel_search = "">
<CFINCLUDE template="/include/remote_load.cfm" />
<cfquery name="results"   datasource="#dsn#"   >
SELECT 
b.id
,b.id as recid
,u.recordname AS col1
,'User' AS head1
,'Date' AS head2
,'Time' AS head3
,'Page' AS head4
,'URL' AS head5
,'Contact' AS head6
,'IP Address' AS head7

,b.timestamp AS col2

    
,DATE_SUB(b.timestamp, INTERVAL 2 HOUR) as col3
    
,p.pgname AS col4
,CONCAT(b.script_name,"?",b.query_string) AS col5
,c.recordname AS col6


,b.remote_host AS col7
 FROM bigbrother b
 INNER JOIN taousers u ON u.userid = b.userid
 left JOIN pgpages p ON p.pgid = b.pgid
 LEFT JOIN contactdetails c ON c.contactid = b.contactid
WHERE u.userid <> 30
 ORDER BY id desc limit 0
</cfquery> 
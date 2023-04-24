<cfquery name="toasts"   datasource="#dsn#"    maxrows="5">
SELECT n.ID,n.notiftitle,n.notiftimestamp, c.recordname, n.subtitle,n.notifurl
    FROM notifications n
    INNER JOIN  contactdetails c on c.contactid = n.contactid
    where n.userid = <cfqueryparam cfsqltype="cf_sql_integer" value="#session.userid#" > 
    and n.read =  0
    and n.trash = 0
</cfquery>

<cfquery name="toastmenu"     datasource="#dsn#"  >
SELECT n.ID,n.notiftitle,n.notiftimestamp, c.recordname, n.subtitle,n.notifurl,n.contactid,n.read,n.trash
    FROM notifications n
    LEFT JOIN  contactdetails c on c.contactid = n.contactid
    where n.userid = <cfqueryparam cfsqltype="cf_sql_integer" value="#session.userid#" > 
    and n.trash = 0
    Order by n.notiftimestamp desc
</cfquery>

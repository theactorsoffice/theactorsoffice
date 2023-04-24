<cfquery datasource="#dsn#" name="notsdetails">
SELECT 
su.contactid
,su.userid
,n.notid
,s.systemid
,s.systemscope AS newsystemscope
,n.actionid
,su.suID AS newsuid
,au.actionDaysRecurring
,a.uniquename
,a.IsUnique
,u.recordname as new_contactname    
    
FROM funotifications n

INNER JOIN fusystemusers su ON su.suid = n.suid

INNER JOIN contactdetails c ON c.contactID = su.contactid 

INNER JOIN fusystems s ON s.systemID = su.systemID
    
INNER JOIN actionusers au ON au.actionid = n.actionid
    
INNER JOIN fuactions a ON a.actionid = au.actionid
    
INNER JOIN taousers u on u.userid = n.userid

WHERE n.notID = #notid#
and au.userid = n.userid
</cfquery>

 
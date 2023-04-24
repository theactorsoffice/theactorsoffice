<cfquery datasource="#dsn#" name="ru"    >       
SELECT 
fc.suID
,fc.contactid
,fc.userid
,fc.suStartDate
,fc.suenddate
,fc.suStatus
,s.systemName
,s.systemdescript
,s.systemtype
,s.systemscope
,s.systemid
,s.recordname
 
FROM fusystemusers fc 
INNER JOIN fusystems s ON s.systemID = fc.systemID
WHERE fc.contactID = #currentid#
AND fc.userID = #session.userid#
AND fc.sustatus = 'Active'
</cfquery>   
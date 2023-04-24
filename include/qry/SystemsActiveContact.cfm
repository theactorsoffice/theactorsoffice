<CFINCLUDE template="/include/remote_load.cfm" />

<cfquery name="FindUser" datasource="#dsn#"   >
SELECT
u.userid
,u.userFirstName
,u.userLastName
,u.userEmail
,u.userRole
FROM taousers u
WHERE u.userEmail = '#GetAuthUser()#'
</cfquery>


<cfquery  name="findscope" maxrows = "1" datasource="#dsn#"   >  
SELECT * 

FROM contactitems 

WHERE valuecategory = 'Tag'  AND contactid = #contactid# AND itemstatus = 'Active' and valuetext in (
SELECT tagname AS valuetext from tags_user WHERE userid = #session.userid# and tagtype = 'C')
</cfquery>

<cfif #findscope.recordcount# is "1">

<cfset new_systemscope = "Casting Director" />
    
<cfelse>
   <cfset new_systemscope = "Industry" /> 
    
</cfif>       
    
    
    
    

<cfquery name="sysAvail"   datasource="#dsn#"   >
SELECT * FROM fusystems WHERE systemscope = '#new_systemscope#' and systemid NOT IN (SELECT systemid FROM fusystemusers WHERE contactID = #currentid#
AND userID = #session.userid# and suStatus = 'Active')
ORDER BY FIELD(systemtype, "Targeted List", "Follow Up", "Maintenance List")
</cfquery>
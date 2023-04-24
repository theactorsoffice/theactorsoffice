<CFINCLUDE template="/include/remote_load.cfm" />

<cfparam name="suID" default="7" />

<cfif #isdefined('session.mocktoday')# >
<Cfset currentStartDate = "#DateFormat(session.mocktoday,'yyyy-mm-dd')#"/>
    
    <cfelse>
<Cfset currentStartDate = "#DateFormat(Now(),'yyyy-mm-dd')#"/>
</cfif>
    
    
<cfquery name="FindUser"  datasource="#dsn#" >
SELECT

u.userid
,u.userFirstName
,u.userLastName
,u.userEmail
,u.userRole
FROM taousers u
WHERE u.userEmail = '#GetAuthUser()#'
</cfquery>


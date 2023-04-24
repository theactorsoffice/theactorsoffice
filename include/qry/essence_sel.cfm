<cfparam name="dbug" default="N" />
<CFINCLUDE template="/include/remote_load.cfm" />
<cfquery name="essence_sel" datasource="#dsn#">
SELECT 
	e.essenceid AS ID,
	e.essencename AS NAME,
	e.userid

FROM essences e
 
WHERE e.userID = #userid# AND isdeleted IS false
</cfquery>
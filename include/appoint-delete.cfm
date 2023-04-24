<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="delete"     >
UPDATE events_tbl
set isdeleted = 1

WHERE eventid = <cfqueryparam cfsqltype="cf_sql_integer" value="#eventid#" />
</cfquery> 



<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" /><cfinclude template="/include/bigbrotherinclude.cfm" /> 

<cflocation url="/app/calendar-appoint/" >

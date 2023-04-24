<CFINCLUDE template="/include/remote_load.cfm" />

<cfquery name="Systems"  datasource="#dsn#"    >
SELECT
 s.systemID
,s.systemName
,s.SystemType
,s.SystemScope
,s.SystemDescript
,s.SystemTriggerNote

FROM fusystems s

ORDER BY s.systemName
</cfquery>
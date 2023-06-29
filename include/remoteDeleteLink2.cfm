<CFINCLUDE template="/include/remote_load.cfm" />

<cfquery name="audmedia_details"  datasource="#dsn#"  >
update audlinks set isdeleted = 1 where linkid = #linkid#
</cfquery>
 

<cflocation url="/app/audition/?eventid=#eventid#&audprojectid=#audprojectid#&secid=#secid#" />

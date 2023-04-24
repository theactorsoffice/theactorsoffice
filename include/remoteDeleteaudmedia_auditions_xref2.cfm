<CFINCLUDE template="/include/remote_load.cfm" />

<cfquery name="audmedia_details"  datasource="#dsn#"  >
#dqry#
</cfquery>
 

<cflocation url="/app/audition/?audprojectid=#audprojectid#&secid=#secid#" />

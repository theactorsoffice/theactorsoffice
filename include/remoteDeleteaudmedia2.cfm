<CFINCLUDE template="/include/remote_load.cfm" />

<cfquery name="audmedia_details"  datasource="#dsn#"  >
#dqry#
</cfquery>
 
<cfif #secid# is "196">
<cflocation url="/app/myaccount/?t8=1&tab8_expand=true" /> 
<cfelse>
<cflocation url="/app/myaccount/?t8=1&tab8_expand=true" /> 

</cfif>
    

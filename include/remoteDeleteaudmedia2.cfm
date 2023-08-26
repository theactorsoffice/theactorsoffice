<CFINCLUDE template="/include/remote_load.cfm" />

<cfquery name="audmedia_details"  datasource="#dsn#"  >
#dqry#
</cfquery>
 
<cfif #secid# is "196">
<cflocation url="/app/myaccount/?t9=1&tab9_expand=true" /> 
<cfelse>
<cflocation url="/app/myaccount/?t91&tab9_expand=true" /> 

</cfif>
    

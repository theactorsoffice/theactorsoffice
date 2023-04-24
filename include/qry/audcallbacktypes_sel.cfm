<cfset dbug="n" />

<CFINCLUDE template="/include/remote_load.cfm" />
    
<cfquery name="audcallbacktypes_sel"   datasource="#dsn#" >
SELECT callbacktypeid AS id, callbacktype AS name 
FROM audcallbacktypes 
WHERE audstepid = 2 AND audcatid = #audcatid# and callbacktype <> 'Callback' ORDER BY callbacktype
</cfquery>


<cfquery name="audcallbacktypes_sel_def"   datasource="#dsn#" >
SELECT callbacktypeid AS id, callbacktype AS name 
FROM audcallbacktypes 
WHERE audstepid = 2 AND audcatid = #audcatid# and callbacktype = 'Callback' ORDER BY callbacktype
</cfquery>
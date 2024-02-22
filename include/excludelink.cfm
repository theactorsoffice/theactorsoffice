 <cfparam name="dd" default="0" />

<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="update"   >
UPDATE sitelinks_user_tbl
SET isdeleted = 1

WHERE id = #new_id#
</cfquery>

       


<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" />
<cfinclude template="/include/bigbrotherinclude.cfm" /> 



<cfif #dd# is "0">
<cflocation url="/app/myaccount/?t1=1&target_id=#target_id#" />    
<cfelse>
<cflocation url="/app/dashboard/?t1=1&target_id=#target_id#" />  
</cfif>
 

<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="update"   >
UPDATE actionusers_tbl
SET isdeleted = 0

WHERE id = #new_id#
</cfquery>

      


<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" /><cfinclude template="/include/bigbrotherinclude.cfm" /> 
<cflocation url="/app/myaccount/?t7=1&target_id_system=#target_id_system#" /> 
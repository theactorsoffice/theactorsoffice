 

<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="update"   > 
UPDATE actionusers_tbl
SET isdeleted = 1

WHERE id = #new_id#
</cfquery>
 

<cflocation url="/app/myaccount/?t7=1&target_id_system=#target_id_system#" />      
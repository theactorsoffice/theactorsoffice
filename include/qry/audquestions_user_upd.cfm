<cfinclude template="/include/remote_load.cfm" />








UPDATE audquestions_user  SET 






WHERE qID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_qID#" /> </cfquery>
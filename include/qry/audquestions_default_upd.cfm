<cfinclude template="/include/remote_load.cfm" />







UPDATE audquestions_default  SET 





WHERE qID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_qID#" /> </cfquery>
<cfinclude template="/include/remote_load.cfm" />












UPDATE audmedia  SET 










WHERE mediaID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_mediaID#" /> </cfquery>
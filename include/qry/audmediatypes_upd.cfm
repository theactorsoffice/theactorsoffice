<cfinclude template="/include/remote_load.cfm" />





UPDATE audmediatypes  SET 



WHERE mediaTypeID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_mediaTypeID#" /> </cfquery>
<cfinclude template="/include/remote_load.cfm" />







UPDATE audunions  SET 





WHERE unionID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_unionID#" /> </cfquery>
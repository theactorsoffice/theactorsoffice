<cfinclude template="/include/remote_load.cfm" />





UPDATE audcategories  SET 



WHERE audCatId = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audCatId#" /> </cfquery>
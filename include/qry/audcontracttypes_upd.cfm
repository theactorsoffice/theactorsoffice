<cfinclude template="/include/remote_load.cfm" />






UPDATE audcontracttypes  SET 




WHERE contracttypeid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_contracttypeid#" /> </cfquery>
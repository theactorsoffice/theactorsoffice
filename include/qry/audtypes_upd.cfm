<cfinclude template="/include/remote_load.cfm" />






UPDATE audtypes  SET 




WHERE audtypeid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audtypeid#" /> </cfquery>
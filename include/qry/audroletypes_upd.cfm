<cfinclude template="/include/remote_load.cfm" />






UPDATE audroletypes  SET 




WHERE audroletypeid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audroletypeid#" /> </cfquery>
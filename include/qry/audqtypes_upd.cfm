<cfinclude template="/include/remote_load.cfm" />





UPDATE audqtypes  SET 



WHERE qtypeid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_qtypeid#" /> </cfquery>
<cfinclude template="/include/remote_load.cfm" />





UPDATE audvocaltypes  SET 



WHERE vocaltypeid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_vocaltypeid#" /> </cfquery>
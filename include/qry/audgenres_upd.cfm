<cfinclude template="/include/remote_load.cfm" />






UPDATE audgenres  SET 




WHERE audgenreid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audgenreid#" /> </cfquery>
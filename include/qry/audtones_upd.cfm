<cfinclude template="/include/remote_load.cfm" />






UPDATE audtones  SET 




WHERE toneid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_toneid#" /> </cfquery>
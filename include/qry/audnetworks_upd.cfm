<cfinclude template="/include/remote_load.cfm" />






UPDATE audnetworks  SET 




WHERE networkid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_networkid#" /> </cfquery>
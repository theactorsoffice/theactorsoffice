<cfinclude template="/include/remote_load.cfm" />






UPDATE auddialects  SET 




WHERE auddialectid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_auddialectid#" /> </cfquery>
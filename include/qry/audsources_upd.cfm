<cfinclude template="/include/remote_load.cfm" />





UPDATE audsources  SET 



WHERE audsourceid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audsourceid#" /> </cfquery>
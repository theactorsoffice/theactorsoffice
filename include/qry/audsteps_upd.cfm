<cfinclude template="/include/remote_load.cfm" />





UPDATE audsteps  SET 



WHERE audstepid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audstepid#" /> </cfquery>
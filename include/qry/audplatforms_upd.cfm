<cfinclude template="/include/remote_load.cfm" />





UPDATE audplatforms  SET 



WHERE audplatformid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audplatformid#" /> </cfquery>
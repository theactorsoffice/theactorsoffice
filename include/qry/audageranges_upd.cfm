<cfinclude template="/include/remote_load.cfm" />








UPDATE audageranges  SET 






WHERE rangeid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_rangeid#" /> </cfquery>
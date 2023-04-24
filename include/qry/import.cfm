<CFINCLUDE template="/include/remote_load.cfm" />

<cfquery name="details"  datasource="#dsn#"  >
SELECT uploadid,`TIMESTAMP`,userid,uploadstatus 
FROM uploads
WHERE uploadid = #uploadid#
 </cfquery>   
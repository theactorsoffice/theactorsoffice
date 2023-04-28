`<CFINCLUDE template="/include/remote_load.cfm" /><cfquery name="contacts"  datasource="#dsn#"   >
SELECT d.contactid,
d.recordname
FROM contactdetails d

WHERE d.contactStatus = 'Active' and d.userid = <Cfqueryparam value="#session.userid#" cfsqltype="CF_SQL_INTEGER" />
    


order by d.contactfullname
</cfquery>
	 <cfquery name="types"   datasource="#dsn#"   >
SELECT eventtypename FROM eventtypes_user 
         where userid = <Cfqueryparam value="#session.userid#" cfsqltype="CF_SQL_INTEGER" />
         <cfif #isAuditionModule# is "1"> and eventtypename <> 'Audition'</cfif>
         ORDER BY eventtypename
</cfquery>
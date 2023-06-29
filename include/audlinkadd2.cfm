<CFINCLUDE template="/include/remote_load.cfm" />

 <cfif #left(linkurl,4)# is not "http">
<cfset linkurl = "https://#linkurl#" />
</cfif>

<cfquery name="add" datasource="#dsn#" result="result" >
INSERT INTO audlinks_tbl (linkname,linkurl,isdeleted,userid,audroleid)
VALUES (<cfqueryparam cfsqltype="cf_sql_varchar" value="#linkname#" />,<cfqueryparam cfsqltype="cf_sql_varchar" value="#linkurl#" /> ,<cfqueryparam cfsqltype="cf_sql_integer" value="0" /> ,<cfqueryparam cfsqltype="cf_sql_integer" value="#session.userid#" /> ,<cfqueryparam cfsqltype="cf_sql_integer" value="#audroleid#" /> )
</cfquery>

 
     <cfoutput>
     <cfset returnurl = "/app/audition/?audprojectid=#audprojectid#&eventid=#eventid#&secid=177" />
     </cfoutput>
	 
	 <cflocation url="#returnurl#" >

 


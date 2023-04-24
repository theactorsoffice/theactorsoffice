<CFINCLUDE template="/include/remote_load.cfm" />

 <cfif #left(linkurl,4)# is not "http">
<cfset linkurl = "https://#linkurl#" />
</cfif>

<cfquery name="add" datasource="#dsn#" result="result" >
INSERT INTO links (linkname,linkurl,isdeleted,userid,noteid)
VALUES (<cfqueryparam cfsqltype="cf_sql_varchar" value="#linkname#" />,<cfqueryparam cfsqltype="cf_sql_varchar" value="#linkurl#" /> ,<cfqueryparam cfsqltype="cf_sql_integer" value="0" /> ,<cfqueryparam cfsqltype="cf_sql_integer" value="#session.userid#" /> ,<cfqueryparam cfsqltype="cf_sql_integer" value="#noteid#" /> )
</cfquery>
<cfset linkid = result.generatedkey />
 

<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" /><cfinclude template="/include/bigbrotherinclude.cfm" /> 



<cfif #isdefined('audprojectid')#>
     <cfoutput>
     <cfset returnurl = "/app/#returnurl#/?contactid=#rcontactid#&audprojectid=#audprojectid#&tab2_expand=true&secid=178&t3=1" />
     </cfoutput>
<cfelse>
         
     <cfoutput>
     <cfset returnurl = "/app/#returnurl#/?contactid=#rcontactid#&eventid=#reventid#&tab2_expand=true&secid=178&t3=1" />
     </cfoutput>
 
  </cfif>
	 
	 <cflocation url="#returnurl#" >

 


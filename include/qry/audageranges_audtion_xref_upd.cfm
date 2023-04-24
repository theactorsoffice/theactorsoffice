<cfinclude template="/include/remote_load.cfm" />

<cfparam name="new_audRoleID" default="" />
<cfparam name="new_rangeid" default="" />

<cfquery name="audageranges_audtion_xref_ins" datasource="#dsn#" result="result" >  
UPDATE audageranges_audtion_xref  SET 
audRoleID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audRoleID#"  null="#NOT len(trim(new_audRoleID))#" /> ,
rangeid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_rangeid#"  null="#NOT len(trim(new_rangeid))#" /> 

WHERE  = <cfqueryparam cfsqltype="" value="#new_#" /> </cfquery>

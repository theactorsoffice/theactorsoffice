<cfinclude template="/include/remote_load.cfm" />

<cfparam name="new_audRoleID" default="" />
<cfparam name="new_audgenreID" default="" />

<cfquery name="audgenres_audition_xref_ins" datasource="#dsn#" result="result" >  
UPDATE audgenres_audition_xref  SET 
audRoleID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audRoleID#"  null="#NOT len(trim(new_audRoleID))#" /> ,
audgenreID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audgenreID#"  null="#NOT len(trim(new_audgenreID))#" /> 

WHERE  = <cfqueryparam cfsqltype="" value="#new_#" /> </cfquery>

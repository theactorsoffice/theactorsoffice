<cfinclude template="/include/remote_load.cfm" />

<cfparam name="new_audRoleID" default="" />
<cfparam name="new_rangeid" default="" />

<cfquery name="audageranges_audtion_xref_ins" datasource="#dsn#" result="result" >  
INSERT INTO audageranges_audtion_xref  (
audRoleID,
rangeid)

VALUES (
<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audRoleID#"  null="#NOT len(trim(new_audRoleID))#" />,
<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_rangeid#"  null="#NOT len(trim(new_rangeid))#" />
);
</cfquery>

<cfset new_ = result.GENERATEDKEY />

<cfinclude template="/include/remote_load.cfm" />

<cfparam name="new_audgenre" default="" />
<cfparam name="new_audCatid" default="" />
<cfparam name="new_isDeleted" default="0" />

<cfquery name="audgenres_ins" datasource="#dsn#" result="result" >  
INSERT INTO audgenres  (
audgenre,
audCatid,
isDeleted)

VALUES (
<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_audgenre#" maxlength="100" null="#NOT len(trim(new_audgenre))#" />,
<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audCatid#"  null="#NOT len(trim(new_audCatid))#" />,
<cfqueryparam cfsqltype="CF_SQL_BIT" value="#new_isDeleted#"  null="#NOT len(trim(new_isDeleted))#" />
);
</cfquery>

<cfset new_audgenreid = result.GENERATEDKEY />

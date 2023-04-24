<cfinclude template="/include/remote_load.cfm" />

<cfparam name="new_audplatform" default="" />
<cfparam name="new_isDeleted" default="0" />

<cfquery name="audplatforms_ins" datasource="#dsn#" result="result" >  
INSERT INTO audplatforms  (
audplatform,
isDeleted)

VALUES (
<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_audplatform#" maxlength="100" null="#NOT len(trim(new_audplatform))#" />,
<cfqueryparam cfsqltype="CF_SQL_BIT" value="#new_isDeleted#"  null="#NOT len(trim(new_isDeleted))#" />
);
</cfquery>

<cfset new_audplatformid = result.GENERATEDKEY />

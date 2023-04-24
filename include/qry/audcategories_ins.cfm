<cfinclude template="/include/remote_load.cfm" />

<cfparam name="new_audCatName" default="" />
<cfparam name="new_isDeleted" default="0" />

<cfquery name="audcategories_ins" datasource="#dsn#" result="result" >  
INSERT INTO audcategories  (
audCatName,
isDeleted)

VALUES (
<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_audCatName#" maxlength="100" null="#NOT len(trim(new_audCatName))#" />,
<cfqueryparam cfsqltype="CF_SQL_BIT" value="#new_isDeleted#"  null="#NOT len(trim(new_isDeleted))#" />
);
</cfquery>

<cfset new_audCatId = result.GENERATEDKEY />

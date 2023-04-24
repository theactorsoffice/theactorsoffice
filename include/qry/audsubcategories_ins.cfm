<cfinclude template="/include/remote_load.cfm" />

<cfparam name="new_audSubCatName" default="" />
<cfparam name="new_audCatId" default="0" />
<cfparam name="new_isDeleted" default="0" />

<cfquery name="audsubcategories_ins" datasource="#dsn#" result="result" >  
INSERT INTO audsubcategories  (
audSubCatName,
audCatId,
isDeleted)

VALUES (
<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_audSubCatName#" maxlength="100" null="#NOT len(trim(new_audSubCatName))#" />,
<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audCatId#"  null="#NOT len(trim(new_audCatId))#" />,
<cfqueryparam cfsqltype="CF_SQL_BIT" value="#new_isDeleted#"  null="#NOT len(trim(new_isDeleted))#" />
);
</cfquery>

<cfset new_audSubCatId = result.GENERATEDKEY />

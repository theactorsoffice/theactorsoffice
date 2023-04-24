<cfinclude template="/include/remote_load.cfm" />

<cfparam name="new_mediaType" default="" />
<cfparam name="new_isDeleted" default="0" />

<cfquery name="audmediatypes_ins" datasource="#dsn#" result="result" >  
INSERT INTO audmediatypes  (
mediaType,
isDeleted)

VALUES (
<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_mediaType#" maxlength="100" null="#NOT len(trim(new_mediaType))#" />,
<cfqueryparam cfsqltype="CF_SQL_BIT" value="#new_isDeleted#"  null="#NOT len(trim(new_isDeleted))#" />
);
</cfquery>

<cfset new_mediaTypeID = result.GENERATEDKEY />

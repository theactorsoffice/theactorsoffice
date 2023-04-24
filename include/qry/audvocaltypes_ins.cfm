<cfinclude template="/include/remote_load.cfm" />

<cfparam name="new_vocaltype" default="" />
<cfparam name="new_isDeleted" default="0" />

<cfquery name="audvocaltypes_ins" datasource="#dsn#" result="result" >  
INSERT INTO audvocaltypes  (
vocaltype,
isDeleted)

VALUES (
<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_vocaltype#" maxlength="100" null="#NOT len(trim(new_vocaltype))#" />,
<cfqueryparam cfsqltype="CF_SQL_BIT" value="#new_isDeleted#"  null="#NOT len(trim(new_isDeleted))#" />
);
</cfquery>

<cfset new_vocaltypeid = result.GENERATEDKEY />

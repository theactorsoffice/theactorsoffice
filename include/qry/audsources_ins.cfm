<cfinclude template="/include/remote_load.cfm" />

<cfparam name="new_audsource" default="" />
<cfparam name="new_isDeleted" default="0" />

<cfquery name="audsources_ins" datasource="#dsn#" result="result" >  
INSERT INTO audsources  (
audsource,
isDeleted)

VALUES (
<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_audsource#" maxlength="100" null="#NOT len(trim(new_audsource))#" />,
<cfqueryparam cfsqltype="CF_SQL_BIT" value="#new_isDeleted#"  null="#NOT len(trim(new_isDeleted))#" />
);
</cfquery>

<cfset new_audsourceid = result.GENERATEDKEY />

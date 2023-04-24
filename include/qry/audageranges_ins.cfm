<cfinclude template="/include/remote_load.cfm" />

<cfparam name="new_rangename" default="" />
<cfparam name="new_age_min" default="" />
<cfparam name="new_age_max" default="" />
<cfparam name="new_age_group" default="" />
<cfparam name="new_isDeleted" default="0" />

<cfquery name="audageranges_ins" datasource="#dsn#" result="result" >  
INSERT INTO audageranges  (
rangename,
age_min,
age_max,
age_group,
isDeleted)

VALUES (
<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_rangename#" maxlength="100" null="#NOT len(trim(new_rangename))#" />,
<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_age_min#"  null="#NOT len(trim(new_age_min))#" />,
<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_age_max#"  null="#NOT len(trim(new_age_max))#" />,
<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_age_group#" maxlength="45" null="#NOT len(trim(new_age_group))#" />,
<cfqueryparam cfsqltype="CF_SQL_BIT" value="#new_isDeleted#"  null="#NOT len(trim(new_isDeleted))#" />
);
</cfquery>

<cfset new_rangeid = result.GENERATEDKEY />

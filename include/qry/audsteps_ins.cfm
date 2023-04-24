<cfinclude template="/include/remote_load.cfm" />

<cfparam name="new_audstep" default="" />
<cfparam name="new_isDeleted" default="0" />

<cfquery name="audsteps_ins" datasource="#dsn#" result="result" >  
INSERT INTO audsteps  (
audstep,
isDeleted)

VALUES (
<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_audstep#" maxlength="100" null="#NOT len(trim(new_audstep))#" />,
<cfqueryparam cfsqltype="CF_SQL_BIT" value="#new_isDeleted#"  null="#NOT len(trim(new_isDeleted))#" />
);
</cfquery>

<cfset new_audstepid = result.GENERATEDKEY />

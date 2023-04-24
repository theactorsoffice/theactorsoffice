<cfinclude template="/include/remote_load.cfm" />

<cfparam name="new_network" default="" />
<cfparam name="new_audCatid" default="2" />
<cfparam name="new_isDeleted" default="0" />

<cfquery name="audnetworks_ins" datasource="#dsn#" result="result" >  
INSERT INTO audnetworks  (
network,
audCatid,
isDeleted)

VALUES (
<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_network#" maxlength="100" null="#NOT len(trim(new_network))#" />,
<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audCatid#"  null="#NOT len(trim(new_audCatid))#" />,
<cfqueryparam cfsqltype="CF_SQL_BIT" value="#new_isDeleted#"  null="#NOT len(trim(new_isDeleted))#" />
);
</cfquery>

<cfset new_networkid = result.GENERATEDKEY />

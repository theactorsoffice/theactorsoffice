<cfinclude template="/include/remote_load.cfm" />

<cfparam name="new_qTypeID" default="2" />
<cfparam name="new_qtext" default="" />
<cfparam name="new_qorder" default="0" />
<cfparam name="new_isDeleted" default="0" />

<cfquery name="audquestions_default_ins" datasource="#dsn#" result="result" >  
INSERT INTO audquestions_default  (
qTypeID,
qtext,
qorder,
isDeleted)

VALUES (
<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_qTypeID#"  null="#NOT len(trim(new_qTypeID))#" />,
<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_qtext#" maxlength="500" null="#NOT len(trim(new_qtext))#" />,
<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_qorder#"  null="#NOT len(trim(new_qorder))#" />,
<cfqueryparam cfsqltype="CF_SQL_BIT" value="#new_isDeleted#"  null="#NOT len(trim(new_isDeleted))#" />
);
</cfquery>

<cfset new_qID = result.GENERATEDKEY />

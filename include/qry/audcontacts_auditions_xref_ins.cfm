<cfinclude template="/include/remote_load.cfm" />


<cfparam name="neventidtid" default="" />

<cfparam name="new_audprojectid" default="" />


<cfquery name="audcontacts_auditions_xref_ins" datasource="#dsn#" result="result" >
  
INSERT INTO audcontacts_auditions_xref  (

contactid,audprojectid
    )


VALUES (

<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_contactid#"  null="#NOT len(trim(new_contactid))#" />,

<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audprojectid#"  null="#NOT len(trim(new_audprojectid))#" />

);
</cfquery>


<cfset new_ = result.GENERATEDKEY />

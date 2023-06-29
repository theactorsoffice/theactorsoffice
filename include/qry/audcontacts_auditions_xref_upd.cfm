<cfinclude template="/include/remote_load.cfm" />


<cfparam name="neventidtid" default="" />

<cfparam name="new_audprojectid" default="" />


<cfquery name="audcontacts_auditions_xref_ins" datasource="#dsn#" result="result" > 
  
UPDATE audcontacts_auditions_xref  SET 

contactid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_contactid#"  null="#NOT len(trim(new_contactid))#" /> ,

audprojectid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_eventid#"  null="#NOT len(trim(new_audprojectid))#" /> 

WHERE  = audprojectid = <cfqueryparam cfsqltype="" value="0" /> </cfquery>

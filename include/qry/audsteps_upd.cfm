<cfinclude template="/include/remote_load.cfm" />

<cfparam name="new_audstep" default="" />
<cfparam name="new_isDeleted" default="0" />

<cfquery name="audsteps_ins" datasource="#dsn#" result="result" >  
UPDATE audsteps  SET 
audstep = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_audstep#" maxlength="100" null="#NOT len(trim(new_audstep))#" /> ,
isDeleted = <cfqueryparam cfsqltype="CF_SQL_BIT" value="#new_isDeleted#"  null="#NOT len(trim(new_isDeleted))#" /> 

WHERE audstepid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audstepid#" /> </cfquery>

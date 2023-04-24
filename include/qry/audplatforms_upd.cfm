<cfinclude template="/include/remote_load.cfm" />

<cfparam name="new_audplatform" default="" />
<cfparam name="new_isDeleted" default="0" />

<cfquery name="audplatforms_ins" datasource="#dsn#" result="result" >  
UPDATE audplatforms  SET 
audplatform = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_audplatform#" maxlength="100" null="#NOT len(trim(new_audplatform))#" /> ,
isDeleted = <cfqueryparam cfsqltype="CF_SQL_BIT" value="#new_isDeleted#"  null="#NOT len(trim(new_isDeleted))#" /> 

WHERE audplatformid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audplatformid#" /> </cfquery>

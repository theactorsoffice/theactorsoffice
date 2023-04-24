<cfinclude template="/include/remote_load.cfm" />

<cfparam name="new_qTypeID" default="2" />
<cfparam name="new_qtext" default="" />
<cfparam name="new_qorder" default="0" />
<cfparam name="new_isDeleted" default="0" />

<cfquery name="audquestions_default_ins" datasource="#dsn#" result="result" >  
UPDATE audquestions_default  SET 
qTypeID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_qTypeID#"  null="#NOT len(trim(new_qTypeID))#" /> ,
qtext = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_qtext#" maxlength="500" null="#NOT len(trim(new_qtext))#" /> ,
qorder = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_qorder#"  null="#NOT len(trim(new_qorder))#" /> ,
isDeleted = <cfqueryparam cfsqltype="CF_SQL_BIT" value="#new_isDeleted#"  null="#NOT len(trim(new_isDeleted))#" /> 

WHERE qID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_qID#" /> </cfquery>

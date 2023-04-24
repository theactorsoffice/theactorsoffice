<cfinclude template="/include/remote_load.cfm" />

<cfparam name="new_audRoleName" default="" />

<cfparam name="new_audprojectID" default="" />

<cfparam name="new_audRoleTypeID" default="" />

<cfparam name="new_charDescription" default="" />

<cfparam name="new_holdStartDate" default="" />

<cfparam name="new_holdEndDate" default="" />

<cfparam name="new_audDialectID" default="" />

<cfparam name="new_audSourceID" default="" />

<cfparam name="new_userid" default="" />

<cfparam name="new_isDeleted" default="0" />


<cfquery name="audroles_ins" datasource="#dsn#" result="result" >
  
UPDATE audroles  SET 

audRoleName = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_audRoleName#" maxlength="500" null="#NOT len(trim(new_audRoleName))#" /> ,

audprojectID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audprojectID#"  null="#NOT len(trim(new_audprojectID))#" /> ,

audRoleTypeID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audRoleTypeID#"  null="#NOT len(trim(new_audRoleTypeID))#" /> ,

charDescription = <cfqueryparam cfsqltype="CF_SQL_LONGVARCHAR" value="#new_charDescription#"  null="#NOT len(trim(new_charDescription))#" /> ,

holdStartDate = <cfqueryparam cfsqltype="CF_SQL_DATE" value="#new_holdStartDate#"  null="#NOT len(trim(new_holdStartDate))#" /> ,

holdEndDate = <cfqueryparam cfsqltype="CF_SQL_DATE" value="#new_holdEndDate#"  null="#NOT len(trim(new_holdEndDate))#" /> ,

audDialectID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audDialectID#"  null="#NOT len(trim(new_audDialectID))#" /> ,

audSourceID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audSourceID#"  null="#NOT len(trim(new_audSourceID))#" /> ,

userid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_userid#"  null="#NOT len(trim(new_userid))#" /> ,

isDeleted = <cfqueryparam cfsqltype="CF_SQL_BIT" value="#new_isDeleted#"  null="#NOT len(trim(new_isDeleted))#" /> 

WHERE audRoleID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audRoleID#" /> </cfquery>

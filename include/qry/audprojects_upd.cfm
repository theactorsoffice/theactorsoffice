<cfinclude template="/include/remote_load.cfm" />


<cfparam name="new_projName" default="" />

<cfparam name="new_projDescription" default="" />

<cfparam name="new_userid" default="" />

<cfparam name="new_audSubCatID" default="" />

<cfparam name="new_unionID" default="" />

<cfparam name="new_networkID" default="" />

<cfparam name="new_toneID" default="" />

<cfparam name="new_contractTypeID" default="" />

<cfparam name="new_contactid" default="" />


<cfquery name="audprojects_ins" datasource="#dsn#" result="result" >
  
UPDATE audprojects  SET 

projName = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_projName#" maxlength="500" null="#NOT len(trim(new_projName))#" /> ,

projDescription = <cfqueryparam cfsqltype="CF_SQL_LONGVARCHAR" value="#new_projDescription#"  null="#NOT len(trim(new_projDescription))#" /> ,

unionID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_unionID#"  null="#NOT len(trim(new_unionID))#" /> ,

networkID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_networkID#"  null="#NOT len(trim(new_networkID))#" /> ,

toneID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_toneID#"  null="#NOT len(trim(new_toneID))#" /> ,

contractTypeID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_contractTypeID#"  null="#NOT len(trim(new_contractTypeID))#" /> ,

contactid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_contactid#"  null="#NOT len(trim(new_contactid))#" /> 

WHERE audprojectID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audprojectID#" /> </cfquery>

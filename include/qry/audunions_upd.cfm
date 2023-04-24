<cfinclude template="/include/remote_load.cfm" />

<cfparam name="new_unionName" default="" />
<cfparam name="new_countryid" default="" />
<cfparam name="new_audCatID" default="" />
<cfparam name="new_isDeleted" default="0" />

<cfquery name="audunions_ins" datasource="#dsn#" result="result" >  
UPDATE audunions  SET 
unionName = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_unionName#" maxlength="100" null="#NOT len(trim(new_unionName))#" /> ,
countryid = <cfqueryparam cfsqltype="CF_SQL_CHAR" value="#new_countryid#"  null="#NOT len(trim(new_countryid))#" /> ,
audCatID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audCatID#"  null="#NOT len(trim(new_audCatID))#" /> ,
isDeleted = <cfqueryparam cfsqltype="CF_SQL_BIT" value="#new_isDeleted#"  null="#NOT len(trim(new_isDeleted))#" /> 

WHERE unionID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_unionID#" /> </cfquery>

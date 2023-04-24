<cfinclude template="/include/remote_load.cfm" />

<cfparam name="new_audCatName" default="" />
<cfparam name="new_isDeleted" default="0" />

<cfquery name="audcategories_ins" datasource="#dsn#" result="result" >  
UPDATE audcategories  SET 
audCatName = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_audCatName#" maxlength="100" null="#NOT len(trim(new_audCatName))#" /> ,
isDeleted = <cfqueryparam cfsqltype="CF_SQL_BIT" value="#new_isDeleted#"  null="#NOT len(trim(new_isDeleted))#" /> 

WHERE audCatId = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audCatId#" /> </cfquery>

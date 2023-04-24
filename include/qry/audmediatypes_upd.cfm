<cfinclude template="/include/remote_load.cfm" />

<cfparam name="new_mediaType" default="" />
<cfparam name="new_isDeleted" default="0" />

<cfquery name="audmediatypes_ins" datasource="#dsn#" result="result" >  
UPDATE audmediatypes  SET 
mediaType = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_mediaType#" maxlength="100" null="#NOT len(trim(new_mediaType))#" /> ,
isDeleted = <cfqueryparam cfsqltype="CF_SQL_BIT" value="#new_isDeleted#"  null="#NOT len(trim(new_isDeleted))#" /> 

WHERE mediaTypeID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_mediaTypeID#" /> </cfquery>

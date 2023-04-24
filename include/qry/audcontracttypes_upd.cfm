<cfinclude template="/include/remote_load.cfm" />

<cfparam name="new_contracttype" default="" />
<cfparam name="new_audCatid" default="2" />
<cfparam name="new_isDeleted" default="0" />

<cfquery name="audcontracttypes_ins" datasource="#dsn#" result="result" >  
UPDATE audcontracttypes  SET 
contracttype = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_contracttype#" maxlength="100" null="#NOT len(trim(new_contracttype))#" /> ,
audCatid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audCatid#"  null="#NOT len(trim(new_audCatid))#" /> ,
isDeleted = <cfqueryparam cfsqltype="CF_SQL_BIT" value="#new_isDeleted#"  null="#NOT len(trim(new_isDeleted))#" /> 

WHERE contracttypeid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_contracttypeid#" /> </cfquery>

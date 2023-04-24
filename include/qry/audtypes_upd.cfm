<cfinclude template="/include/remote_load.cfm" />

<cfparam name="new_audtype" default="" />
<cfparam name="new_audCatid" default="2" />
<cfparam name="new_isDeleted" default="0" />

<cfquery name="audtypes_ins" datasource="#dsn#" result="result" >  
UPDATE audtypes  SET 
audtype = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_audtype#" maxlength="100" null="#NOT len(trim(new_audtype))#" /> ,
audCatid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audCatid#"  null="#NOT len(trim(new_audCatid))#" /> ,
isDeleted = <cfqueryparam cfsqltype="CF_SQL_BIT" value="#new_isDeleted#"  null="#NOT len(trim(new_isDeleted))#" /> 

WHERE audtypeid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audtypeid#" /> </cfquery>

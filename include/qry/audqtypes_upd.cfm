<cfinclude template="/include/remote_load.cfm" />

<cfparam name="new_qtype" default="" />
<cfparam name="new_isDeleted" default="0" />

<cfquery name="audqtypes_ins" datasource="#dsn#" result="result" >  
UPDATE audqtypes  SET 
qtype = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_qtype#" maxlength="100" null="#NOT len(trim(new_qtype))#" /> ,
isDeleted = <cfqueryparam cfsqltype="CF_SQL_BIT" value="#new_isDeleted#"  null="#NOT len(trim(new_isDeleted))#" /> 

WHERE qtypeid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_qtypeid#" /> </cfquery>

<cfinclude template="/include/remote_load.cfm" />

<cfparam name="new_vocaltype" default="" />
<cfparam name="new_isDeleted" default="0" />

<cfquery name="audvocaltypes_ins" datasource="#dsn#" result="result" >  
UPDATE audvocaltypes  SET 
vocaltype = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_vocaltype#" maxlength="100" null="#NOT len(trim(new_vocaltype))#" /> ,
isDeleted = <cfqueryparam cfsqltype="CF_SQL_BIT" value="#new_isDeleted#"  null="#NOT len(trim(new_isDeleted))#" /> 

WHERE vocaltypeid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_vocaltypeid#" /> </cfquery>

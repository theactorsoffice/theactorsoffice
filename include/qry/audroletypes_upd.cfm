<cfinclude template="/include/remote_load.cfm" />

<cfparam name="new_audroletype" default="" />
<cfparam name="new_audCatid" default="2" />
<cfparam name="new_isDeleted" default="0" />

<cfquery name="audroletypes_ins" datasource="#dsn#" result="result" >  
UPDATE audroletypes  SET 
audroletype = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_audroletype#" maxlength="100" null="#NOT len(trim(new_audroletype))#" /> ,
audCatid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audCatid#"  null="#NOT len(trim(new_audCatid))#" /> ,
isDeleted = <cfqueryparam cfsqltype="CF_SQL_BIT" value="#new_isDeleted#"  null="#NOT len(trim(new_isDeleted))#" /> 

WHERE audroletypeid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audroletypeid#" /> </cfquery>

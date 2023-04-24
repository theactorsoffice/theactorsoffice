<cfinclude template="/include/remote_load.cfm" />

<cfparam name="new_rangename" default="" />
<cfparam name="new_age_min" default="" />
<cfparam name="new_age_max" default="" />
<cfparam name="new_age_group" default="" />
<cfparam name="new_isDeleted" default="0" />

<cfquery name="audageranges_ins" datasource="#dsn#" result="result" >  
UPDATE audageranges  SET 
rangename = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_rangename#" maxlength="100" null="#NOT len(trim(new_rangename))#" /> ,
age_min = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_age_min#"  null="#NOT len(trim(new_age_min))#" /> ,
age_max = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_age_max#"  null="#NOT len(trim(new_age_max))#" /> ,
age_group = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_age_group#" maxlength="45" null="#NOT len(trim(new_age_group))#" /> ,
isDeleted = <cfqueryparam cfsqltype="CF_SQL_BIT" value="#new_isDeleted#"  null="#NOT len(trim(new_isDeleted))#" /> 

WHERE rangeid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_rangeid#" /> </cfquery>

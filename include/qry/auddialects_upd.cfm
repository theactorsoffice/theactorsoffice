<cfinclude template="/include/remote_load.cfm" />

<cfparam name="new_auddialect" default="" />
<cfparam name="new_audCatid" default="2" />
<cfparam name="new_isDeleted" default="0" />

<cfquery name="auddialects_ins" datasource="#dsn#" result="result" >  
UPDATE auddialects  SET 
auddialect = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_auddialect#" maxlength="100" null="#NOT len(trim(new_auddialect))#" /> ,
audCatid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audCatid#"  null="#NOT len(trim(new_audCatid))#" /> ,
isDeleted = <cfqueryparam cfsqltype="CF_SQL_BIT" value="#new_isDeleted#"  null="#NOT len(trim(new_isDeleted))#" /> 

WHERE auddialectid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_auddialectid#" /> </cfquery>

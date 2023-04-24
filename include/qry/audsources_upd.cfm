<cfinclude template="/include/remote_load.cfm" />

<cfparam name="new_audsource" default="" />
<cfparam name="new_isDeleted" default="0" />

<cfquery name="audsources_ins" datasource="#dsn#" result="result" >  
UPDATE audsources  SET 
audsource = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_audsource#" maxlength="100" null="#NOT len(trim(new_audsource))#" /> ,
isDeleted = <cfqueryparam cfsqltype="CF_SQL_BIT" value="#new_isDeleted#"  null="#NOT len(trim(new_isDeleted))#" /> 

WHERE audsourceid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audsourceid#" /> </cfquery>

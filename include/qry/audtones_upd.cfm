<cfinclude template="/include/remote_load.cfm" />

<cfparam name="new_tone" default="" />
<cfparam name="new_audCatid" default="2" />
<cfparam name="new_isDeleted" default="0" />

<cfquery name="audtones_ins" datasource="#dsn#" result="result" >  
UPDATE audtones  SET 
tone = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_tone#" maxlength="100" null="#NOT len(trim(new_tone))#" /> ,
audCatid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audCatid#"  null="#NOT len(trim(new_audCatid))#" /> ,
isDeleted = <cfqueryparam cfsqltype="CF_SQL_BIT" value="#new_isDeleted#"  null="#NOT len(trim(new_isDeleted))#" /> 

WHERE toneid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_toneid#" /> </cfquery>

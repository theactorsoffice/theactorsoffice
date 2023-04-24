<cfinclude template="/include/remote_load.cfm" />

<cfparam name="new_mediaid" default="" />
<cfparam name="new_audroleid" default="" />
<cfparam name="new_mediaAudroleDescript" default="" />
<cfparam name="new_isDeleted" default="0" />

<cfquery name="audmedia_audroles_xref_ins" datasource="#dsn#" result="result" >  
UPDATE audmedia_audroles_xref  SET 
mediaid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_mediaid#"  null="#NOT len(trim(new_mediaid))#" /> ,
audroleid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audroleid#"  null="#NOT len(trim(new_audroleid))#" /> ,
mediaAudroleDescript = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_mediaAudroleDescript#" maxlength="500" null="#NOT len(trim(new_mediaAudroleDescript))#" /> ,
isDeleted = <cfqueryparam cfsqltype="CF_SQL_BIT" value="#new_isDeleted#"  null="#NOT len(trim(new_isDeleted))#" /> 

WHERE  = <cfqueryparam cfsqltype="" value="#new_#" /> </cfquery>

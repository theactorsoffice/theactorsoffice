<cfinclude template="/include/remote_load.cfm" />

<cfparam name="new_projName" default="" />
<cfparam name="new_projtye" default="" />
<cfparam name="new_Status1" default="" />
<cfparam name="new_Status2" default="" />
<cfparam name="new_CastingAgency" default="" />
<cfparam name="new_CastingDir" default="" />
<cfparam name="new_CastingAssociate" default="" />
<cfparam name="new_CastingAssistant" default="" />
<cfparam name="new_Notes1" default="" />
<cfparam name="new_Notes2" default="" />
<cfparam name="new_Notes3" default="" />
<cfparam name="new_CastingDir2" default="" />
<cfparam name="new_audnetwork" default="" />

<cfquery name="audprojects_castingabout_ins" datasource="#dsn#" result="result" >  
UPDATE audprojects_castingabout  SET 
projName = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_projName#" maxlength="500" null="#NOT len(trim(new_projName))#" /> ,
projtye = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_projtye#" maxlength="500" null="#NOT len(trim(new_projtye))#" /> ,
Status1 = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_Status1#" maxlength="500" null="#NOT len(trim(new_Status1))#" /> ,
Status2 = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_Status2#" maxlength="500" null="#NOT len(trim(new_Status2))#" /> ,
CastingAgency = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_CastingAgency#" maxlength="500" null="#NOT len(trim(new_CastingAgency))#" /> ,
CastingDir = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_CastingDir#" maxlength="500" null="#NOT len(trim(new_CastingDir))#" /> ,
CastingAssociate = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_CastingAssociate#" maxlength="500" null="#NOT len(trim(new_CastingAssociate))#" /> ,
CastingAssistant = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_CastingAssistant#" maxlength="500" null="#NOT len(trim(new_CastingAssistant))#" /> ,
Notes1 = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_Notes1#" maxlength="500" null="#NOT len(trim(new_Notes1))#" /> ,
Notes2 = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_Notes2#" maxlength="500" null="#NOT len(trim(new_Notes2))#" /> ,
Notes3 = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_Notes3#" maxlength="500" null="#NOT len(trim(new_Notes3))#" /> ,
CastingDir2 = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_CastingDir2#" maxlength="500" null="#NOT len(trim(new_CastingDir2))#" /> ,
audnetwork = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_audnetwork#" maxlength="500" null="#NOT len(trim(new_audnetwork))#" /> 

WHERE ID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_ID#" /> </cfquery>

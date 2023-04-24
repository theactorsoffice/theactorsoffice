<cfinclude template="/include/remote_load.cfm" />

<cfparam name="new_audRoleID" default="" />
<cfparam name="new_vocaltypeid" default="" />

<cfquery name="audvocaltypes_audition_xref_ins" datasource="#dsn#" result="result" >  
UPDATE audvocaltypes_audition_xref  SET 
audRoleID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audRoleID#"  null="#NOT len(trim(new_audRoleID))#" /> ,
vocaltypeid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_vocaltypeid#"  null="#NOT len(trim(new_vocaltypeid))#" /> 

WHERE  = <cfqueryparam cfsqltype="" value="#new_#" /> </cfquery>

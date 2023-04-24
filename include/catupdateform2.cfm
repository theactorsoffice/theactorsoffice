<CFINCLUDE template="/include/remote_load.cfm" />


<cfquery name="audprojects_ins" datasource="#dsn#" result="result" >
  
UPDATE audprojects  SET 
audSubCatID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audSubCatID#"  null="#NOT len(trim(new_audSubCatID))#" /> 
WHERE audprojectID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audprojectID#" /> 
</cfquery>

     <cfoutput>
     <cfset returnurl = "/app/audition/?audprojectid=#audprojectid#&secid=#secid#" />
     </cfoutput>

	 <cflocation url="#returnurl#" >

 


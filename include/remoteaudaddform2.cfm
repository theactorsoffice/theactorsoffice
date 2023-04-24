<cfinclude template="/include/remote_load.cfm" />

<cfif #new_audlocid# is "custom">

<cfquery name="audlocations_ins" datasource="#dsn#" result="result" >
        INSERT INTO audlocations (userid,audlocname)
        VALUES (#userid#,'#custom#')
    </cfquery>
<cfset new_audlocid=result.generatedkey />
</cfif>


<CFINCLUDE template="/include/remote_load.cfm" />

<cfquery name="findproject" datasource="#dsn#"   >
select projname,projdescription,contactid from audprojects where audprojectid = #audprojectid# 
    </cfquery>

<cfset new_projname = findproject.projname />

<cfset new_projdescription = findproject.projdescription />

<cfset new_contactid = findproject.contactid />

<cfinclude template="/include/qry/auditions_ins.cfm" />

 
     <cfoutput>
     <cfset returnurl = "/app/audition/?audprojectid=#audprojectid#&audid=#new_audID#&secid=#secid#&focusid=#focusid#" />
     </cfoutput>
 
 
	 
	 <cflocation url="#returnurl#" >

 

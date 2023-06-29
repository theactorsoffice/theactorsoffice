<CFINCLUDE template="/include/remote_load.cfm" />
  

<cfquery name="update" datasource="#dsn#">
update audroles r 
set isbooked = 1
WHERE r.audroleid = #audroleid#
</cfquery>
 
     <cfoutput>
     <cfset returnurl = "/app/audition/?audprojectid=#audprojectid#&eventid=#eventid#&secid=#secid#" />
     </cfoutput>
 
 
	 
	 <cflocation url="#returnurl#" >

 

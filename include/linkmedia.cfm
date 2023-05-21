<cfquery name="linkmedia" datasource="#dsn#">

insert into audmedia_auditions_xref (mediaid,audprojectid)
values (#new_mediaid#,#audprojectid#)
</cfquery>


     <cfoutput>
     <cfset returnurl = "/app/audition/?audprojectid=#audprojectid#&secid=179" />
     </cfoutput>
	 
	 <cflocation url="#returnurl#" >

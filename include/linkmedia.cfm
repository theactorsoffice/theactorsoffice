<cfquery name="linkmedia" datasource="#dsn#">

insert into audmedia_auditions_xref (mediaid,audprojectid)
values (#new_mediaid#,#audprojectid#)
<cfquery name="linkmedia" datasource="#dsn#">


     <cfoutput>
     <cfset returnurl = "/app/audition/?audprojectid=#audprojectid#&secid=179" />
     </cfoutput>
	 
	 <cflocation url="#returnurl#" >

<cfset userid = session.userid />
 
<cfparam name="eventid" default="0"/>
<CFINCLUDE template="/include/remote_load.cfm" />

       
       <cfquery name="del"  datasource="#dsn#"   >
UPDATE audmedia SET isdeleted = 1 WHERE mediaid = #mediaid#
</cfquery>

 
 

 
         
     <cfoutput>
     <cfset returnurl = "/app/audition/?eventid=#eventid#&secid=177" />
     </cfoutput>
 
 
	 
	 <cflocation url="#returnurl#" >

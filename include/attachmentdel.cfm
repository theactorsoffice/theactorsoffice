<cfset userid = session.userid />
<cfparam name="reventid" default="0"/>
<cfparam name="rcontactid" default="0"/>
<cfparam name="eventid" default="0"/>
<CFINCLUDE template="/include/remote_load.cfm" />

<cfset currentURL = cgi.server_name />

<cfset host = ListFirst(currentURL, ".") />

<cfquery name="attachdetails"  datasource="#dsn#"   >
SELECT attachid,noteid,attachname,attachfilename FROM attachments WHERE attachid = #attachid#
</cfquery>



    <cfoutput>

        <cfset cUploadFolder="C:\home\theactorsoffice.com\media-#host#\users\#session.userid#" />
        
        <cfset attachfilename = "#attachdetails.attachfilename#" />
    </cfoutput>

 <cfif FileExists("C:\home\theactorsoffice.com\media-#host#\users\#session.userid#\#attachfilename#")>
   <cffile action="delete"
	   file="C:\home\theactorsoffice.com\media-#host#\users\#session.userid#\#attachfilename#">
       
       <cfquery name="del"  datasource="#dsn#"   >
UPDATE attachments_tbl SET isdeleted = 1 WHERE attachid = #attachid#
</cfquery>

<cfelse>
   <p>Sorry, can't delete the file - it doesn't exist.<cfabort>
</cfif>

 

<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" />

<cfinclude template="/include/bigbrotherinclude.cfm" /> 

 
         
     <cfoutput>
     <cfset returnurl = "/app/#returnurl#/?contactid=#contactid#&eventid=#eventid#&tab2_expand=true&t3=1" />
     </cfoutput>
 
 
	 
	 <cflocation url="#returnurl#" >

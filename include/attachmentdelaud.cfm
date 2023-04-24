<cfset userid = session.userid />
 
<cfparam name="rcontactid" default="0"/>
 
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
     <cfset returnurl = "/app/audition/?audprojectid=#audprojectid#&secid=178" />
     </cfoutput>
 
 
	 
	 <cflocation url="#returnurl#" >

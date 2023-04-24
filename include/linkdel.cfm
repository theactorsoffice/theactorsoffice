   <CFINCLUDE template="/include/remote_load.cfm" />
<cfparam name="rcontactid" default="0" /> 
<cfparam name="reventid" default="0" /> 

 
<cfquery datasource="#dsn#" name="find"   >
SELECT n.eventid FROM links l INNER JOIN noteslog n ON n.noteid = l.noteid
    WHERE linkid = #linkid#
</cfquery>

<cfset eventid = find.eventid />

<cfquery datasource="#dsn#" name="deletelink"   >
    UPDATE  links_tbl
SET isdeleted = 1 WHERE linkid = #linkid#
     
</cfquery>



<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" />

<cfinclude template="/include/bigbrotherinclude.cfm" /> 


 <cfif #isdefined('audid')#>
   <cfoutput>
     <cfset returnurl = "/app/#returnurl#/?contactid=#rcontactid#&audid=#audid#&audprojectid=#audprojectid#&secid=178" />

     </cfoutput>
 
<cfelse>
   <cfoutput>
     <cfset returnurl = "/app/#returnurl#/?contactid=#rcontactid#&eventid=#reventid#&tab2_expand=true&t3=1" />

     </cfoutput>
 

</cfif>
         
 
 
	 
	 <cflocation url="#returnurl#" >

 


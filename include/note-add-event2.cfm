<cfparam name="rcontactid" default="0" /> 
<cfparam name="reventid" default="0" /> 
<cfparam name="TEXT" default="" /> 
<CFINCLUDE template="/include/remote_load.cfm" />

                            

 <cfset new_notetext=reReplace(notetext, "[^\x20-\x7E]", "", "ALL")>
 

<cfquery datasource="#dsn#" name="InsertNote"  >
INSERT INTO noteslog (userid,contactid,noteDetails,isPublic,eventid,notedetailshtml)
VALUES (<cfqueryparam cfsqltype="cf_sql_integer" value="#userid#" />
    ,<cfqueryparam cfsqltype="cf_sql_integer" value="#rcontactid#" />
    ,<cfqueryparam cfsqltype="cf_sql_longvarchar" value="#LEFT(trim(noteDetails),2000)#" />
    ,<cfqueryparam cfsqltype="cf_sql_integer" value="#isPublic#" />
    ,<cfqueryparam cfsqltype="cf_sql_integer" value="#eventid#" />
    
    ,<cfqueryparam cfsqltype="cf_sql_longvarchar" value="#new_notetext#" />
    
    )
</cfquery>

<cfquery datasource="#dsn#" name="CLEAN"  >
UPDATE noteslog 

SET NOTEDETAILSHTML = REPLACE(NOTEDETAILSHTML, '<input type="text" data-formula="e=mc^2" data-link="https://quilljs.com" data-video="Embed URL">', '')


 WHERE NOTEDETAILSHTML  LIKE '%<input type="text" data-formula="e=mc^2" data-link="https://quilljs.com" data-video="Embed URL">%'
</cfquery>
         
     <cfoutput>
     <cfset returnurl = "/app/#returnurl#/?contactid=#rcontactid#&eventid=#reventid#&tab2_expand=true&t3=1" />
     </cfoutput>
 

	 
	 <cflocation url="#returnurl#" >

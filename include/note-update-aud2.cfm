<cfparam name="rcontactid" default="0" /> 
 
<cfparam name="notetext" default="" /> 
<cfinclude template="/include/remote_load.cfm" />

<cfparam name="notedetailshtml" default="" />
 



<cfset new_notetext=reReplace(notetext, "[^\x20-\x7E]", "", "ALL")>

<CFINCLUDE template="/include/remote_load.cfm" />

<cfquery datasource="#dsn#" name="updatenote"  >
UPDATE noteslog
    set noteDetails = <cfqueryparam cfsqltype="cf_sql_longvarchar" value="#LEFT(trim(noteDetails),2000)#" />
    ,notedetailshtml = <cfqueryparam cfsqltype="cf_sql_longvarchar" value="#trim(new_notetext)#" />
    
    ,isPublic = <cfqueryparam cfsqltype="cf_sql_bit" value="#isPublic#" />

    
where noteid = <cfqueryparam cfsqltype="cf_sql_integer" value="#noteid#" />
 
</cfquery>


<cfquery datasource="#dsn#" name="CLEAN"  >
UPDATE noteslog 

SET NOTEDETAILSHTML = REPLACE(NOTEDETAILSHTML, '<input type="text" data-formula="e=mc^2" data-link="https://quilljs.com" data-video="Embed URL">', '')


 WHERE NOTEDETAILSHTML  LIKE '%<input type="text" data-formula="e=mc^2" data-link="https://quilljs.com" data-video="Embed URL">%'
</cfquery>

 
         
<cfoutput>
<cfset returnurl = "/app/#returnurl#/?audprojectid=#audprojectid#&contactid=#rcontactid#&secid=178" />
</cfoutput>
 
 
	 
<cflocation url="#returnurl#" >

 


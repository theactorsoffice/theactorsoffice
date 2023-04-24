<cfparam name="rcontactid" default="0" /> 


<CFINCLUDE template="/include/remote_load.cfm" />

<cfquery datasource="#dsn#" name="updatenote"  >
UPDATE noteslog
    set noteDetails = <cfqueryparam cfsqltype="cf_sql_longvarchar" value="#LEFT(trim(noteDetails),2000)#" />
    
    
    ,isPublic = <cfqueryparam cfsqltype="cf_sql_bit" value="#isPublic#" />

    
where noteid = #noteid#
</cfquery>

 <Cfif "#rcontactid#" is "0">
     
     <cfoutput>
     <cfset return_url = "/app/#returnurl#/" />
     </cfoutput>
     
     <Cfelse>
         
     <cfoutput>
     <cfset return_url = "/app/#returnurl#?contactid=#rcontactid#" />
     </cfoutput>

      </Cfif>
     
<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" />
     
     <cfinclude template="/include/bigbrotherinclude.cfm" /> 
	 
	 <cflocation url="#return_url#&t3=1" >

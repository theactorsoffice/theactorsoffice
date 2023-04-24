<cfparam name="rcontactid" default="0" /> 


<CFINCLUDE template="/include/remote_load.cfm" />

    
    
    
<cfquery datasource="#dsn#" name="InsertNote"  >
INSERT INTO noteslog (userid,contactid,noteDetails,isPublic,eventid)
VALUES (<cfqueryparam cfsqltype="cf_sql_integer" value="#userid#" />
    ,<cfqueryparam cfsqltype="cf_sql_integer" value="#rcontactid#" />
    ,<cfqueryparam cfsqltype="cf_sql_longvarchar" value="#LEFT(trim(noteDetails),2000)#" />
    ,<cfqueryparam cfsqltype="cf_sql_integer" value="#isPublic#" />
    ,<cfqueryparam cfsqltype="cf_sql_integer" value="#eventid#" />)
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

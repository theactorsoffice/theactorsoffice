<cfset userid = session.userid />

<CFINCLUDE template="/include/remote_load.cfm" />

<cfset currentURL = cgi.server_name />

<cfset host = ListFirst(currentURL, ".") />
    


 <cfquery datasource="#dsn#" name="FindUser"  >
    SELECT
    u.userid
    ,u.userFirstName
    ,u.recordname
    ,u.userLastName
    ,u.userEmail
    ,u.contactid
    ,u.userRole
    ,u.contactid AS userContactID
    FROM taousers u
    WHERE u.userid = #session.userid#
</cfquery>


    <cfoutput>

        <cfset cUploadFolder="C:\home\theactorsoffice.com\media-#host#\users\#finduser.userid#" />
    </cfoutput>

    <CFIF not DirectoryExists("#cUploadFolder#")>

        <CFDIRECTORY directory="#cUploadFolder#" action="create">

    </CFIF>

    <cffile action="upload" filefield="form.file" destination="#cUploadFolder#\" nameconflict="MAKEUNIQUE" />

 
        
        
        
         <cfset new_filename = CFFILE.serverfile>
        
        <cfoutput>
            
            <cfif #attachname# is "">
                <cfset attachname = "#new_filename#" />
            </cfif>
             
              <cfset attachfilename = "#new_filename#" />

       </cfoutput>
        
         

 <cfquery datasource="#dsn#" name="INSERT"   result="result">
INSERT INTO attachments (attachname,attachfilename,isdeleted,userid,noteid)
VALUES (<cfqueryparam cfsqltype="cf_sql_varchar" value="#attachname#" />
     ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#attachfilename#" /> 
     ,<cfqueryparam cfsqltype="cf_sql_integer" value="0" /> 
     ,<cfqueryparam cfsqltype="cf_sql_integer" value="#session.userid#" /> 
     ,<cfqueryparam cfsqltype="cf_sql_integer" value="#noteid#" /> )
</cfquery>

<cfset new_uploadid=result.generatedkey>




 
         
     <cfoutput>
     <cfset returnurl = "/app/#returnurl#/?contactid=#rcontactid#&eventid=#reventid#&tab2_expand=true&t3=1" />
     </cfoutput>
 
 
	 
	 <cflocation url="#returnurl#" >

 

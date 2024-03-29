<cfset userid=session.userid />

<CFINCLUDE template="/include/remote_load.cfm" />

<cfset currentURL=cgi.server_name />

<cfset host=ListFirst(currentURL, "." ) />



<cfquery datasource="#dsn#" name="FindUser">
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

<cfif not DirectoryExists("#cUploadFolder#")>

    <CFDIRECTORY directory="#cUploadFolder#" action="create">

</cfif>

<cffile action="upload" filefield="form.file" destination="#cUploadFolder#\" nameconflict="MAKEUNIQUE" />

<cfset new_userid=session.userid />

<cfset new_filename=CFFILE.serverfile />
    
 

<cfoutput>

    <cfif #new_medianame# is "">

        <cfset new_medianame="#new_filename#" />

    </cfif>

    <cfset new_mediaFilename="#new_filename#" />

</cfoutput>
    
    <cfset new_mediaext = listLast(new_mediaFilename,".")>
        
        

 

    <cfinclude template="/include/qry/audmedia_ins.cfm" />

 

<cfset new_uploadid=result.generatedkey>






    <cfoutput>
        <cfset returnurl="/app/audition/?audprojectid=#audprojectid#&secid=177" />
    </cfoutput>



    <cflocation url="#returnurl#">

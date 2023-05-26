<cfset userid = session.userid/>

<cfinclude template="/include/remote_load.cfm"/>

<cfset currentURL = cgi.server_name/>

<cfset host = ListFirst(currentURL, ".")/>

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

<cfset new_userid = session.userid/>

<cfif structKeyExists(form, "file") AND len(trim(form.file)) NEQ 0>

<Cfabort>

<cfoutput>

    <cfset cUploadFolder = "C:\home\theactorsoffice.com\media-#host#\users\#finduser.userid#"/>

</cfoutput>

<cfif not DirectoryExists("#cUploadFolder#")>

    <cfdirectory directory="#cUploadFolder#" action="create">
</cfif>

<cffile action="upload" filefield="form.file" destination="#cUploadFolder#\" 
        nameconflict="MAKEUNIQUE"/>



<cfset new_filename = CFFILE.serverfile/>

<cfoutput>

    <cfif #new_medianame# is "">
    
        <cfset new_medianame = "#new_filename#"/>
    </cfif>

    <cfset new_mediaFilename = "#new_filename#"/>

</cfoutput>

<cfset new_mediaext = listLast(new_mediaFilename, ".")>

<cfelse>

<cfset new_mediaext = "" />
<cfset new_filename = "" />

</cfif>



<cfinclude template="/include/qry/audmedia_ins.cfm"/>

<cfset new_uploadid = result.generatedkey>

<cflocation url="/app/myaccount/?t9=1&tab9_expand=true&new_uploadid=<cfoutput>#new_uploadid#</cfoutput>"/>
<cfset userid = session.userid />

<CFINCLUDE template="/include/remote_load.cfm" />

<cfset currentURL = cgi.server_name />

<cfset host = ListFirst(currentURL, ".") />

<cfquery name="attachdetails"  datasource="#dsn#"   >
SELECT * FROM audmedia WHERE mediaid=#mediaid#
</cfquery>


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


 

<cfhttp url="https://#host#.theactorsoffice.com/media-#host#/users/#session.userid#/#attachdetails.mediafilename#" getAsBinary="yes"/>

<cfheader name="Content-Disposition" value="inline; filename=#attachdetails.mediafilename#" />
<cfcontent type="application/octet-stream" variable="#cfhttp.fileContent#" > 
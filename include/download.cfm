<cfset userid = session.userid />

<CFINCLUDE template="/include/remote_load.cfm" />

<cfset currentURL = cgi.server_name />

<cfset host = ListFirst(currentURL, ".") />

<cfquery name="attachdetails"  datasource="#dsn#"   >
SELECT attachid,noteid,attachname,attachfilename FROM attachments WHERE attachid = #attachid#
</cfquery>


    <cfoutput>

        <cfset cUploadFolder="C:\home\theactorsoffice.com\media-#host#\users\#session.userid#" />
    </cfoutput>

    <CFIF not DirectoryExists("#cUploadFolder#")>

        <CFDIRECTORY directory="#cUploadFolder#" action="create" />

    </CFIF>


         

<cfhttp url="https://#host#.theactorsoffice.com/media-#host#/users/#session.userid#/#attachdetails.attachfilename#" getAsBinary="yes" />

<cfheader name="Content-Disposition" value="attachment; filename=#attachdetails.attachfilename#" />
<cfcontent type="application/octet-stream" variable="#cfhttp.fileContent#" > 
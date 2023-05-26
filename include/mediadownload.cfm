<cfset filePath = "C:\home\theactorsoffice.com\media-" & URL.host & "\users\" & URL.userid & "\" & URL.mediafilename>
<cfheader name="Content-Disposition" value="attachment; filename=""#URL.mediafilename#""">
<cfcontent type="application/octet-stream" file="#filePath#">

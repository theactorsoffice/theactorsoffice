<cfif #isAuditionModule# is not "1">
<h5>You do not have access to the auditionz module.</h5>
    
    <form>
 <input type="button" value="Go back!" onclick="history.back()">
</form>
    <cfabort>

</cfif>

<cfquery name="uu" datasource="#dsn#" >
UPDATE events_tbl e
INNER JOIN audroles r ON r.audroleid = e.audroleid
INNER JOIN audprojects p ON p.audprojectid = r.audprojectid
SET e.eventtitle = p.projname,
    e.eventdescription = p.projDescription
WHERE e.eventtitle != p.projname;
</cfquery>
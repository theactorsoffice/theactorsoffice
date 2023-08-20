<cfset calendarId = "primary">
<cfset apiUrl = "https://www.googleapis.com/calendar/v3/calendars/#calendarId#/events">
<cfset accessToken = "#access_token#"> <!-- Replace with the access token from the database -->

<cfhttp url="#apiUrl#" method="get" result="calendarResponse">
    <cfhttpparam type="header" name="Authorization" value="Bearer #accessToken#">
</cfhttp>

<cfset events = DeserializeJSON(calendarResponse.FileContent)>

<cfdump var="#events#">

<cfset new_userid = 1 />


<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="user"      >
SELECT userid
,userFirstName
,userLastName
,userEmail
,userRole
,recordname
contactid

FROM taoUsers
where userid = #new_userid#
</cfquery>

<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="events"    maxrows="1" >
SELECT 
e.eventID
    ,e.eventID 
,e.eventTitle 
,e.eventDescription
,e.eventLocation 
,e.eventStatus 
,e.eventCreation
,e.eventStart 
,e.eventStop
,e.eventTypeName    
,e.userid
,e.eventStartTime
,e.eventStopTime
,c.recordname
 FROM events e
 INNER JOIN contactdetails c ON c.contactid = e.contactid
WHERE e.userid = #user.userid# and e.eventStoptime <> ''  and e.eventStarttime <> ''
</cfquery>

<cfcontent type="text/calendar">
<cfheader name="Content-Disposition" value="inline;
filename=tao9.ics">
BEGIN:VCALENDAR
PRODID:-//Google Inc//Google Calendar 70.9054//EN
VERSION:2.0
CALSCALE:GREGORIAN
METHOD:PUBLISH
X-WR-CALNAME:<cfoutput>#user.userEmail#</cfoutput>
X-WR-TIMEZONE:America/Los_Angeles
BEGIN:VTIMEZONE
TZID:America/Los_Angeles
X-LIC-LOCATION:America/Los_Angeles
BEGIN:DAYLIGHT
TZOFFSETFROM:-0800
TZOFFSETTO:-0700
TZNAME:PDT
DTSTART:19700308T020000
RRULE:FREQ=YEARLY;BYMONTH=3;BYDAY=2SU
END:DAYLIGHT
BEGIN:STANDARD
TZOFFSETFROM:-0700
TZOFFSETTO:-0800
TZNAME:PST
DTSTART:19701101T020000
RRULE:FREQ=YEARLY;BYMONTH=11;BYDAY=1SU
END:STANDARD
END:VTIMEZONE
<cfloop query="events"><cfoutput>
BEGIN:VEVENT 
SUMMARY:#eventTitle#
LOCATION:#eventLocation#
DTSTART:#DateFormat(eventStart,"yyyymmdd")#T#TimeFormat(eventStartTime, "HHmm")#00Z
DTEND:#DateFormat(eventStart,"yyyymmdd")#T#TimeFormat(eventStopTime, "HHmm")#00Z
DTSTAMP:#DateFormat(eventStart,"yyyymmdd")#T#TimeFormat(eventStartTime, "HHmm")#00Z
UID:0C98EA46-F950-4176-A7B6-8F0A415DBF83#eventid#
DESCRIPTION:#eventDescription#
END:VEVENT</cfoutput>
</cfloop>
END:VCALENDAR
    


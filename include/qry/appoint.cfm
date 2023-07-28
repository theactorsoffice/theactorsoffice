<CFINCLUDE template="/include/remote_load.cfm" /> <cfquery name="relationships"  datasource="#dsn#"    >
SELECT d.contactid,
d.recordname
FROM contactdetails d

WHERE d.contactStatus = 'Active' and d.userid = <Cfqueryparam value="#session.userid#" cfsqltype="CF_SQL_INTEGER" />
    


order by d.contactfullname
</cfquery>
	 <cfquery name="types"   datasource="#dsn#"   >
SELECT eventtypename FROM eventtypes_user where userid = #session.userid# ORDER BY eventtypename
</cfquery>
<cfquery name="eventdetails"  datasource="#dsn#"   >
SELECT 
e.eventID
    ,e.eventID as recid
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
,e.contactid
    ,e.dow
    ,e.endRecur
    
 FROM events e
WHERE e.eventid = #eventid#
</cfquery>

<cfset new_eventid = eventid />
 <cfquery name="contacts"  datasource="#dsn#"    >
SELECT d.contactid,
d.recordname
FROM contactdetails d

WHERE d.contactStatus = 'Active' and d.userid = <Cfqueryparam value="#session.userid#" cfsqltype="CF_SQL_INTEGER" />
    


order by d.contactfullname
</cfquery>

 <cfquery name="attendees"  datasource="#dsn#"    >
SELECT * FROM eventcontactsxref x
inner join contactdetails c on x.contactid = c.contactid
 WHERE x.eventid = <Cfqueryparam value="#eventid#" cfsqltype="CF_SQL_INTEGER" />

</cfquery>

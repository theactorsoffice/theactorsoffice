<CFINCLUDE template="/include/remote_load.cfm" /> 

<cfquery name="relationships"   datasource="#dsn#"   >
SELECT d.contactid,
d.recordname
FROM contactdetails d

WHERE d.contactStatus = 'Active' and d.userid = <Cfqueryparam value="#session.userid#" cfsqltype="CF_SQL_INTEGER" />
    


order by d.contactfullname
</cfquery>

	 <cfquery name="types"    datasource="#dsn#"  >
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
    ,e.endRecur,
        truncate(hour(TIMEDIFF(e.eventStopTime, e.eventStartTime)),2)  +
    
        truncate(minute(TIMEDIFF(e.eventStopTime, e.eventStartTime)),2)/60  AS new_durhours
 FROM events e
WHERE e.eventid = #eventid#
</cfquery>

 <cfquery name="findd" datasource="#dsn#">
    select durid as new_durid from mtgdurations
    
    where durhours = #eventdetails.new_durhours# 
    </cfquery>
    
    <cfif #findd.recordcount# is "1">
        
        <cfset new_durid = findd.new_durid />
    
    </cfif>





 <cfquery name="contacts" >
SELECT d.contactid,
d.recordname
FROM contactdetails d

WHERE d.contactStatus = 'Active' and d.userid = <Cfqueryparam value="#session.userid#" cfsqltype="CF_SQL_INTEGER" />
    


order by d.contactfullname
</cfquery>


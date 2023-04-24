<cfparam name="userid" default="0" />

<cfif #isdefined('session.userid')#>

<cfset userid = session.userid />
    
</cfif>
<CFINCLUDE template="/include/remote_load.cfm" />
<cfquery name="eventresults"  datasource="#dsn#"    >
SELECT 
e.eventID
    ,e.eventID as recid
,e.eventTitle as col1
,e.eventDescription
,e.eventLocation as col2
,e.eventStatus as col4
,e.eventCreation
,e.eventStart as col3
,e.eventStop
,e.eventTypeName as col5
,'Appointment' as head1
,'Location' as head2
,'Date' as head3
,'Status' as head4
,'Type' as head5
,e.userid
,e.eventStartTime
,e.eventStopTime
,t.eventtypecolor
,e.audid
,r.audprojectid
,s.audstep
 FROM events e 
    INNER JOIN eventtypes_user t on t.eventtypename = e.eventtypename
    
    LEFT JOIN auditions a on e.audid = a.audid
    LEFT JOIN audroles r on r.audroleid = a.audroleid
    LEFT JOIN audsteps s on s.audstepid = a.audstepid
WHERE e.userid = #session.userid# and t.userid = #session.userid#
    

    
<cfif #isdefined('currentid')#>
    and e.eventid in (select eventid from eventcontactsxref where contactid = #currentid#) 
    
    </cfif>
        order by e.eventstart desc
</cfquery>

<cfquery datasource="#dsn#" name="events"     >
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
 ,e.dow
        ,e.endRecur
        ,t.id
    ,e.eventid
    ,r.audprojectid
 FROM events e  INNER JOIN eventtypes_user t on t.eventtypename = e.eventtypename
     LEFT JOIN events a on e.eventid = a.eventid
    LEFT JOIN audroles r on r.audroleid = a.audroleid
WHERE e.userid = #session.userid# and t.userid = #session.userid#
    
<cfif #isdefined('currentid')#>
    and e.eventid iN (select eventid from eventcontactsxref where contactid = #currentid#)  
    </cfif>
    
</cfquery>

         
        <cfif #isdefined('currentid')#>
            and e.eventid iN (select eventid from eventcontactsxref where contactid = #currentid#)
        </cfif>




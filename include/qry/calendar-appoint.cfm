 <cfquery datasource="#dsn#" name="eventss">
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
        FROM events e INNER JOIN eventtypes_user t on t.eventtypename = e.eventtypename
        WHERE e.userid = #session.userid# and t.userid = #session.userid#

        <cfif #isdefined('currentid')#>
            and e.eventid iN (select eventid from eventcontactsxref where contactid = #currentid#)
        </cfif>

    </cfquery>


<cfquery name="eventtypes_user"    datasource="#dsn#"  >
SELECT id,eventtypename,eventtypedescription,recordname,iscustom, eventtypecolor 
    FROM eventtypes_user 
    WHERE userid = #session.userid#
    ORDER BY eventtypename
</cfquery>


<style>
    #topbox {
        display: flex;
        flex-flow: row wrap;
    }

    .alignleft {
        width: 25%;
        text-align: left;
    }

    .aligncenter {
        width: 50%;
        text-align: center;
    }

    .alignright {
        width: 25%;
        text-align: right;
    }

    <cfloop query="eventtypes_user"><cfoutput>.colorkey-#eventtypes_user.id# {
        background-color: #eventtypes_user.eventtypecolor# !important;
    }

    a.colorkey:hover,
    a.colorkey:focus,
    button.colorkey:hover,
    button.colorkey:focus {
        background-color: ##343a40 !important;
    }

    </cfoutput></cfloop>
</style>

<style>
    .fc-event-time,
    .fc-event-title {
        padding: 0 1px;
        white-space: nowrap;
    }

    .fc-title {
        white-space: normal;
</style>
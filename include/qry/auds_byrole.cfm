<cfparam name="focusid" default="0" />
<CFINCLUDE template="/include/remote_load.cfm" />
<cfquery name="events"  datasource="#dsn#"  >
SELECT a.eventid, a.eventStart, a.eventStartTime, s.audstep
FROM  events a  
INNER JOIN audsteps s ON s.audstepid = a.audstepid
WHERE a.audroleid = #audroleid#
    <cfif #focusid# is not "0">
    and a.eventid = #focusid#
    </cfif>
    and a.isdeleted is false
ORDER BY a.eventStart desc
 </cfquery>   


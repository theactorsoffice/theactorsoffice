<cfparam name="focusid" default="0" />
<CFINCLUDE template="/include/remote_load.cfm" />
<cfquery name="auditions"  datasource="#dsn#"  >
SELECT a.audid, a.audstartdate, a.audstarttime, s.audstep
FROM  auditions a  
INNER JOIN audsteps s ON s.audstepid = a.audstepid
WHERE a.audroleid = #audroleid#
    <cfif #focusid# is not "0">
    and a.audid = #focusid#
    </cfif>
    and a.isdeleted is false
ORDER BY a.audStartDate desc
 </cfquery>   


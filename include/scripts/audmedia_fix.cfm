<cfinclude template="/include/remote_load.cfm" />

<cfparam name="eventid" default="0" />

<cfquery name="x" datasource="#dsn#">
SELECT mediaid from audmedia WHERE isdeleted = 0
</cfquery>

<cfloop query="x">

    <cfquery name="Y" datasource="#dsn#">
        SELECT eventid from events WHERE isdeleted = 0
    </cfquery>

    <cfloop query="y">

        <cfset new_eventid=y.eventid />
        
        <cfset new_mediaid=x.mediaid />

        <cfquery name="insert" datasource="#dsn#">
            INSERT INTO `audmedia_auditions_xref` (`eventid`, `mediaid`) VALUES
            (#new_eventid#, #new_mediaid#)
        </cfquery>

    </cfloop>

</cfloop>

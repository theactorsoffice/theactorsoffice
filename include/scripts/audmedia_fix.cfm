<cfinclude template="/include/remote_load.cfm" />

<cfparam name="audid" default="0" />

<cfquery name="x" datasource="#dsn#">
SELECT mediaid from audmedia WHERE isdeleted = 0
</cfquery>

<cfloop query="x">

    <cfquery name="Y" datasource="#dsn#">
        SELECT audid from auditions WHERE isdeleted = 0
    </cfquery>

    <cfloop query="y">

        <cfset new_audid=y.audid />
        
        <cfset new_mediaid=x.mediaid />

        <cfquery name="insert" datasource="#dsn#">
            INSERT INTO `audmedia_auditions_xref` (`audID`, `mediaid`) VALUES
            (#new_audID#, #new_mediaid#)
        </cfquery>

    </cfloop>

</cfloop>

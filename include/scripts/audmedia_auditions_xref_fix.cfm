<CFINCLUDE template="/include/remote_load.cfm" />

<cfquery datasource="#dsn#" name="x"  >
SELECT x.mediaid,r.audprojectid FROM audmedia_auditions_xref X
INNER JOIN auditions_tbl a ON a.eventid = x.eventid
INNER JOIN audroles r ON r.audroleid = a.audroleid
where x.audprojectid is null
</cfquery>

<cfloop query="x">

    <cfquery datasource="#dsn#" name="update"  >
    update audmedia_auditions_xref
    set audprojectid  = #x.audprojectid#
    where mediaid = #x.mediaid#
    </cfquery>
    
</cfloop>

    <cfquery datasource="#dsn#" name="del"  >
    Delete from audmedia_auditions_xref
where audprojectid is null
    </cfquery>

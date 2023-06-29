<CFINCLUDE template="/include/remote_load.cfm" />

<cfquery datasource="#dsn#" name="x"  >
SELECT x.contactid,r.audprojectid FROM audcontacts_auditions_xref X
INNER JOIN events_tbl a ON a.eventid = x.eventid
INNER JOIN audroles r ON r.audroleid = a.audroleid
 
</cfquery>

<cfloop query="x">

    <cfquery datasource="#dsn#" name="update"  >
    update audcontacts_auditions_xref
    set audprojectid  = #x.audprojectid#
    where contactid = #x.contactid#
    </cfquery>
    
</cfloop>

    <cfquery datasource="#dsn#" name="del"  >
    Delete from audcontacts_auditions_xref
where audprojectid is null
    </cfquery>

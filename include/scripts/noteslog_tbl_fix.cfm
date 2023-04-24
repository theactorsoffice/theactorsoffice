<CFINCLUDE template="/include/remote_load.cfm" />

<cfquery datasource="#dsn#" name="x"  >
SELECT x.noteid,r.audprojectid FROM noteslog_tbl X
INNER JOIN auditions_tbl a ON a.audID = x.audid
INNER JOIN audroles r ON r.audroleid = a.audroleid
 
</cfquery>

<cfloop query="x">

    <cfquery datasource="#dsn#" name="update"  >
    update noteslog_tbl
    set audprojectid  = #x.audprojectid#
    where noteid = #x.noteid#
    </cfquery>
    
</cfloop>

 
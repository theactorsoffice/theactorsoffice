<CFINCLUDE template="/include/remote_load.cfm" />
 
<cfquery name="audgenres_audition_xref" datasource="#dsn#">
SELECT g.audgenre FROM audgenres_user g
INNER JOIN audgenres_audition_xref x ON x.audgenreID = g.audgenreID
WHERE x.audroleid = #audroleid# and g.userid = #userid#
ORDER BY g.audgenre
 
</cfquery>

<cfparam name="dbug" default="N" />
<cfparam name="audprojectid" default="0" />
<CFINCLUDE template="/include/remote_load.cfm" />


<cfquery name="audcontacts" datasource="#dsn#">
SELECT distinct d.contactid
,d.recordname as contactname

,d.contactStatus

  
    
FROM contactdetails d

INNER JOIN audcontacts_auditions_xref X ON x.contactid = d.contactid

 
WHERE x.audprojectid = #audprojectid# 
    
    
    ORDER BY d.recordname
</cfquery>

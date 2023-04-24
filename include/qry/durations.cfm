<CFINCLUDE template="/include/remote_load.cfm" /> 

<cfquery name="durations"  datasource="#dsn#"    >
SELECT 
    durid,
    durhours,
    durname 
    FROM mtgdurations 
    ORDER BY durid
</cfquery>
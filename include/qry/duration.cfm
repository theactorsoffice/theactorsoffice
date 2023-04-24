<CFINCLUDE template="/include/remote_load.cfm" /> 

<cfquery name="duration"  datasource="#dsn#"    >
SELECT 
    durid,
    durhours,
    durhours * 3600 as durseconds,
    durname 
    FROM mtgdurations 
    where durid = #new_durid#
</cfquery>
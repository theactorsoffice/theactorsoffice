<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="x"      >
SELECT * FROM events
</cfquery>

<cfloop query="x">
    <Cfoutput>
    <cfset new_contactid = "#x.contactid#" />
    <cfset new_eventid = "#x.eventid#" />    
        
    </Cfoutput>
    
<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="inserts"      >
Insert into eventcontactsxref (eventid,contactid) values (#new_eventid#,#new_contactid#)
    </cfquery>
</cfloop>

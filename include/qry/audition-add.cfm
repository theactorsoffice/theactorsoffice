
<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="relationships"  >
        select * from contactdetails d where recordname <> '' and userid = #session.userid# order by d.contactfirst, d.contactlast
        </cfquery>
    
    <cfinclude template="/include/qry/durations.cfm" />
    
    

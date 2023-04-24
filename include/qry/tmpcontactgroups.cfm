<cfparam name="idlist" default="0" />

 <CFINCLUDE template="/include/remote_load.cfm" />




 

<cfquery name="BatchDetails"  datasource="#dsn#"  >
SELECT contactid,recordname FROM contactdetails  d 
    


WHERE d.contactid IN (#idlist#)
</cfquery>
            

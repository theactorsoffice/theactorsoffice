<cfset dbug="Y" />
<CFINCLUDE template="/include/remote_load.cfm" />
    
  <cfquery name="audpaycycles_sel"   datasource="#dsn#" >
SELECT paycycleid AS id, paycycle AS name FROM audpaycycles order by paycycle
 </cfquery>
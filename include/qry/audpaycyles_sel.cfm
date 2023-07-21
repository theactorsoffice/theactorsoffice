<cfset dbug="Y" />
<CFINCLUDE template="/include/remote_load.cfm" />
    
  <cfquery name="audpaycyles_sel"   datasource="#dsn#" >
SELECT paycycleid AS id, paycyclename AS name FROM audpaycycles order by paycyclename
 </cfquery>
<cfset dbug="Y" />
<CFINCLUDE template="/include/remote_load.cfm" />
    
  <cfquery name="incometypes_sel"   datasource="#dsn#" >
SELECT incometypeid AS id, incometype AS name FROM incometypes 
    
 </cfquery>
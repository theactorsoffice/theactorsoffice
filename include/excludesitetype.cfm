

<CFINCLUDE template="/include/remote_load.cfm" />


  <cfquery datasource="#dsn#" name="Find"   >
SELECT pnid FROM sitetypes_user_tbl 
WHERE sitetypeid = #current_sitetypeid#
</cfquery>


<cfquery datasource="#dsn#" name="update"   >
UPDATE sitetypes_user_tbl
SET isdeleted = 1

WHERE sitetypeid = #current_sitetypeid#
</cfquery>


<cfif #find.recordcount# is "1" >
    
      

  <cfquery datasource="#dsn#" name="update"   >
UPDATE pgpanels_user 
SET isdeleted = 1

WHERE pnid = #find.pnid#
</cfquery>
 
</cfif>

<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" />
<cfinclude template="/include/bigbrotherinclude.cfm" /> 
<cflocation url="/app/myaccount/?t1=1" />      
    
 
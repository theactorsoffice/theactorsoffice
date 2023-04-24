        
  <cfquery datasource="#dsn#" name="findid"> 
        SELECT r.ID as new_iD
FROM reports_user r 
WHERE r.userid = 
      #session.userid# and r.reportid =<cfqueryparam cfsqltype="cf_sql_integer" value="#new_reportid#" />  
        </cfquery>
 
    <cfoutput>
        <cfset new_ID = #findid.new_id# />
    </cfoutput>

<cfoutput>
    
    <cfif #new_id# is "">
    
    <cfset new_id = 0 />
    </cfif>
    
        <cfif #userid# is "">
    
    <cfset userid = 0 />
    </cfif>

    <cfset new_label_new = "#Replace('#new_label#','''','','All')#" />

</cfoutput>

<cfquery datasource="#dsn#" name="Insert_ReportItems"  > 
INSERT INTO `reportitems` (`itemLabel`, `itemOrderNo`, `itemValueInt`, `ID`, `itemDataset`, `userid`) 
VALUES (
    <cfqueryparam cfsqltype="cf_sql_varchar" value="#new_label_new#" />, 
    <cfqueryparam cfsqltype="cf_sql_integer" value="#i#" />, 
    <cfqueryparam cfsqltype="cf_sql_integer" value="#new_itemValueInt#" />, 
    <cfqueryparam cfsqltype="cf_sql_integer" value="#new_id#" />,  
    <cfqueryparam cfsqltype="cf_sql_varchar" value="#new_itemDataSet#" />, 
    <cfqueryparam cfsqltype="cf_sql_integer" value="#session.userid#" />  

    );
</cfquery>
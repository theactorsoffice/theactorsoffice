<CFINCLUDE template="/include/remote_load.cfm" /> <cfquery  name="systems" datasource="#dsn#" >                      
SELECT systemtype AS ID, systemtype AS systemname from fusystemtypes ORDER BY systemtype                       
</cfquery>      

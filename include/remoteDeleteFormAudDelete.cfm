<cfinclude template="/include/remote_load.cfm" />

<cfquery name="del" datasource="#dsn#" >  
update events set isdeleted = 1 where eventid = #eventid#
</cfquery>
    <cfquery name="del2" datasource="#dsn#" >  
update events_tbl set isdeleted = 1 where eventid = #eventid#
</cfquery>
    


      <cflocation url="/app/audition/?audprojectid=#audprojectid#" />
    
 


<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" />

<cfinclude template="/include/bigbrotherinclude.cfm" /> 



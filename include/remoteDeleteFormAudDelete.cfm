<cfinclude template="/include/remote_load.cfm" />

<cfquery name="del" datasource="#dsn#" >  
update auditions set isdeleted = 1 where audid = #audid#
</cfquery>
    <cfquery name="del2" datasource="#dsn#" >  
update events_tbl set isdeleted = 1 where audid = #audid#
</cfquery>
    


      <cflocation url="/app/audition/?audprojectid=#audprojectid#" />
    
 


<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" />

<cfinclude template="/include/bigbrotherinclude.cfm" /> 



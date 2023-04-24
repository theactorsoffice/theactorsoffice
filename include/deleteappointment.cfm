   <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="deleteticket"   >
    UPDATE events
       set isdeleted = 1 where eventid = #recid#
</cfquery>



<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" /><cfinclude template="/include/bigbrotherinclude.cfm" /> 

<cflocation url="/app/contact/?currentid=#contactid#&contactid=#contactid#&t2=1" >
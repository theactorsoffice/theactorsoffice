


<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="deletenote"   >
    UPDATE noteslog_tbl
       set isdeleted = 1 where noteid = #recid#
</cfquery>



<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" /><cfinclude template="/include/bigbrotherinclude.cfm" /> 
<cfif #returnurl# is "audition">
<cflocation url="/app/audition/?audprojectid=#audprojectid#&secid=178" >
</cfif>
<cfif #returnurl# is "contact">
<cflocation url="/app/contact/?currentid=#contactid#&contactid=#contactid#&t3=1" >

</cfif>

<cfif #returnurl# is not "contact">
<cflocation url="/app/appoint/?eventid=#eventid#&tab2_expand=true" >

</cfif>
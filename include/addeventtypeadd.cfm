

<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="insert"   >
insert into eventtypes_user (eventtypename,eventtypecolor,iscustom,userid)
values    ('#new_eventtypename#','#new_eventtypecolor#',1,#session.userid#)
</cfquery>
<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" /><cfinclude template="/include/bigbrotherinclude.cfm" /> 

<cflocation url="/app/calendar-appoint/?legendstatus=show" />       



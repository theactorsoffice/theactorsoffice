 <cfparam name="deletelink" default="0" /> 

 

<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="update"   >
UPDATE eventtypes_user
    
    
SET eventtypecolor = '#new_eventtypecolor#'
    <cfif #deletelink# is "1">
    ,isdeleted = 1
    </cfif>
     <cfif #new_iscustom# is "1">  
    ,eventtypename = '#new_eventtypename#'
    </cfif>

WHERE id = #id#
</cfquery>
<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" /><cfinclude template="/include/bigbrotherinclude.cfm" /> 
<cflocation url="/app/calendar-appoint/?legendstatus=show" />       




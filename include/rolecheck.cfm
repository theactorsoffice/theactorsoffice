
<CFINCLUDE template="/include/remote_load.cfm" />


<cfparam name="NEW_ISREDIRECT" default="0" />

<cfparam name="NEW_ispin" default="0" />
<cfparam name="NEW_Iscallback" default="0" />

<cfparam name="NEW_ISbooked" default="0" />
    <cfoutput>update audroles
set iscallback = #new_iscallback#
,isredirect = #new_isredirect#
,ispin = #new_ispin#
,isbooked = #new_isbooked#
WHERE audroleid = #audroleid#</cfoutput> 
<cfquery name="update"  datasource="#dsn#"  >
update audroles
set iscallback = #new_iscallback#
,isredirect = #new_isredirect#
,ispin = #new_ispin#
,isbooked = #new_isbooked#
WHERE audroleid = #audroleid#
    </cfquery>

 
<cflocation url="/app/audition/?audroleid=#audroleid#&eventid=#eventid#&pgaction=view" />
<cfinclude template="/include/remote_load.cfm" />
<cfif #statusfield# is "isBooking">
<cfset statusfield = "isBooked" />
</cfif>
<cfquery name="update" datasource="#dsn#" >  
    Update audroles
    set #statusfield# = 0
    where audroleid = #new_audroleid#
</cfquery>

<cfparam name="focusid" default="" />
<cfoutput>
<cfif #focusid# is "">
<cflocation url="/app/audition/?audprojectid=#audprojectid#" />
    
<cfelse>
<cflocation url="/app/audition/?audprojectid=#audprojectid#&focusid=#focusid#" />
</cfif></cfoutput>
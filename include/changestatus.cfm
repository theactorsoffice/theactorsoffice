<cfinclude template="/include/remote_load.cfm" />
<cfif #statusfield# is "isBooking">
<cfset statusfield = "isBooked" />
</cfif>
<cfif #pgaction# is "cancel">
<cfquery name="update" datasource="#dsn#" >  
    Update audroles
    set #statusfield# = 0
    where audroleid = #new_audroleid#
</cfquery>
    <cfelse>
<cfquery name="update" datasource="#dsn#" >  
    Update audroles
    set #statusfield# = 1
    where audroleid = #new_audroleid#
</cfquery>
</cfif>


<cfparam name="focusid" default="" />


<cfoutput>
<cfif #focusid# is "">
<cflocation url="/app/audition/?audprojectid=#audprojectid#" />
    
<cfelse>
<cflocation url="/app/audition/?audprojectid=#audprojectid#" />
</cfif></cfoutput>
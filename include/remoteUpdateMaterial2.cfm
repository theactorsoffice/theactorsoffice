<cfset userid = session.userid/>

<cfparam name="dir" default="account" />
<cfparam name="audprojectid" default="0" />
<cfinclude template="/include/remote_load.cfm"/>
<cfoutput>#dir#</cfoutput>

<cfquery datasource="#dsn#" name="FindUser">
    SELECT
    u.userid
    ,u.userFirstName
    ,u.recordname
    ,u.userLastName
    ,u.userEmail
    ,u.contactid
    ,u.userRole
    ,u.contactid AS userContactID
    FROM taousers u
    WHERE u.userid = #session.userid#
</cfquery>

<cfset new_userid = session.userid/>




<cfinclude template="/include/qry/audmedia_upd.cfm"/>



<cfif #dir# is "account">



<cflocation url="/app/myaccount/?t9=1&tab9_expand=true&t1=0"   />


</cfif>



<cfif #dir# is "aud">



  <cflocation url = "/app/audition/?audprojectid=#audprojectid#&secid=177" />


</cfif>
<cfset userid = session.userid/>

<cfinclude template="/include/remote_load.cfm"/>


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

<cflocation url="/app/myaccount/?t9=1&tab9_expand=true"/>
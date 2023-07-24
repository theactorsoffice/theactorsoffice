<CFINCLUDE template="/include/remote_load.cfm" />

<cfquery name="FindUser" datasource="#dsn#">
    SELECT
    u.userid
    ,u.recordname
    ,u.userFirstName
    ,u.userLastName
    ,u.userEmail
    ,u.contactid
    ,u.userRole
    ,u.calstarttime
    ,u.calendtime
    ,u.avatarname
    ,u.IsBetaTester
    ,u.defRows
    ,u.contactid AS userContactID
    ,u.tzid
    FROM taousers u
    WHERE u.userid = <cfqueryparam  cfsqltype="cf_sql_integer" value="#userid#"  />
</cfquery>
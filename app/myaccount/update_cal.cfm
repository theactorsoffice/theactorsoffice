    <Cfif #calendtime# is "00:00:00">

        <cfset calendtime="23:59:59" />

    </cfif>
<cfset currentURL = cgi.server_name />

<cfset host = ListFirst(currentURL, ".") />

<cfif #host# is "app">
    <cfset dsn = "abo" />
    <cfset rev = "1.2.0" />
    <cfelse>
  <cfset dsn = "abod" />
<cfset rev = rand() />
</cfif>


    <cfquery datasource="#dsn#" name="update">
        update taousers
        set calstarttime =
        <cfqueryparam cfsqltype="cf_sql_time" value="#calstarttime#" />
        ,calendtime =
        <cfqueryparam cfsqltype="cf_sql_time" value="#calendtime#" />
        ,defRows =
        <cfqueryparam cfsqltype="cf_sql_integer" value="#defRows#" />
        ,viewtypeid =
        <cfqueryparam cfsqltype="cf_sql_integer" value="#viewtypeid#" />

        ,tzid =
        <cfqueryparam cfsqltype="cf_sql_varchar" value="#tzid#" />
        where userid = #userid#
    </cfquery>

    <cfset ctaction="view" />

    <Cflocation url="/app/myaccount/?new_pgid=124&t4=1" />
 

<CFINCLUDE template="/include/remote_load.cfm" />

<cfquery datasource="#dsn#" name="insert">
    DELETE from audanswers where audid = <cfqueryparam cfsqltype="cf_sql_integer" value="#audid#">
</cfquery>


<cfquery datasource="#dsn#" name="x">
    SELECT * FROM audquestions_user WHERE userid = #cookie.userid#
</cfquery>

<cfloop query="x">

    <cfquery datasource="#dsn#" name="insert">
        INSERT INTO `audanswers` (`qid`, `audid`)
        VALUES (<cfqueryparam cfsqltype="cf_sql_integer" value="#x.qid#">, <cfqueryparam cfsqltype="cf_sql_integer" value="#audid#">);
    </cfquery>

</cfloop>

<cfoutput>
    <cfset returnurl="/app/audition/?audprojectid=#audprojectid#&secid=179" />
</cfoutput>

<cflocation url="#returnurl#">

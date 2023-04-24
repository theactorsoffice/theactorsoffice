

<cfquery name="auddialects_user_sel" datasource="#dsn#">
    SELECT a.auddialectid as ID, a.auddialect as NAME, a.audcatid,a.userid
    FROM auddialects_user a
    where userid = #userid# and audcatid = #new_audcatid#
</cfquery>
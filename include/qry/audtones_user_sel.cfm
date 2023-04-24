
<cfquery name="audtones_user_sel" datasource="#dsn#">
    SELECT a.toneid as ID, a.tone as NAME, a.audcatid,a.userid
    FROM audtones_user a
    where userid = #userid# and audcatid = #new_audcatid#
</cfquery>
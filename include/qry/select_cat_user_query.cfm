<CFINCLUDE template="/include/remote_load.cfm" />
<cfset dbug = "y" />
<cfparam name="new_audcatid" default="0" />
<cfparam name="new_userid" default="0" />


<cfquery name="#tname#_sel" datasource="#dsn#">
    SELECT a.#fid# as ID, a.#fname# as NAME, ac.audCatName, ac.audCatId, a.userid
    FROM #tname# a
    INNER JOIN audcategories ac on ac.audcatid = a.audcatid


    <cfif #new_audcatid# is not "0">
        and a.audcatid = <cfqueryparam value="#new_audcatid#" cfsqltype="cf_sql_integer" />
    </cfif>
     and a.userid = <cfqueryparam value="#new_userid#" cfsqltype="cf_sql_integer" />
        <cfif #new_userid# is not "0">
    and a.userid = <cfqueryparam value="#new_userid#" cfsqltype="cf_sql_integer" />
    </cfif>
    
    
    ORDER BY ac.audcatname, a.#orderby#
</cfquery>

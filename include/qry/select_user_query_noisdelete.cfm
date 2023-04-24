<CFINCLUDE template="/include/remote_load.cfm" />
<cfparam name="new_userid" default="0" />


<cfquery name="#tname#_sel" datasource="#dsn#">
    SELECT a.#fid# as ID, a.#fname# as NAME
    FROM #tname# a
    WHERE 0=0
    
 
    and a.userid = <cfqueryparam value="#new_userid#" cfsqltype="cf_sql_integer" />
 
    ORDER BY a.#orderby#
</cfquery>

<cfif #dbug# is "Y">
    <cfoutput>    SELECT a.#fid# as ID, a.#fname# as NAME
    FROM #tname# a
    WHERE 0=0
    
    <cfif #new_userid# is not "0">
    and a.userid =  #new_userid# 
    </cfif>
    
    ORDER BY a.#orderby#</cfoutput>
    <h3>
        <cfoutput>#new_userid# - #tname#_sel</cfoutput>
 
    </h3>

    <cftable query="#tname#_sel" colheaders=true border="true" htmltable>
        <cfcol header="ID" text="#ID#" />
        <cfcol header="NAME" text="#NAME#" />
    </cftable>
    
</cfif>
<CFINCLUDE template="/include/remote_load.cfm" />

<cfset dbug = "N" />

<cfquery name="#tname#_sel" datasource="#dsn#">
    SELECT a.#fid# as ID, a.#fname# as NAME
    FROM #tname# a
    WHERE a.isDeleted is false
    ORDER BY a.#orderby#
</cfquery>

<cfif #dbug# is "Y">
    
    <h3>
        <cfoutput>#tname#_sel</cfoutput>
    </h3>

    <cftable query="#tname#_sel" colheaders=true border="true" htmltable>
        <cfcol header="ID" text="#ID#" />
        <cfcol header="NAME" text="#NAME#" />
    </cftable>
    
</cfif>
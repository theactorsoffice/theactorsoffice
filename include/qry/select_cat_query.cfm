<CFINCLUDE template="/include/remote_load.cfm" />
<cfset dbug = "y" />
<cfparam name="new_audcatid" default="0" />


 
<cfquery name="#tname#_sel" datasource="#dsn#">
    SELECT a.#fid# as ID, a.#fname# as NAME, ac.audCatName, ac.audCatId
    FROM #tname# a
    INNER JOIN audcategories ac on ac.audcatid = a.audcatid
    WHERE a.isDeleted is false

    <cfif #new_audcatid# is not "0">
        and a.audcatid = <cfqueryparam value="#new_audcatid#" cfsqltype="cf_sql_integer" />
    </cfif>
    ORDER BY ac.audcatname, a.#orderby#
</cfquery>

<cfif #dbug# is "n">

 

        <h3>
            <cfoutput>#tname#_sel all records </cfoutput>
        </h3>

        <cftable query="#tname#_sel" colheaders=true border="true" htmltable>
            <cfcol header="ID" text="#ID#" />
            <cfcol header="NAME" text="#NAME#" />
            <cfcol header="CATEGORY" text="#audCatName#" />
        </cftable>

 

            <cfquery name="cats" datasource="#dsn#">
                SELECT a.audcatid,a.audcatname
                FROM audcategories a
                WHERE a.isDeleted is false
                ORDER BY a.audcatname
            </cfquery>


            <Cfloop query="cats">

                <cfset new_audcatid=cats.audcatid />

                <cfquery name="bycat" datasource="#dsn#">
                    SELECT a.#fid# as ID, a.#fname# as NAME, ac.audCatName, ac.audCatID
                    FROM #tname# a
                    INNER JOIN audcategories ac on ac.audcatid = a.audcatid
                    WHERE a.isDeleted is false

                    <cfif #new_audcatid# is not "0">
                        and a.audcatid = <cfqueryparam value="#new_audcatid#" cfsqltype="cf_sql_integer" />
                    </cfif>
                    ORDER BY a.#orderby#
                </cfquery>
<cfif #cookie.userid# is "30">
<Cfoutput>       <p>SELECT a.#fid# as ID, a.#fname# as NAME, ac.audCatName, ac.audcatid
                    FROM #tname# a
                    INNER JOIN audcategories ac on ac.audcatid = a.audcatid
                    WHERE a.isDeleted is false

                    <cfif #new_audcatid# is not "0">
                        and a.audcatid = #new_audcatid#
                    </cfif>
                    ORDER BY a.#orderby#</p></Cfoutput>
                
               <BR></cfif>

                <h3>
                    <cfoutput>#tname# - [#cats.audcatid#] #cats.audcatname#</cfoutput>
                </h3>
<cfif  #bycat.recordcount# is not "0">
                <cftable query="bycat" colheaders="true" border="true" htmltable="true">
                    <cfcol header="ID" text="#ID#" />
                    <cfcol header="NAME" text="#NAME#" /> 
                </cftable>

    <cfelse><p>No Records.</p>
</cfif>

            </Cfloop>


    </cfif>
        
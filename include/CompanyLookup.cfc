<cfcomponent>
    <cffunction name="getCompanies" access="remote" returntype="query" output="false" returnformat="json">
        <cfargument name="searchTerm" type="string" required="true">

        <cfquery name="queryCompanies" datasource="abo">
            SELECT coName
            FROM companies
            WHERE coName LIKE <cfqueryparam value="%#arguments.searchTerm#%" cfsqltype="cf_sql_varchar">
            and COID IN (SELECT coid FROM companies_cotypes_xref WHERE cotypeid = 18)

            LIMIT 10
        </cfquery>
        
        <cfreturn queryCompanies>
    </cffunction>
</cfcomponent>





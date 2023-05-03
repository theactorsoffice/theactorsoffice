<cfcomponent>
    <cffunction name="getFullNames" access="remote" returntype="query" output="false" returnformat="json">
        <cfargument name="searchTerm" type="string" required="true">

        <cfquery name="queryFullNames" datasource="abo">
         <cfif #isdefined('sdfdfdsf')#>   SELECT DISTINCT contactfullname
            FROM contactdetails
            WHERE contactfullname <> '' AND contactfullname IS NOT NULL AND contactfullname <> 'NULL' AND contactfullname <> ' ' AND contactfullname LIKE <cfqueryparam value="#arguments.searchTerm#%" cfsqltype="cf_sql_varchar">
            UNION</cfif>
            SELECT DISTINCT recordname AS contactfullname
            FROM imdb
            WHERE recordname <> '' AND recordname IS NOT NULL AND recordname <> 'NULL' AND recordname <> ' ' AND recordname LIKE <cfqueryparam value="#arguments.searchTerm#%" cfsqltype="cf_sql_varchar">
            ORDER BY contactfullname
            LIMIT 10
        </cfquery>
        
        <cfreturn queryFullNames>
    </cffunction>
</cfcomponent>





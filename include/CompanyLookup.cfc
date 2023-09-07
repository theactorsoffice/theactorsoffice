<cfcomponent>
    <cffunction name="getCompanies_imdb" access="remote" returntype="query" output="false" returnformat="json">
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
        <cffunction name="getCompanies" access="remote" returntype="query" output="false" returnformat="json">
        <cfargument name="searchTerm" type="string" required="true">
        <cfargument name="dsn" type="string" required="true">
<cfargument name="userid" type="integer" required="true">
        <cfquery name="queryCompanies" datasource="#dsn#">
           SELECT DISTINCT i.valuecompany FROM contactitems i 
INNER JOIN contactdetails d ON d.contactid = i.contactid
WHERE i.valuecompany IS NOT NULL 
AND i.valuecompany <> '' 
AND i.valuecategory = 'Company'
AND d.contactstatus = 'Active'
AND i.valuecompany LIKE <cfqueryparam value="#arguments.searchTerm#%" cfsqltype="cf_sql_varchar">
AND d.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="cf_sql_integer">
ORDER BY i.valuecompany


            and COID IN (SELECT coid FROM companies_cotypes_xref WHERE cotypeid = 18)

            LIMIT 10
        </cfquery>
        
        <cfreturn queryCompanies>
    </cffunction>
</cfcomponent>





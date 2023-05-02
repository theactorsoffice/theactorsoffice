<cfcomponent>
    <cffunction name="getAudRoleNames" access="remote" returnType="any">
        <cfargument name="searchTerm" type="string" required="true">
        <cfquery name="getAudRoleNames" datasource="abo">
            SELECT audrolename
            FROM audrolenames
            WHERE audrolename LIKE <cfqueryparam cfsqltype="cf_sql_varchar" value="%#arguments.searchTerm#%">
            ORDER BY audrolename
        </cfquery>
        <cfreturn getAudRoleNames>
    </cffunction>
</cfcomponent>

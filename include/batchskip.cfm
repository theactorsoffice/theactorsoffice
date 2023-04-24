<cfset src="x" />

<cfset notstatus = "Skipped" />
<cfloop list="#batchlist#" index="notid">
    
    <cfset src = "x" />
    
    <cfinclude template="/include/complete_not_skip.cfm" />
    
</cfloop>

<cflocation url="/app/dashboard/?pgaction=view" />

<cfset src="x" />

<cfset notstatus = "Pending" />
<cfloop list="#batchlist#" index="notid">
    
    <cfset src = "x" />
    
    <cfinclude template="/include/complete_not_batch.cfm" />
    
</cfloop>

<cflocation url="/app/dashboard/?pgaction=view" />

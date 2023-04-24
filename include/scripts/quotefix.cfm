         <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="x"  >
SELECT * FROM quotes
WHERE quotecategory IN ('Acting','Art','Courage','Dreams','Doubt','Excellence','Fortune','Happiness','Inspiration','Inspirational','Procrastination','Success','Wealth','Movies','Ambition','Time','Knowledge','Boldness','Work','Integrity','Progress','Want','Greatness','Ability','Giving','Conscience','Goodness','Fame','Change') 
AND quotedate IS NULL
ORDER BY RAND()     
</cfquery>

<Cfset new_quotedate=dateFormat(Now(),'yyyy-mm-dd') />

<cfloop query="x">

<cfset new_quoteid = x.quoteid />
    
     <cfset new_quotedate=dateAdd('d', 1, new_quotedate) />
<cfquery datasource="#dsn#" name="update"  >
    Update quotes set quotedate = <cfqueryparam cfsqltype="cf_sql_date" value="#new_quotedate#"  >
    where quoteid = #new_quoteid#
    </cfquery>
    
 

</cfloop>

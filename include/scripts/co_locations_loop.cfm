<cfset dbug = "N" /> 

<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="a"   >
Select page_url
    from co_locations
    where coid is null
    
 </cfquery>


 <cfloop query="a">

    <cfset page_url_b  = REPLACE(a.page_url,'https://contribute.imdb.com/updates?update=','') />
     <cfset newcoImdbID = left(page_url_b,9) />
 
     
     <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="find"   >
Select coid from companies where coImdbID = '#newcoImdbID#'
    
 </cfquery>
     
     <cfif find.recordcount eq 1>
     <cfset new_coid = find.coid />
            
            <cfelse>
         <cfset new_coid = 0 />
     
     </cfif>
     
<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="UPDATE"     >
UPDATE co_locations
    set coImdbID = '#newcoImdbID#'
    <cfif #new_coid# is not "0">
        ,coid = #new_coid#
    </cfif>

where page_url = '#a.page_url#'
</cfquery>  
 
  

 </cfloop>

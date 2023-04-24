<cfset dbug = "N" /> 

<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="a"   >
SELECT * FROM co_contacts
    where imdbid is null
    
 </cfquery>


 <cfloop query="a">
<cfset new_id = a.id />
    <cfset page_url_b  = REPLACE(a.page_url,'https://pro.imdb.com/company/','') />
     <cfset newcoImdbID = left(page_url_b,9) />
 
     
     <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="find"   >
Select coid from companies where coImdbID = '#newcoImdbID#'
    
 </cfquery>
     
     <cfif find.recordcount eq 1>
     <cfset new_coid = find.coid />
            
            <cfelse>
         <cfset new_coid = 0 />
     
     </cfif>
         
         
       
         
             <cfset name_url_b  = REPLACE(a.name_url,'https://pro.imdb.com/name/','') />
     <cfset newImdbID = left(name_url_b,9) />
 
     

          
         
     
<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="UPDATE"     >
UPDATE co_contacts
    set coImdbID = '#newcoImdbID#'
    ,imdbid = '#newimdbid#'
    <cfif #new_coid# is not "0">
        ,coid = #new_coid#
    </cfif>

where id = #new_id#
</cfquery>  
 
  

 </cfloop>

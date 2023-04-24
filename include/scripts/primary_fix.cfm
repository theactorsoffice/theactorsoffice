 
<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="a"      >         
SELECT COUNT(*), contactid,valuecategory,itemstatus FROM contactitems 
GROUP BY contactid,valuecategory,itemstatus
HAVING itemstatus = 'Active' AND COUNT(*) = 1
ORDER BY contactid DESC;

    </cfquery>
    
    
<cfloop query="a">
    
    <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="update"   >
update contactitems
        set primary_yn = 'Y'
        where contactid = #a.contactid# and valuecategory='#a.valuecategory#' and itemstatus = 'Active'
</cfquery>	

</cfloop>
    
    

<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="b"      >     
SELECT COUNT(*) as total_items, contactid,valuecategory,itemstatus 
    FROM contactitems 
GROUP BY contactid,valuecategory,itemstatus
HAVING itemstatus = 'Active' AND COUNT(*) > 1
</cfquery>

<cfloop query="b">

<cfset new_contactid = b.contactid />
<cfset total_items = b.total_items />
    <cfset new_valuecategory = b.valuecategory />
    
   <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="c"      >   
SELECT contactid,itemstatus,itemid
    FROM contactitems 
       WHERE contactid= #new_contactid# and primary_yn = 'Y' and valuecategory = '#new_valuecategory#' and itemstatus = 'Active'
       order by itemid
    </cfquery>
    
    <cfif #c.recordcount# is not "1" >
  <Cfoutput>
    <h2>contact ID: #new_contactid#</h2>
     <h3>Category: #new_valuecategory#</h3>
    <h3>Total Items: #c.recordcount#</h3>
SELECT contactid,itemstatus,itemid
    FROM contactitems 
       WHERE contactid= #new_contactid# and primary_yn = 'Y' and valuecategory = '#new_valuecategory#' and itemstatus = 'Active'
       order by itemid<BR>
      </Cfoutput>
        
           <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="d"      >   
SELECT contactid,itemstatus,itemid
    FROM contactitems 
       WHERE contactid= #new_contactid# and  valuecategory = '#new_valuecategory#' and itemstatus = 'Active'
       order by itemid
    </cfquery>
        
    
       <cfset x = 0 />
     <cfloop query="d">
             
        <cfoutput>
         <cfset x = #x# + 1 />
            <h1>x:#x#</h1>
         </cfoutput>
       <cfif #x# is "1">
           <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="update"      > 
         update contactitems
               set primary_yn = 'Y'
               where itemid = #d.itemid#
           </cfquery>
         <cfoutput> update contactitems
               set primary_yn = 'Y'
               where itemid = #d.itemid#<BR></cfoutput>
         
         </cfif> 
            
            
        </cfloop>   
        
        
        
        
        
        </cfif>
    
</cfloop>
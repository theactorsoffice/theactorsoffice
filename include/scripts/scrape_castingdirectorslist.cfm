<cfset dbug = "N" /> 

<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="a"   >
     SELECT `Title`
    ,`coImageURL`
    ,`coPolicy`
    ,`coRegionAlt`
    ,`coTopInfo`
    ,`coTopInfo2`
    ,`coTopInfo3`
    ,`coDetailed1`
    ,`coDetailed2`
    ,`status`
    ,`coid`
    FROM scrape_castingdirectorslist_details
    WHERE `status` = 'Pending' 
    
 </cfquery>


 <cfloop query="a">
    
     <cfif #a.coid# is not "">
         <cfif #dbug# is "Y">
<cfoutput>
#a.Title# already has coid of #a.coid#<BR>         
</cfoutput>
         </cfif>
             
             
  <cfelse>
      
      
<cfset new_coName = trim(a.Title) />
     
 
<cfif #dbug# is "Y"> <cfoutput>[#new_coname#]<BR></cfoutput></cfif>
    
    
<cfoutput>
<cfset new_coImageURL = "#trim(a.coImageURL)#" />       
    

<cfset new_coInitialSource = 'CastingDirectorsList.com' /> 
<cfset new_coName = "#trim(a.Title)#" />

<cfset new_coPolicy = "#trim(a.coPolicy)#" /> 
<cfset new_coRegionAlt = "#Replace('#a.coRegionAlt#','LOCATION: ','')#" />
    
<cfif #a.cotopinfo# is "" and #a.cotopinfo2# is "" and #a.cotopinfo3# is "">
    
   <cfset new_cotopInfo = "" />
    <cfelsE>
<cfsavecontent variable="new_coTopInfo"><cfif #a.cotopinfo# is not ""><p>#a.coTopInfo#</p></cfif><cfif #a.cotopinfo# is not ""><p>#a.coTopInfo2#</p></cfif><cfif #a.cotopinfo# is not ""><p>#a.coTopInfo3#</p></cfif></cfsavecontent>
     </cfif>   
    
    
<cfif #a.coDetailed1# is "" and #a.coDetailed2# is "" >
    
   <cfset new_coDetailed = "" />
    <cfelsE>
<cfsavecontent variable="new_coDetailed"><cfif #a.coDetailed1# is not ""><p>#a.coDetailed1#</p></cfif><cfif #a.coDetailed2# is not ""><p>#a.coDetailed2#</p></cfif></cfsavecontent>
     </cfif>      
    
    

</cfoutput>    
    
    
    
    
    
          
<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="Find"  >     
SELECT * from `companies` where coName = <cfqueryparam cfsqltype="cf_sql_varchar" value="#new_coName#"  />
</cfquery>
      
          
          
<cfif #find.recordcount# is "1">
      <cfif #dbug# is "Y">
<cfoutput>
    <cfset new_coid = #find.coid# />
#new_coName# already in companies table - coid #find.coid#.<BR>         
</cfoutput>
</cfif>
          
       
   <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="INSERT"   result="result">
update companies
 
set
       `coImageURL` = '#new_coImageURL#'

    ,`coPolicy` = <cfqueryparam cfsqltype="cf_sql_varchar" value="#TRIM(new_coPolicy)#" />
    ,`coImageURL` = '#TRIM(new_coImageURL)#'
    ,`coRegionAlt` = '#TRIM(new_coRegionAlt)#'
    ,`coTopInfo` = <cfqueryparam cfsqltype="cf_sql_varchar" value="#TRIM(new_cotopInfo)#" />
    ,`coDetailed` = <cfqueryparam cfsqltype="cf_sql_varchar" value="#TRIM(new_coDetailed)#" />
    ,`cdl_yn`  = 'Y'
    WHERE `coid` = #new_coid#
          </cfquery>
          
<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="update_coid"    >
Update scrape_castingdirectorslist_details
set coid = #find.coid#, status = 'Match'
where `Title` = '#new_coName#'
</cfquery> 
          
          
          
          
          
  <cfif #dbug# is "Y">
<cfoutput>
#new_coName# updated with coid of #find.coid#.<BR>         
</cfoutput>
    </cfif>
      
      
      
<cfelse>
      <cfif #dbug# is "Y">
    <cfoutput>
    #new_coName# is new...adding<BR> 
    </cfoutput>
        </cfif>
  

        

        

 
        
<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="INSERT"   result="result">
INSERT INTO companies
    (`coName`
    ,`coImageURL`
    ,`coPolicy`
    ,`coRegionAlt`
    ,`coTopInfo`
    ,`coDetailed`
    ,`coInitialSource`
    ,`cdl_yn`)
    
    VALUES ('#new_coName#'
    ,'#new_coImageURL#'
    ,'#TRIM(new_coPolicy)#'
    ,'#TRIM(new_coRegionAlt)#'
    ,'#TRIM(new_coTopInfo)#'
    ,'#TRIM(new_coDetailed)#'
    ,'#TRIM(new_coInitialSource)#'
    ,'Y'
    );
</cfquery>
        
 <cfset new_coid = result.generated_key />
        
        
        
        
        
<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="UPDATE"     >
UPDATE scrape_castingdirectorslist_details
set coid = #new_coid#,
    status = 'NEW'
where title = '#new_coName#'
</cfquery>  
 
 
    
</cfif>
    
      
         
     </cfif>
     

 </cfloop>

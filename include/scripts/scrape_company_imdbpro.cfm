<cfset dbug = "N" /> 

<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="a"   >
     SELECT `Title`
    ,`Company_URL`
    ,`Image`
    ,`region_code`
    ,`Company_Type`
    ,`Company_locations`
    ,`Ranking`
    ,`ranking_change`
    ,`DiscoveryDate`
    ,`coid`
    ,`status`
    FROM scrape_imdbpro_industrylisting
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
     
 
      <cfoutput>[#new_coname#]<BR></cfoutput>
<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="Find"   maxrows="1">     
SELECT * from `companies` where coName = <cfqueryparam cfsqltype="cf_sql_varchar" value="#new_coName#"  />
</cfquery>
      
<cfif #find.recordcount# is "1">
      <cfif #dbug# is "Y">
<cfoutput>
#new_coName# already in companies table - coid #find.coid#.<BR>         
</cfoutput>
          </cfif>
<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="update_coid"    >
Update scrape_imdbpro_industrylisting
set coid = #find.coid#
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
  

        
<cfoutput>
<cfset region_code_a = "#Replace('#a.region_code#','[','')#" />
<cfset new_coInitialSource = 'IMDbPro' />
<cfset new_coRegionCode= "#Replace('#region_code_a#',']','')#" />    
<cfset new_coName = "#trim(a.Title)#" />
<cfset new_coImageURL = "#trim(a.Image)#" />   
<cfset new_Company_URL = "#trim(a.Company_URL)#" /> 
<cfset new_company_type = "#TRIM(a.company_type)#" />
<cfset new_ranking = "#Replace('#a.ranking#',',','')#" /> 
    
    <cfif #isnumeric(new_ranking)# is "true">
        
        <cfset new_coImdbRanking = #new_ranking# />
        
    <cfelse>
        
        <cfset new_coImdbRanking = 0 />
        
    </cfif>
          <cfif #dbug# is "Y">
    new_coImageRanking: #new_coImdbRanking#<BR>
              </cfif>
</cfoutput>    
        

        		<CFSCRIPT>
			if (#new_Company_URL# contains "https://pro.imdb.com/company/") {
				Find_Start = FindNoCase("https://pro.imdb.com/company/",#new_Company_URL#);
				Find_End = FindNoCase("/?",#new_Company_URL#, #Find_Start#);
				new_coImdbID = Trim(ReplaceNoCase(mid(new_Company_URL,Find_Start,Find_End-Find_Start),"https://pro.imdb.com/company/",""));
		
				}
			else { new_coImdbID = ""; }
                    
				</CFSCRIPT>
 
        
<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="INSERT"   result="result">
INSERT INTO companies
    (`coName`
    ,`coInitialSource`
    ,`coRegionCode`
    ,`coImageURL`
    ,`coImdbID`
    ,`coImdbRanking`)
    
    VALUES ('#new_coName#'
    ,'#new_coInitialSource#'
    ,'#TRIM(new_coRegionCode)#'
    ,'#new_coImageURL#'
    ,'#new_coImdbID#'
    ,#new_coImdbRanking#
    );
</cfquery>
        
 <cfset new_coid = result.generated_key />
        
        
       <cfloop index="item" list="#new_company_type#" delimiters="|">
         <cfoutput>
<cfset new_cotypename = "#trim(item)#" />
        
         </cfoutput>
               <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="find"  >      
                   select cotypeid from cotypes
                   where cotypename = '#new_cotypename#'
           </cfquery>
           
    <cfif #find.recordcount# is "1">
              
        
        <cfset new_cotypeid = find.cotypeid />
        
        
   <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="b"  >          
             INSERT IGNORE INTO `companies_cotypes_xref`
SET `coid` = '#new_coid#',cotypeid = #new_cotypeid#;
    </cfquery>     
             
           
</cfif>    

     </cfloop>      
        
        
        
<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="UPDATE"     >
UPDATE scrape_imdbpro_industrylisting
set coid = #new_coid#,
    status = 'MATCH'
where title = '#new_coName#'
</cfquery>  
 
 
    
</cfif>
    
      
      

      
      
      
      
      
      
      
      
         
     </cfif>
     

 </cfloop>

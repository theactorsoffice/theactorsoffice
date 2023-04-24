<cfset dbug = "N" /> 

<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="a"  >
     SELECT DISTINCT company_type FROM scrape_imdbpro_industrylisting WHERE company_type NOT LIKE '%main branch%'

 </cfquery>


 <cfloop query="a">

     <cfset new_company_type=trim(a.company_type) />
<cfif #dbug# is "Y" >
     <cfoutput>
         new_company_type: #new_company_type#<BR>
     </cfoutput>
</cfif>

     <cfloop index="item" list="#new_company_type#" delimiters="|">
         <cfoutput>
<cfset new_contact_type = "#trim(item)#" />
             <cfif #dbug# is "N" >
             new_contact_type: #new_contact_type#<BR>
                 </cfif>
         </cfoutput>
             
   <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="b"  >          
             INSERT IGNORE INTO `coTypes`
SET `cotypeName` = '#new_contact_type#';
             </cfquery>     
             

     </cfloop>
 </cfloop>

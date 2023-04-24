<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="xx"  >
SELECT contactid,contactbirthday FROM contactdetails WHERE contactbirthday IS not null and contactid = #contactid#
</cfquery>

<cfloop query="xx">

<cfoutput>
    
    <cfset current_year = #year(now())# />
    current year: #current_year#<BR>
    <cfset next_year = #current_year# + 1 />
     next year: #next_year#<BR>
    <cfset new_contactid = #xx.contactid# />
    
    
       <cfset new_day = #day(contactbirthday)# />
     <cfset new_month = #month(contactbirthday)# /> 
    

 
     <cfset new_date_thisyear = "#new_month#-#new_day#-#current_year#">
         
         
     <cfif #new_date_thisyear# LTE #dateformat(now(),"m-d-yyyy")#>
        <cfset final_birthday =  "#new_month#-#new_day#-#next_year#">
     <cfelse>
        <cfset final_birthday =  "#new_month#-#new_day#-#current_year#"> 
     </cfif>
                                
                                
                                
    
</cfoutput>
    
    <Cfif #isdate(final_birthday)# is "true">
 <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="update"  >   
    update contactdetails
     set contactbirthday = <cfqueryparam cfsqltype="cf_sql_date" value="#dateformat(final_birthday)#" />
     where contactid = <cfqueryparam cfsqltype="cf_sql_integer" value="#New_contactid#" />
    </cfquery>
 
        </Cfif>
    
    

</cfloop>
            
            

        
        
        
            
        
        
        
        
                
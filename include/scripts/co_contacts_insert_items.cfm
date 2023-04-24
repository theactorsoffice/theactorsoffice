<cfset dbug = "N" /> 
<cfset userid = "11" /> 

<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="a"    >
SELECT co.contactid, co.starmeter,co.jobtitle_type, co.imdbid
,c.*,l.*
,c.coname AS new_valuecompany
,co.jobtitle_type AS new_valuetitle
,l.address1 AS new_valuestreetaddress
,l.address2 AS new_valueExtendedaddress
,l.city	AS new_VALUECITY
	,l.state AS new_VALUEREGION
	,l.country AS new_VALUECOUNTRY
	,l.zip AS new_VALUEpostalcode
,l.phone
,l.fax
,l.email
,l.website
	,co.name_url as new_imdb

FROM co_contacts co 
INNER JOIN companies c ON c.coid = co.coid
INNER JOIN co_locations l ON l.coid = c.coid
WHERE  co.contactid <> '' and l.location = co.location AND l.location <> ''
</cfquery>


 <cfloop query="a">
   
<cfset new_contactid = a.contactid />     
 <cfset new_valuecompany = a.new_valuecompany />     
     
 <cfset new_valuetitle = a.new_valuetitle />     
 <cfset new_valuestreetaddress = a.new_valuestreetaddress />     
 <cfset new_valueExtendedaddress = a.new_valueExtendedaddress />     
 <cfset new_VALUECITY = a.new_VALUECITY />     
 <cfset new_VALUEREGION = a.new_VALUEREGION />     
 <cfset new_VALUEpostalcode = a.new_VALUEpostalcode />     
     
 <cfset new_phone = a.phone />    
 <cfset new_fax = a.fax />    
 <cfset new_email = a.email />    
 <cfset new_website = a.website />    
   <cfset new_imdb = a.new_imdb />       
     
    
           <cfif  #new_valuecompany# is not "">
                     <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="INSERT"       >
    INSERT INTO contactitems(contactid,valuetype,valuecategory,valuetext,valuecompany,valuetitle,primary_yn,itemstatus) 
     values (#new_contactid#,'Job','Company','','#new_valuecompany#','#new_valuetitle#','Y','Active')
     </cfquery>
     
     
     </cfif>


              <cfif  #new_valuestreetaddress# is not "">
                     <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="INSERT"       >
    INSERT INTO contactitems(contactid,valuetype,valuecategory,valuetext,valueextendedaddress,valueextendedaddress,valuecity,valueregion,valuecountry,valuepostalcode,primary_yn,itemstatus) 
     values (#new_contactid#,'Work','Address','','#new_valuestreetaddress#','#new_valueextendedaddress#','#new_valuecity#','#new_valueregion#','#new_valuecountry#','#new_valuepostalcode#','Y','Active')
     </cfquery>
     </cfif>
                  
              <cfif #new_phone# is not "">   
<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="INSERT"       >
    INSERT INTO contactitems(contactid,valuetype,valuecategory,valuetext,primary_yn,itemstatus) 
     values (#new_contactid#,'Work','Phone','#new_phone#','Y','Active')
     </cfquery>
  </cfif>                 
                  
                  <cfif #new_email# is not "">   
<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="INSERT"       >
    INSERT INTO contactitems(contactid,valuetype,valuecategory,valuetext,primary_yn,itemstatus) 
     values (#new_contactid#,'Work','Email','#new_email#','Y','Active')
     </cfquery>
  </cfif>                      
     
          
                <cfif #new_fax# is not "">   
<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="INSERT"       >
    INSERT INTO contactitems(contactid,valuetype,valuecategory,valuetext,primary_yn,itemstatus) 
     values (#new_contactid#,'Work Fax','Phone','#new_fax#','Y','Active')
     </cfquery>
  </cfif>          
     
  
     
                   <cfif #new_imdb# is not "">   
<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="INSERT"       >
    INSERT INTO contactitems(contactid,valuetype,valuecategory,valuetext,primary_yn,itemstatus) 
     values (#new_contactid#,'Imdb','Profile','#new_imdb#','Y','Active')
     </cfquery>
  </cfif>          
       
     
     
     
     
                         <cfif #new_website# is not "">   
<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="INSERT"       >
    INSERT INTO contactitems(contactid,valuetype,valuecategory,valuetext,primary_yn,itemstatus) 
     values (#new_contactid#,'Custom','URL','#new_website#','Y','Active')
     </cfquery>
  </cfif>    
    
        
    </cfloop>
    
    
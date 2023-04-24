<cfset dbug = "N" /> 
<cfset userid = "11" /> 

<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="a"    >
select c.contactid,c.jobtitle_type 
    from co_contacts c 
    inner join contactdetails d on d.contactid = c.contactid and d.userid = 11 and c.jobtitle_type <> ''
</cfquery>


 <cfloop query="a">
   
<cfset new_contactid = a.contactid />     
 <cfset new_jobtitle_type = a.jobtitle_type />      
     
       <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="d"    >
         delete from contactitems where valuetype = 'Tags' and contactid = #new_contactid#
     </cfquery>
           
           
  
    <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="x"    >
    SELECT tagname FROM tags 
     </cfquery>
     
      <cfloop query="x">
          
          <cfset new_tag = x.tagname />
          
          <cfif "#new_jobtitle_type#" contains "#new_tag#" >
                <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="INSERT"       >
    INSERT INTO contactitems(contactid,valuetype,valuecategory,valuetext,primary_yn,itemstatus) 
     values (#new_contactid#,'Tags','tag','#new_tag#','Y','Active')
     </cfquery>
          </cfif>
                    <cfif "#new_jobtitle_type#" contains "Talent Manger" >
                <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="INSERT"       >
    INSERT INTO contactitems(contactid,valuetype,valuecategory,valuetext,primary_yn,itemstatus) 
     values (#new_contactid#,'Tags','tag','Agent: Theatrical','Y','Active')
     </cfquery>
          </cfif>
          
          
              
     </cfloop>


 
</cfloop>
    
    
    
               <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="dd"       >
SELECT itemid FROM contactitems WHERE valuetext = 'Director' AND contactid IN (

SELECT contactid FROM contactitems WHERE valuetext = 'Casting Director')
    </cfquery>
    
    <cfloop query="dd">
    
    <cfset d_itemid = dd.itemid />
          
               <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="ddd"       >
DELETE FROM contactitems WHERE itemid = #d_itemid#
        </cfquery>
        
    </cfloop>
    
    
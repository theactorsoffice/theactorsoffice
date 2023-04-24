<cfset dbug = "N" /> 
<cfset userid = "11" /> 
<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="a"    >
SELECT id,image_url AS contactphoto, suffix as contactSuffix,
   SUBSTRING_INDEX(SUBSTRING_INDEX(fullname, ' ', 1), ' ', -1) AS contactfirst,
   If(  length(fullname) - length(replace(fullname, ' ', ''))>1,  
       SUBSTRING_INDEX(SUBSTRING_INDEX(fullname, ' ', 2), ' ', -1) ,NULL) 
           as contactmiddle,
   SUBSTRING_INDEX(SUBSTRING_INDEX(fullname, ' ', 3), ' ', -1) AS contactlast
From co_contacts WHERE fullname <> ''	
and contactid IS null
</cfquery>


 <cfloop query="a">
     
<cfset id = a.id />     
     

  <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="INSERT"      result="result" >
    INSERT INTO contactdetails(contactfirst,contactmiddle,contactlast,userid,contactphoto,contactSuffix) 
     values ('#a.contactfirst#','#a.contactmiddle#','#a.contactlast#',#userid#,'#a.contactphoto#','#contactSuffix#')
     </cfquery>
     
     <cfset new_contactid = result.generated_key /> 
     
     <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="update"    >
         update co_contacts
         set contactid = #new_contactid#
         where id = #id#
    </cfquery>
</cfloop>
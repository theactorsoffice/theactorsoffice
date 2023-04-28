<cfset dbug = "N" /> 
<cfset userid = "11" /> 
<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="a"    >
SELECT id,image_url AS contactphoto, suffix as contactSuffix,
From co_contacts WHERE fullname <> ''	
and contactid IS null
</cfquery>


 <cfloop query="a">
     
<cfset id = a.id />     
     

  <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="INSERT"      result="result" >
    INSERT INTO contactdetails(contactfullname,userid,contactphoto) 
     values ('#a.contactfullname#',#userid#,'#a.contactphoto#')
     </cfquery>
     
     <cfset new_contactid = result.generated_key /> 
     
     <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="update"    >
         update co_contacts
         set contactid = #new_contactid#
         where id = #id#
    </cfquery>
</cfloop>
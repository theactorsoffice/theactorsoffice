<cfinclude template="/include/remote_load.cfm" />    


<cfquery datasource="#dsn#" name="z">
    SELECT * FROM taousers where userstatus = 'active' AND issetup IS NOT true
    </cfquery>


<cfloop query="z">
<cfset select_userid  = z.userid />
    
<cfinclude template="/include/user_setup.cfm" />
    
 <cfquery datasource="#dsn#" name="update">
    update taousers set issetup = 1 where userid = #select_userid# 
    </cfquery>   
    
</cfloop>

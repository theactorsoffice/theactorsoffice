<cfset dbug = "Y" />



<CFINCLUDE template="/include/remote_load.cfm" />
    <cfquery datasource="#dsn#" name="U" >
    select  
    u.userid
    ,u.recordname
    ,u.userFirstName
    ,u.userLastName
    ,u.userEmail
    ,u.contactid
    ,u.userRole
    FROM taousers u
    where u.isdeleted = 0 
    order by u.userid desc
</cfquery>
<cfset n= 0 />

<cfloop query="u">
    
    <cfoutput>
    <cfset n = #n# + 1 />
    </cfoutput>
    
<cfquery datasource="#dsn#" name="x"  >
SELECT * FROM sitetypes_user WHERE pnid IS NULL AND isdeleted = 0 and userid = #u.userid#
</cfquery>

<cfloop query="x">

           <cfquery datasource="#dsn#" name="insert" result="result">

            INSERT INTO `pgpanels_user` (`userid`,`pnTitle`, `pnFilename`, `pnOrderNo`, `pnColXl`, `pnColMd`, `IsVisible`)
            VALUES
            (#u.userid#,'#x.sitetypename# Links', 'mylinks_user.cfm', #n#, 3, 3,1);

        </cfquery>
    
 <cfset new_pnid= result.generatedkey>
       <cfquery datasource="#dsn#" name="up" >
     update sitetypes_user
           set pnid = #new_pnid# where sitetypeid = #x.sitetypeid# and userid = #u.userid# and pnid is null
     </cfquery>
     
</cfloop>
</cfloop>
 
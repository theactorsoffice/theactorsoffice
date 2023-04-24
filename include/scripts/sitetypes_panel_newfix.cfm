<cfset dbug="Y" />

<CFINCLUDE template="/include/remote_load.cfm" />

<cfquery datasource="#dsn#" name="u">
select * from taousers
</cfquery>

<cfloop query="u">
    
    <cfset new_userid = u.userid />
    
<cfquery datasource="#dsn#" name="x">
SELECT * FROM sitetypes_user WHERE userid = #new_userid# AND pnid IS null
</cfquery>

<cfloop query="x">
    
      <cfset new_sitetypeid = x.sitetypeid />
    

<cfquery datasource="#dsn#" name="FIND">
    SELECT * FROM pgpanels_user where userid = #new_userid# and pntitle = '#x.pntitle#' and pnfilename = 'mylinks_user.cfm'
</cfquery>
    
  

    <cfif #find.recordcount# is "0">
        <cfquery datasource="#dsn#" name="last">
        select pnorderno from pgpanels_user where userid = #new_userid# order by pnorderno desc limit 1
        
        </cfquery>
        
        <cfif #last.recordcount# is "1">
            
            <cfset new_pnorderno = numberformat(last.pnorderno) + 1 />
        <cfelse>
            
            <cfset new_pnorderno = 1 />
        </cfif>
        
        <cfquery datasource="#dsn#" name="insert" result="result">
      
            INSERT INTO `pgpanels_user_tbl` (`userid`,`pnTitle`, `pnFilename`, `pnOrderNo`, `pnColXl`, `pnColMd`, `pnDescription`,`IsVisible`)
            VALUES
            (#new_userid#,'#x.pntitle#', 'mylinks_user.cfm', #new_pnorderno#, 3, 3, '#x.sitetypedescription#',1);

        </cfquery>
        
           <cfset new_pnid = result.generatedkey>
               
               
        
               <cfquery datasource="#dsn#" name="insert">
      
            update `sitetypes_user` set pnid = #new_pnid# where sitetypeid = #new_sitetypeid#

        </cfquery>
        
        

    </cfif>
    
</cfloop>
 </cfloop>
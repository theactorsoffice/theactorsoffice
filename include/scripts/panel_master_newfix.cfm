<cfset dbug="Y" />

<CFINCLUDE template="/include/remote_load.cfm" />

<cfquery datasource="#dsn#" name="u">
select * from taousers
</cfquery>

<cfloop query="u">
    
    <cfset new_userid = u.userid />
    
<cfquery datasource="#dsn#" name="x">
    SELECT * FROM pgpanels_master 
</cfquery>

<cfloop query="x">

<cfquery datasource="#dsn#" name="FIND">
    SELECT * FROM pgpanels_user where userid = #new_userid# and pnFilename = '#x.pnFilename#' 
</cfquery>

    <cfif #find.recordcount# is "0">
        <cfquery datasource="#dsn#" name="insert">
      
            INSERT INTO `pgpanels_user_tbl` (`userid`,`pnTitle`, `pnFilename`, `pnOrderNo`, `pnColXl`, `pnColMd`, `pnDescription`,`IsVisible`)
            VALUES
            (#new_userid#,'#x.pntitle#', '#x.pnfilename#', #x.pnOrderNo#, #x.pnColXl#, #x.pnColMd#, '#x.pnDescription#',1);

        </cfquery>

    </cfif>
    
</cfloop>
 </cfloop>
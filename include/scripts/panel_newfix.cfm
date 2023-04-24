<cfset dbug="Y" />

<CFINCLUDE template="/include/remote_load.cfm" />

<cfquery datasource="#dsn#" name="a">
    delete from pgpanels_master
</cfquery>


<cfquery datasource="#dsn#" name="x">
    SELECT * FROM pgpanels WHERE PNFILENAME <> 'mylinks_user.cfm'
</cfquery>

<cfloop query="x">


    <cfset new_pntitle=x.pntitle />
    <cfset new_pnfilename=x.pnfilename />
    <cfset new_pnOrderNo=x.pnOrderNo />
    <cfset new_pnColXl=x.pnColXl />
    <cfset new_pnColMd=x.pnColMd />
    <cfset new_pnDescription=x.pnDescription />

    <cfquery datasource="#dsn#" name="Find">
        Select * from pgpanels_master where pntitle = '#new_pntitle#' and isdeleted = 0
    </cfquery>

    <cfif #find.recordcount# is "0">
        <cfquery datasource="#dsn#" name="insert">
      
            INSERT INTO `pgpanels_master` (`pnTitle`, `pnFilename`, `pnOrderNo`, `pnColXl`, `pnColMd`, `pnDescription`)
            VALUES
            ('#new_pntitle#', '#new_pnfilename#', #new_pnOrderNo#, #new_pnColXl#, #new_pnColMd#, '#new_pnDescription#');



        </cfquery>

    </cfif>
</cfloop>
 
<CFINCLUDE template="/include/remote_load.cfm" />

<cfquery datasource="#dsn#" name="x">
SELECT DISTINCT pgdir FROM pgpages WHERE pgdir <> '';
</cfquery>


    <cfloop query="x">
 
        
        <cfquery datasource="#dsn#" name="update">
            update pgfiles
            set filestatus = 'Confirmed'
            where id = '/app/#x.pgdir#/index.cfm'
and filestatus = 'Found'
</cfquery>
            
            

    </cfloop>
       
                
                
                
                
    
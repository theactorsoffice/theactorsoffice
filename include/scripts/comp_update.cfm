<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="menuordermax"    maxrows="1"  >            
select menuorder from pgcomps order by menuorder desc
</cfquery>

<cfset n = menuordermax.menuorder />

<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="x"      >
SHOW TABLE STATUS
</cfquery>
    
<cfloop query="x">
    
    <cfoutput>
        
    <cfset n = #n# + 1 />
        
    </cfoutput>
    
    <cfset pgdir = x.name />         
     
    <cfset pgname = x.comment />        
  
    <cfset pgTitle = x.comment />      
        
    <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="findtable"      >            
    select * from pgcomps where comptable = '#pgdir#'
    </cfquery>

    <cfif #findtable.recordcount# is "0" >
                
        <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="findkey"      >  
        SHOW full COLUMNS FROM #pgdir# WHERE COMMENT = 'id'
        </cfquery>

        <cfoutput>

        SHOW full COLUMNS FROM #pgdir# WHERE COMMENT = 'id'<BR>

        </cfoutput>
        
        <cfif #findkey.recordcount# is "0" >
            
            <CFOUTPUT>
            No key for #pgdir#!<br>
            </CFOUTPUT>
            
        <cfelse>
                
            <cfoutput>

            <cfset pk = "#findkey.field#" />

            <cfset compName = "#pgname#" />

            <cfset appid = 1 />

            <cfset compowner = "U" />

            <cfset menuyn = "N" />

            <cfset compdir = "#pgdir#" />  

            <cfset menuorder = "#n#" />

            <cfset comptable = "#pgdir#" />    

            <cfset comprecordname = "#pgname#" />

            <h1>Adding #pgname# as a comp</h1>

            table: #pgdir#<BR> 

            compname = #pgname#<BR>  

            table title: #pgname#<BR>

            </cfoutput>

            <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="Insert"    result="result"   >              
            Insert into pgcomps (compName,appid,compowner,menuYN,compdir,menuorder,comptable,compRecordname)
            values('#compName#',#appid#,'#compowner#','#menuYN#','#compdir#',#menuorder#,'#comptable#','#compRecordname#')
            </cfquery>

            <cfset Newcompid = result.generatedkey>   

            <cfloop list="Details,Results" index="pgtype">  

                <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="InsertPages"    result="result"   >         
                INSERT INTO `pgpages` (`pgName`, `compID`, `pgDir`, `pgTitle`, `pgHeading`, `pgFilename`, `datatables_YN`, `fullcalendar_YN`, `editable_YN`, `newdatatables_YN`, `corefile`, `pgtype`, `pk`) 
                VALUES
                ( '#compname# #pgtype#', #newcompid#, '#pgdir#-#pgtype#', '#compname#','#compname#',  '#pgtype#.cfm', 'Y', 'Y', 'Y', 'Y',   '#pgtype#.cfm','#pgtype#','#pk#')        
                </cfquery>           

            </cfloop>
                        
        </cfif>
                 
    </cfif>    
                
</cfloop>
    
 
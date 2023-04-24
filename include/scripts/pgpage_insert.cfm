      <CFINCLUDE template="/include/remote_load.cfm" />  

 
<cfquery datasource="#dsn#" name="x"       >         
SELECT 
appID	,
compActive	,
compDir	,
compIcon	,
compID	,
compInner	,
compName	,
compOwner	,
compRecordName	,
compTable	,
IsDeleted	,
menuOrder	,
menuYN	
 from pgcomps WHERE compid = 65;    
</cfquery>  


<cfloop query="x">
<cfoutput>#x.compname#<BR></cfoutput>
    <cfset compname = x.compname />
    
    <cfset newcompid = x.compid />
    
    <cfset pgdir = x.compdir />
    
    
<cfquery datasource="#dsn#" name="findkey"      >  
        SHOW full COLUMNS FROM #x.comptable# WHERE COMMENT = 'id'
        </cfquery>

 
        
        <cfif #findkey.recordcount# is "0" >
            
            <CFOUTPUT>
            No key for #pgdir#!<br><cfabort>
            </CFOUTPUT>
            
        <cfelse>
                
            <cfoutput>

            <cfset pk = "#findkey.field#" />
                
            </cfoutput>
            
            </cfif>
                
                
                

<cfloop list="Details,Results" index="pgtype">  

          
      <cfquery datasource="#dsn#" name="InsertPages"    result="result"   >         
                INSERT INTO `pgpages` (`pgName`, `compID`, `pgDir`, `pgTitle`, `pgHeading`, `pgFilename`, `datatables_YN`, `fullcalendar_YN`, `editable_YN`, `newdatatables_YN`, `corefile`, `pgtype`, `pk`) 
                VALUES
                ( '#compname# #pgtype#', #newcompid#, '#pgdir#-#pgtype#', '#compname#','#compname#',  '#pgtype#.cfm', 'Y', 'Y', 'Y', 'Y',   '#pgtype#.cfm','#pgtype#','#pk#')        
                </cfquery>           

            </cfloop>
    
    
    </cfloop>

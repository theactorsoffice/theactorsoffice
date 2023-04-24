
<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="x"      >
SELECT p.pgid,p.pgName, c.compname, c.comptable FROM pgpages p inner join pgcomps c ON c.compID = p.compid 
    where   p.pk <> '' and c.compactive = 'Y'   
</cfquery>
    <cfloop query="x">
        

        
            <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="y"      >
        Select fieldid FROM pgfields 
                
                where pgid = #x.pgid# 
                
                order by fieldid
        </cfquery>
        
        <cfset n = 0>  
            
            
            
        <cfloop query="y">
        
        
        <cfoutput>
            <cfset n = #n# + 1 />
            </cfoutput>
            
            
  <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="z"      >          
        update pgfields
      set displayorder = #n#
      where fieldid = #y.fieldid#
            </cfquery>
        </cfloop>
    
    </cfloop>
    
   
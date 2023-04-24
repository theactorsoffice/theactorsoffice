
<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="x"      >
SELECT p.pgid,p.pgName, c.compname, c.comptable FROM pgpages p inner join pgcomps c ON c.compID = p.compid 
    where   p.pk <> '' and c.compactive = 'Y'  AND c.compid = 131;
</cfquery>
    <cfloop query="x">
        
    <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="delete"      >
delete from pgfields where pgid = #x.pgid#
</cfquery>
        
            <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="y"      >
        SHOW full COLUMNS FROM #x.comptable#
        </cfquery>
        
        <cfset n = 0>  
        <cfloop query="y">
        
        
        <cfoutput>
            <cfset n = #n# + 1 />
            
            
            <cfset fname = "#y.field#" />
            
            <cfif #n# is "1" >
            <cfset key = "pk" >
                <cfset update_yn = "N" />
                <cfset ftype = "#y.type#" />
                <cfelse>
                     <cfset ftype = "#y.type#" />
                      <cfset update_yn = "Y" />
                    </cfif>
                
                
                <cfif #fname# is "userid" >
                <cfset update_yn = "N" />
                    <cfset key = "fk" />
            </cfif>
           
            <cfset updatename = "#y.comment#" />
            
            
            
            </cfoutput>
        
              <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="INSERT"      >
        Insert into pgfields (fname,pgid,ftypefull,update_yn,updatename) values ('#fname#',#x.pgid#,'#ftype#','#update_yn#','#updatename#')
        </cfquery>
            
            
            
        
        </cfloop>
    
    </cfloop>
    
                    <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="z"      >
            SELECT p.fieldid, p.fname,x.ftype AS ftype_new, x.updatetype AS updatetypenew, x.update_yn AS update_ynnew 

FROM ftypexref X

INNER JOIN pgfields p ON p.ftypefull = x.ftypefull
            
            </cfquery>
            
            <cfloop  query="z">
                
              
                  <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="a"      >
           update pgfields

set ftype = '#trim(z.ftype_new)#'
                      ,updatetype = '#z.updatetypenew#'
                      
                      <cfif #z.update_ynnew# is "N">
                      ,update_yn = '#z.update_ynnew#'
                      
                      </cfif>
                      
                      where fieldid = #z.fieldid#
            
            </cfquery>
            
            </cfloop>
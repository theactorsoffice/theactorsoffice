
    
                    <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="z"      >
            SELECT pg.pgname,p.fieldid, p.fkey,p.updatetype,p.fname,x.ftype AS ftype_new, x.updatetype AS updatetypenew, x.update_yn AS update_ynnew 

FROM ftypexref X

INNER JOIN pgfields p ON p.ftypefull = x.ftypefull

INNER JOIN pgpages pg ON pg.pgid =p.pgid

WHERE p.updatetype = '0.0' AND p.fkey IS NULL AND p.fname <> 'isdeleted'
            
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
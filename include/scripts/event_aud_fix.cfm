 <CFINCLUDE template="/include/remote_load.cfm" />

         <cfquery datasource="#dsn#" name="x"  >
SELECT e.eventid,e.eventtitle,a.audid

FROM events e 

INNER JOIN auditions a ON a.audStartDate = e.eventstart

WHERE a.audStartTime = e.eventStartTime AND e.eventtypename = 'Audition'

AND a.userid = e.userid

AND e.audid IS NULL
AND a.isDeleted = 0
        </cfquery>

        <cfloop query="x">
            
            
              
                 <cfquery datasource="#dsn#" name="insert"  >
                    update events
                     set audid = #x.audid#
                     where eventid = #x.eventid#
                     
                </cfquery>
                     
 <cfoutput>#x.eventid# updated<BR></cfoutput>

        </cfloop>

 
        
        
        
        
        
        
        
        
        
        
        
        
        
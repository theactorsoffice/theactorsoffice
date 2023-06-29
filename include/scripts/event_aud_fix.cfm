 <CFINCLUDE template="/include/remote_load.cfm" />

         <cfquery datasource="#dsn#" name="x"  >
SELECT e.eventid,e.eventtitle,a.eventid

FROM events e 

INNER JOIN events a ON a.eventStart = e.eventstart

WHERE a.eventStartTime = e.eventStartTime AND e.eventtypename = 'Audition'

AND a.userid = e.userid

AND e.eventid IS NULL
AND a.isDeleted = 0
        </cfquery>

        <cfloop query="x">
            
            
              
                 <cfquery datasource="#dsn#" name="insert"  >
                    update events
                     set eventid = #x.eventid#
                     where eventid = #x.eventid#
                     
                </cfquery>
                     
 <cfoutput>#x.eventid# updated<BR></cfoutput>

        </cfloop>

 
        
        
        
        
        
        
        
        
        
        
        
        
        
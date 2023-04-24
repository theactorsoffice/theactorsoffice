         <CFINCLUDE template="/include/remote_load.cfm" />


<cfquery datasource="#dsn#" name="update"  >
UPDATE funotifications SET notstatus = 'Pending' WHERE notstatus IN ('Active','Future')
         </cfquery>

<cfquery datasource="#dsn#" name="x"  >
   SELECT DISTINCT f.suid 
                
                FROM funotifications n

                INNER JOIN fusystemusers f ON f.suID = n.suID

                INNER JOIN fusystems s ON s.systemID = f.systemID

                INNER JOIN fuactions a ON a.actionID = n.actionID
                
                INNER JOIN actionusers au ON a.actionID = au.actionID

                INNER JOIN fuActionLinks l on l.actionlinkid = a.actionlinkid
                
                INNER JOIN notstatuses ns on ns.notstatus = n.notStatus
                
                WHERE au.userid = f.userid and n.notstatus IN ('Active','Pending','Future')
                
                ORDER BY f.suid
</cfquery>
<cfloop query="x">
    
    <cfset new_suid = x.suid/>
    
    
    <cfoutput>
    
    
    <h2>#new_suid#</h2>
    
    
    
    </cfoutput>
    
    <cfquery datasource="#dsn#" name="y"  >
                    SELECT
                f.suid, n.notID,n.notstatus,n.notstartdate, au.actionDaysNo, au.actionid, n.notnotes
                
                
                FROM funotifications n

                INNER JOIN fusystemusers f ON f.suID = n.suID

                INNER JOIN fusystems s ON s.systemID = f.systemID

                INNER JOIN fuactions a ON a.actionID = n.actionID
                
                INNER JOIN actionusers au ON a.actionID = au.actionID

                INNER JOIN fuActionLinks l on l.actionlinkid = a.actionlinkid
                
                INNER JOIN notstatuses ns on ns.notstatus = n.notStatus
                
 WHERE au.userid = f.userid
 
 AND n.notstatus IN ('Pending','Active','Future')
    
    and f.suid = #new_suid#
					 
					 order BY f.suid, au.actiondaysno, au.actionid
    </cfquery>
    
    
    <cfset counter = 0 >
    <cfloop query="y">
    
    <cfset new_notid = y.notid />
        
    <cfset old_notstatus = y.notstatus />
        
    <cfset new_notstatus = 'Pending' />
        
    <cfset new_notnotes = y.notnotes />
        
    <cfoutput><cfset counter = #counter# + 1 />   
    
        
        <cfif #old_notstatus# is not "#new_notstatus#" >
        
        <cfset new_notnotes = "#y.notnotes#[changed status from #old_notstatus# to#new_notstatus#]" />
        
        </cfif>
        </cfoutput> 
    
        <cfif #counter# is "1">
      <cfquery datasource="#dsn#" name="up"  >
          update funotifications
          set notnotes = '#new_notnotes#'
          ,notstatus = 'Pending'
          where notid = #new_notid#
    </cfquery>
        
        <cfelse>
            
                  <cfquery datasource="#dsn#" name="up"  >
          update funotifications
          set notnotes = '#new_notnotes#[Start date changed to NULL]'
          ,notstatus = 'Pending'
          ,notstartdate = NULL
          where notid = #new_notid#
    </cfquery>
        
        
        </cfif>
        
        
    </cfloop>
    
    
    

</cfloop>

 
    <Cfset currentStartDate = "2021-06-01" />
 

    
<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="ta_to_fu"   >
SELECT 
s.recordname
,s.systemid
,e.eventid
,e.eventtitle
,u.suid
,e.contactid
,u.userid
,c.recordname as contactname
 FROM events e
 INNER JOIN fusystemusers u ON u.contactid = e.contactid
 INNER JOIN fusystems s ON s.systemid = u.systemid
 inner join contactdetails c on c.contactid = u.contactid
WHERE e.userid = u.userid
AND e.eventstatus = 'Active'
AND e.eventStart < '#currentStartDate#'
AND s.systemid IN (5,6)
AND u.suStatus = 'Active'
</cfquery>                      
                      
  
<cfif #ta_to_fu.recordcount# is not "0">
    
    <cfloop query="ta_to_fu">
        
    <cfif ta_to_fu.systemid eq 5>
        
        <cfset new_systemid = 1 />
            
    <cfelse>
            
        <cfset new_systemid = 2 />
        
    </cfif>

    <cfset new_eventtitle = ta_to_fu.eventtitle />
        
    <cfset contactname = ta_to_fu.contactname />

    <cfset new_contactid = ta_to_fu.contactid />

    <cfset new_event_id = ta_to_fu.eventid />
        
      <cfset old_systemname = ta_to_fu.recordname />

    <cfset new_suid = ta_to_fu.suid />

    <cfset new_userid = ta_to_fu.userid />

    <Cfset new_suEndDate = DateFormat(Now(),'YYYY-MM-DD') />
        
    <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="update_event"   >       
    UPDATE events
    SET eventstatus = 'Completed'
        
    where eventid = #new_event_id#
    </cfquery>
        
        <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="INSERT"   >
INSERT INTO `notifications_tbl` (`userid`, `notifUrl`, `notiftitle`, `notifDescript`, `read`, `trash`, `notifType`, `contactid`, `senderID`, `isDeleted`, `subtitle`) 
            
VALUES (#new_userid#,  '/app/contact/?contactid=#new_contactid#&t4=1', 'System Completed for #contactname#: #old_systemname#', '', b'0', b'0', 'System Added', #New_contactid#, b'0', b'0','#old_systemname#');
</cfquery>	
            
        
        
        

    <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="update_suid"   >       
    UPDATE fusystemusers
    SET sustatus = 'Completed'
    ,suEndDate = '#new_suEndDate#'
    ,suNotes = 'System automatically completed due to meeting:  #new_eventtitle#'
    where suid = #new_suid#
    </cfquery>   
        
    <cfoutput>
    
    <Cfset new_suStartDate = "#DateFormat(Now(),'yyyy-mm-dd')#"/>

    </cfoutput>

    <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="addSystem"    result="result">
    INSERT INTO fuSystemUsers (systemID,contactID,userID,suStartDate)
    VALUES (#new_systemid#,#new_contactID#,#new_userid#,'#currentStartDate#')
    </cfquery> 

    <cfset New_SUID = result.generatedkey>
        
    <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="details"    >    
        select recordname from fusystems where systemid = #new_systemid#
        </cfquery>
    <cfset new_systemname = details.recordname />
        
                <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="INSERT"   >
INSERT INTO `notifications_tbl` (`userid`, `notifUrl`, `notiftitle`, `notifDescript`, `read`, `trash`, `notifType`, `contactid`, `senderID`, `isDeleted`, `subtitle`) 
            
VALUES (#new_userid#,  '/app/contact/?contactid=#new_contactid#&t4=1', 'System Added for #contactname#: #new_systemname#', '', b'0', b'0', 'System Added', #New_contactid#, b'0', b'0','#new_systemname#');
</cfquery>	
        
    <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="addDaysNo"   >
    SELECT
     s.systemID
    ,s.systemName
    ,s.SystemType
    ,s.SystemScope
    ,s.SystemDescript
    ,s.SystemTriggerNote
    ,a.actionID
    ,a.actionNo
    ,a.actionDetails
    ,a.actionTitle
    ,a.navToURL
    ,au.actionDaysNo
    ,au.actionDaysRecurring
    ,a.actionNotes
    ,a.actionInfo
    ,a.IsUnique
    FROM fusystems s
    INNER JOIN fuactions a ON s.systemid = a.systemid
        INNER JOIN actionusers au on au.actionid = a.actionid
    WHERE a.systemID = '#new_systemid#'
    and au.actionDaysNo is NOT null
         and au.userid = #session.userid#
    ORDER BY a.actionNo
    </cfquery>
    
    <cfloop query="addDaysNo" >
            
        <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="checkUnique"   >
        SELECT a.actionID       

        FROM funotifications n

                INNER JOIN fusystemusers f ON f.suID = n.suID

                INNER JOIN fusystems s ON s.systemID = f.systemID

                INNER JOIN fuactions a ON a.actionID = n.actionID

                INNER JOIN fuActionLinks l on l.actionlinkid = a.actionlinkid

        WHERE f.contactID = #new_contactid# 
            AND a.IsUnique = 1 
            AND a.ActionTitle = '#addDaysNo.actionTitle#'
            AND a.isUnique = #adddaysNo.IsUnique#

        LIMIT 1
        </cfquery>
        
    
        <cfif #checkunique.recordcount# is "0" >
 
            <!-- for every action, calculate the start date based on the actionDaysNo field and the current date -->
            
            <cfset notstartdate = dateAdd('d', actionDaysNo, currentstartdate)   />
            
            <cfif notstartdate lte currentstartdate >
            
                <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="addNotification"    result="result">
                    INSERT INTO funotifications (actionid,userid,suID,notstartdate)
                    VALUES (#addDaysNo.actionID#,#new_userid#,#new_suid#,'#DateFormat(currentstartdate,'yyyy-mm-dd')#')
                </cfquery>  
                
            <cfelse>
          
                <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="addNotification"    result="result">
                    INSERT INTO funotifications (actionid,userid,suID,notstartdate,notstatus)
                    VALUES (#addDaysNo.actionID#,#new_userid#,#new_suid#,'#DateFormat(currentstartdate,'yyyy-mm-dd')#','Pending')
                </cfquery> 
            
            </cfif>
                
        </cfif>
           
    </cfloop>

</cfloop>
    
</cfif>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
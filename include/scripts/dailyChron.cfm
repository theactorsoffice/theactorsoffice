<cfif isdefined('cookie.mocktoday') >
    
    <Cfset currentStartDate = "#DateFormat(COOKIE.mocktoday,'YYYY-MM-DD')#" />
    
<cfelse>
    
    <Cfset currentStartDate = "#DateFormat(Now(),'YYYY-MM-DD')#" />
    
</cfif>
<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="a"      >         
 SELECT  c.recordname as contactname
    ,n.notid
    ,u.userid
    ,c.contactid
    ,DATEDIFF(n.notStartDate,CURDATE() ) AS days_late
    FROM funotifications n
        INNER JOIN fusystemusers u ON u.suID = n.suid 
        INNER JOIN contactdetails c ON c.contactid = u.contactid
    WHERE n.notstatus = 'Active' 
    and u.suStatus = 'Active'
    and n.isPastDue = 0 
    and n.notStartDate >= DATE_ADD(NOW(), INTERVAL 1 DAY)   
    </cfquery>
    
    
<cfloop query="a">
    
    <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="INSERT"   >
INSERT INTO `notifications_tbl` (`userid`, `notifUrl`, `notiftitle`, `notifDescript`, `read`, `trash`, `notifType`, `contactid`, `senderID`, `isDeleted`, `subtitle`) 
            
VALUES (#a.userid#,  '/app/contact/?contactid=#a.contactid#&t4=1', 'Reminder #a.days_late# day(s) Overdue', '', b'0', b'0', 'System Added', #a.contactid#, b'0', b'0','Reminder #a.days_late# day(s) Overdue for #a.contactname#');
</cfquery>	
 
<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="update"      >  
    UPDATE funotifications
    set isPastdue=1
    where notid = #a.notid#
    </cfquery>
</cfloop>
    
    
    <cfabort>
    
<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="x"      >
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
,n.notid
,n.suid
,n.notStartDate
,n.notstatus
,u.userid
    ,u.contactid
,c.recordname
FROM fusystems s


       
INNER JOIN fuactions a ON s.systemid = a.systemid
    
INNER JOIN actionusers au on au.actionid = a.actionid
inner join funotifications n on n.actionid = a.actionid

INNER JOIN fusystemusers u ON u.systemid = s.systemID
INNER JOIN contactdetails c on c.contactid = u.contactid
WHERE u.suid = n.suid
AND u.userid = n.userid

AND n.notstatus = 'Future'
AND n.notstartdate <= '#currentStartDate#'
     and au.userid = #session.userid#
ORDER BY n.notstartdate desc

</cfquery>
    

    
    
    
    <cfif #x.recordcount# is not "0">
    
    
    
    <cfloop query="x">
        
    <cfset new_notid = x.notid />
        <cfset new_userid = x.userid />
        
        
        <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="FindUser"  >
    SELECT
    u.userid
    ,u.userFirstName
    ,u.userLastName
    ,u.userEmail
    ,u.contactid
    ,u.userRole
    ,u.contactid AS userContactID
    FROM taousers u
    WHERE u.userid = #new_userid#
</cfquery>
        
 

        
        
 <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="update_not"      > 
UPDATE funotifications
     set notstatus = 'Active'
     where notid = #new_notid#
</cfquery>
 
<cfoutput>
<cfset pgid = 0 />  
<cfset loginname  = "#FindUser.userFirstName# #FindUser.userLastName#" />
<cfset OldValue = "Future" />
<cfset NewValue = "Active" />
<cfset Recordname = "#x.actionTitle#" />
<cfset contactname = "#x.recordname#" />
<cfset updatename = "Status" />
<cfset recid = "#new_notid#" />
<cfset compid = "19" />
<cfset userid = "#session.userid#" />
<cfset actiontitle = "#x.actiontitle#" />
<cfset updatedetails = "<span style='color: ##406E8E;font-weight:400;'>#oldvalue#</span> to <span style='color: ##406E8E;font-weight:400;'>#newvalue#</span>" />

</cfoutput>    
        
        
        
        
        


<Cfif #oldvalue# is "">
                
    <cfset oldvalue = "NULL" />
            
</Cfif>
            
<Cfif #newvalue# is "">
    
    <cfset newvalue = "NULL" />
    
</Cfif>
            
<cfset logDetails = "Changed #loginname# #updatename# from [#oldvalue#] to [#newvalue#] automatically." />

<cfif NOT isnumeric(compid)>
    
<cfset comp_id = 0>
    
</cfif>
    
    <cfif NOT isnumeric(recid)>
        
<cfset recid = 0>
    
</cfif>
        
        <cfif NOT isnumeric(pgid)>
            
<cfset pgid = 0>
    
</cfif>

        <cfoutput>      
    
      <cfset updatedetails = "<span style='color: ##406E8E;font-weight:400;'>#oldvalue#</span> to <span style='color: ##406E8E;font-weight:400;'>#newvalue#</span>" />
            </cfoutput>  
            
        <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="INSERT"   >	
    INSERT INTO updatelog (oldValue,NewValue,recordname,updatename,recid,compid,userid,updatedetails,updatesource)
    VALUES (<Cfqueryparam value="#oldvalue#" cfsqltype="CF_SQL_VARCHAR" />,
        <Cfqueryparam value="#newvalue#" cfsqltype="CF_SQL_VARCHAR" />,
        <Cfqueryparam value="#recordname#" cfsqltype="CF_SQL_VARCHAR" />,
        <Cfqueryparam value="#updatename#" cfsqltype="CF_SQL_VARCHAR" />,
        <Cfqueryparam value="#recid#" cfsqltype="CF_SQL_INTEGER" />,
        <Cfqueryparam value="#compid#" cfsqltype="CF_SQL_INTEGER" />,
        <Cfqueryparam value="#userid#" cfsqltype="CF_SQL_INTEGER" />,
        <Cfqueryparam value="#updatedetails#" cfsqltype="CF_SQL_VARCHAR" />
        ,
        <Cfqueryparam value="Daily Chron" cfsqltype="CF_SQL_VARCHAR" />)
    </cfquery>	
    
            
<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="INSERT"   >
INSERT INTO `notifications_tbl` (`userid`, `notifUrl`, `notiftitle`, `notifDescript`, `read`, `trash`, `notifType`, `contactid`, `senderID`, `isDeleted`, `subtitle`) 
            
VALUES (#userid#,  '/app/contact/?contactid=#contactid#&t4=1', 'System added for #contactname#', '#updatedetails#', b'0', b'0', 'System Added', #contactid#, b'0', b'0','#actiontitle#');
</cfquery>	
            
            

        
        
        
        
    </cfloop>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    </cfif>
    
    
    <!-- Appointments closed with open target systems -->
    
    
    
<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="ta_to_fu"   >
SELECT * FROM events
WHERE eventstatus = 'Active'
AND eventStart < '2021-05-20'
AND contactid IN (SELECT contactid FROM fusystemusers 
                    WHERE  sustatus='Active' 
                    AND systemid IN (5,6))    
</cfquery>   
    
    <cfif #ta_to_fu.recordcount# is not "0">
<cfloop query="ta_to_fu">
    
   
    <cfset new_contactid = ta_to_fu.contactid />
    <cfset new_event_id = ta_to_fu.eventid />
 
    
    
    
    
    </cfloop>
    
    
    </cfif>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
     
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
            
VALUES (#new_userid#,  '/app/contact/?contactid=#new_contactid#&t4=1', 'System Added for #contactname#', '', b'0', b'0', 'System Added', #New_contactid#, b'0', b'0','#new_systemname#');
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
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
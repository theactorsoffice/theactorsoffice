
    
    <Cfset currentStartDate = "#DateFormat(Now(),'yyyy-mm-dd')#" />

   <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="del"   >  
update funotifications_tbl 
SET isdeleted = 1 
where isdeleted = 0  and suid NOT IN (SELECT suid FROM fusystemusers)
</cfquery>
<cfparam name="systemID"   default="0" />
    
 <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="FindUser"   >
SELECT
u.userid
,u.userFirstName
,u.userLastName
,u.userEmail
,u.userRole
FROM taousers u
WHERE u.userid = #new_userid#
</cfquery>

<cfoutput>
    
    <Cfset suStartDate = "#DateFormat(Now(),'yyyy-mm-dd')#"/>

</cfoutput>

<!-- Add a fuSystemUsers record - attach a user to a system  -->

 <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="addSystem"    result="result">
INSERT INTO fuSystemUsers (systemID,contactID,userID,suStartDate)
VALUES ('#systemID#',#contactID#,#new_userid#,'#suStartDate#')
</cfquery> 

    <cfset NewSUID = result.generatedkey>
        
<!-- Select all of the actions of that system  -->
        
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
WHERE a.systemID = '#systemID#'
    and au.actionDaysNo is NOT null
     and au.userid = #new_userid#
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
        
            WHERE f.contactID = #contactid# 
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
                    VALUES (#addDaysNo.actionID#,#new_userid#,#NewSuid#,'#DateFormat(notstartdate,'yyyy-mm-dd')#')
                </cfquery>  
                
            <cfelse>
          
                 <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="addNotification"    result="result">
                    INSERT INTO funotifications (actionid,userid,suID,notstartdate,notstatus)
                    VALUES (#addDaysNo.actionID#,#new_userid#,#NewSuid#,'#DateFormat(notstartdate,'yyyy-mm-dd')#','Pending')
                </cfquery> 
            
            </cfif>
                
        </cfif>
           
        </cfloop>
   
    
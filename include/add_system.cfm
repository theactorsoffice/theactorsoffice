<CFINCLUDE template="/include/remote_load.cfm" />
<cfparam name="add_count"   default="0" />
<cfparam name="systemID"   default="0" />
<cfparam name="mode"   default="0" />
<Cfset suStartDate = dateFormat(Now(),'yyyy-mm-dd') />

<Cfset currentStartDate = dateFormat(Now(),'yyyy-mm-dd') />

<cfquery datasource="#dsn#" name="del"   >  
update funotifications_tbl 
SET isdeleted = 1 
where isdeleted = 0  and suid NOT IN (SELECT suid FROM fusystemusers)
</cfquery>

    
<cfquery datasource="#dsn#" name="FindUser"   >
SELECT
u.userid
,u.userFirstName
,u.userLastName
,u.userEmail
,u.userRole
FROM taousers u
WHERE u.userid = #userid#
</cfquery>
 
    

 
<!-- Add a fuSystemUsers record - attach a user to a system  -->

<cfquery datasource="#dsn#" name="addSystem"    result="result">
INSERT INTO fuSystemUsers (systemID,contactID,userID,suStartDate)
VALUES ('#systemID#',#contactID#,#userid#,'#suStartDate#')
</cfquery> 

    <cfset NewSUID = result.generatedkey>
        
<!-- Select all of the actions of that system  -->
        
        <h3>adddaysno</h3>
        <cfoutput>
        <p>
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
,a.uniquename
FROM fusystems s
INNER JOIN fuactions a ON s.systemid = a.systemid
    INNER JOIN actionusers au on au.actionid = a.actionid
WHERE s.systemID = #systemid# and au.userid = #userid#
ORDER BY a.actionNo
        
        </p></cfoutput>
        
<cfquery datasource="#dsn#" name="addDaysNo"   >
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
,a.uniquename
FROM fusystems s
INNER JOIN fuactions a ON s.systemid = a.systemid
    INNER JOIN actionusers au on au.actionid = a.actionid
WHERE s.systemID = #systemid# and au.userid = #userid#
ORDER BY a.actionNo
</cfquery>
    
<cfloop query="addDaysNo" >
    <cfset add_action = "Y" />
    
    <cfif #adddaysno.isunique# is "1">
    
    <cfoutput>
             SELECT d.contactid from 
                contactdetails d
                where d.#adddaysno.uniquename# = 'Y'
                and d.contactid = #contactid# limit 1<BR>
 </cfoutput>
            
            <cfquery datasource="#dsn#" name="checkUnique"   >
            SELECT d.contactid from 
                contactdetails d
                where d.#adddaysno.uniquename# = 'Y'
                and d.contactid = #contactid# limit 1
            </cfquery>
        
        <cfif #checkunique.recordcount# is "1">
        <cfset #add_action# = "N" >
        <cfoutput>#adddaysno.actionid# - #adddaysno.actiontitle# not added<BR></cfoutput>
        </cfif>
        
           </cfif>
        
        <cfif #add_action# is "Y" >
 
            <!-- for every action, calculate the start date based on the actionDaysNo field and the current date -->
            
            <cfset notstartdate = dateAdd('d', actionDaysNo, currentstartdate)   />
            
            <cfif notstartdate lte currentstartdate >
            
                <cfquery datasource="#dsn#" name="addNotification"    result="result">
                    INSERT INTO funotifications (actionid,userid,suID,notstartdate,notstatus)
                    VALUES (#addDaysNo.actionID#,#userid#,#NewSuid#,'#DateFormat(notstartdate,'yyyy-mm-dd')#','Pending')
                </cfquery>  
                <cfoutput>
                <cfset add_count = #add_count# + 1 />
                </cfoutput>
                <cfset new_notid = result.generatedkey>
                <cfif add_count gt 1>
                   <cfquery datasource="#dsn#" name="update"  >
                       update funotifications
                       set notstatus = 'Pending'
                       ,notstartdate = NULL
                       where notid = #new_notid#
                       </cfquery> 
           
                    
                </cfif>
            <cfelse>
          
                <cfquery datasource="#dsn#" name="addNotification"    result="result">
                    INSERT INTO funotifications (actionid,userid,suID,notstartdate,notstatus)
                    VALUES (#addDaysNo.actionID#,#userid#,#NewSuid#,'#DateFormat(notstartdate,'yyyy-mm-dd')#','Pending')
                </cfquery> 
            <cfoutput>
                <cfset add_count = #add_count# + 1 />
                </cfoutput>
                <cfset new_notid = result.generatedkey>
                <cfif add_count gt 1>
                   <cfquery datasource="#dsn#" name="update"  >
                       update funotifications
                       set notstatus = 'Pending'
                       ,notstartdate = NULL
                       where notid = #new_notid#
                       </cfquery> 
           
                    
                </cfif>
            
            </cfif>
                
        </cfif>
           
        </cfloop>
                
    
    <cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" /><cfinclude template="/include/bigbrotherinclude.cfm" /> 
                
                <cfif #mode# is "0">

<cflocation url="/app/contact/?contactid=#contactid#&t4=1" />
                    
                    </cfif>


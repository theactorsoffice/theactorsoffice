<Cfset currentStartDate="#DateFormat(Now(),'yyyy-mm-dd')#" />     
 
 

<cfparam name="hide_completed" default="N" />


 

 



<cfquery datasource="#dsn#" name="notsActive">
                SELECT
                n.notID
                ,n.actionID
                ,n.userID
                ,n.suID
                ,n.notTimeStamp
                ,n.notStartDate
                ,n.notEndDate
                ,n.notStatus
                ,n.notNotes
                ,f.systemID
                ,f.contactID
                ,f.suTimeStamp
                ,f.suStartDate
                ,f.suEndDate
                ,f.suStatus
                ,f.suNotes
                ,a.actionID
                ,a.actionNo
                ,a.actionDetails
                ,a.actionTitle
                ,a.navToURL
                ,au.actionDaysNo
                ,au.actionDaysRecurring
                ,a.actionNotes
                ,a.actionInfo
                ,l.actionlinkid
                ,l.BtnName
                ,l.ActionLinkURL
                ,l.endlink
                ,l.targetlink
                ,n.ispastdue
                ,ns.checktype
                ,ns.delstart
                ,ns.delend
                ,ns.status_color
                
                FROM funotifications n

                INNER JOIN fusystemusers f ON f.suID = n.suID

                INNER JOIN fusystems s ON s.systemID = f.systemID

                INNER JOIN fuactions a ON a.actionID = n.actionID
                
                INNER JOIN actionusers au ON a.actionID = au.actionID

                INNER JOIN fuActionLinks l on l.actionlinkid = a.actionlinkid
                
                INNER JOIN notstatuses ns on ns.notstatus = n.notStatus
                WHERE f.contactID = #currentid#
    
                and f.suid = #sysActive.suid#
                
                and au.userid = #session.userid#
    
                and n.notstartdate is not null
                    
                and DATE(n.notstartdate) <= '#DateFormat(Now(),'yyyy-mm-dd')#'
 
    
    <cfif #hide_completed# is "Y">
    
    and n.notstatus not in ('Completed','Skipped')
    </cfif>
ORDER BY FIELD(n.notstatus, 'Pending', 'Completed', 'Skipped'),n.notEndDate
          
            </cfquery>


<cfquery datasource="#dsn#" name="notsInactive">
                SELECT
                n.notID
                ,n.actionID
                ,n.userID
                ,n.suID
                ,n.notTimeStamp
                ,n.notStartDate
                ,n.notEndDate
                ,'Future' as notStatus
                ,n.notNotes
                ,f.systemID
                ,f.contactID
                ,f.suTimeStamp
                ,f.suStartDate
                ,f.suEndDate
                ,f.suStatus
                ,f.suNotes
                ,a.actionID
                ,a.actionNo
                ,a.actionDetails
                ,a.actionTitle
                ,a.navToURL
                ,au.actionDaysNo
                ,au.actionDaysRecurring
                ,a.actionNotes
                ,a.actionInfo
                ,l.actionlinkid
                ,l.BtnName
                ,l.ActionLinkURL
                ,l.endlink
                ,l.targetlink
                ,n.ispastdue
                ,ns.checktype
                ,ns.delstart
                ,ns.delend
                ,ns.status_color
                
                FROM notstatuses ns,funotifications n

                INNER JOIN fusystemusers f ON f.suID = n.suID

                INNER JOIN fusystems s ON s.systemID = f.systemID

                INNER JOIN fuactions a ON a.actionID = n.actionID
                
                INNER JOIN actionusers au ON a.actionID = au.actionID

                INNER JOIN fuActionLinks l on l.actionlinkid = a.actionlinkid
                
 
                WHERE f.contactID = #currentid#
    
                and f.suid = #sysActive.suid#
                
                and au.userid = #session.userid#
    
                and 
    (
    n.notstartdate is NULL OR
    
     
                    
                 DATE(n.notstartdate) >= '#DateFormat(Now(),'yyyy-mm-dd')#')
                
                 and n.notstatus = 'Pending'
    
    and ns.notstatus = 'Future'
    
</cfquery>
 
    
    

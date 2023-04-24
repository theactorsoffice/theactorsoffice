<Cfset currentStartDate="#DateFormat(Now(),'yyyy-mm-dd')#" />     
 



<cfquery datasource="#dsn#" name="notsActive" maxrows="10">
SELECT s.Systemtype
                ,n.notID
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
                ,c.recordname
                
                FROM funotifications n

                INNER JOIN fusystemusers f ON f.suID = n.suID

                INNER JOIN fusystems s ON s.systemID = f.systemID

                INNER JOIN fuactions a ON a.actionID = n.actionID
                
                INNER JOIN actionusers au ON a.actionID = au.actionID

                INNER JOIN fuActionLinks l on l.actionlinkid = a.actionlinkid
                
                INNER JOIN notstatuses ns on ns.notstatus = n.notStatus
    
    inner join contactdetails c on c.contactid = f.contactid
    
                WHERE au.userid = #userid#
    
    and c.userid = au.userid
    
                and n.notstartdate is not null
                    
               and DATE(n.notstartdate) <= '#DateFormat(Now(),'yyyy-mm-dd')#'
 
 
    
    and n.notstatus = 'Pending'
 
ORDER BY s.systemtype,n.notstartdate
            </cfquery>

    
    

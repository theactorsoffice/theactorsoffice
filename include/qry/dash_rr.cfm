<CFINCLUDE template="/include/remote_load.cfm" /><cfquery name="r" datasource="#dsn#"   >	
SELECT c.contactid,c.recordname, COUNT(*) AS total_count, n.isPastDue 
FROM funotifications n 
INNER JOIN fusystemusers u ON u.suID = n.suid 
INNER JOIN contactdetails c ON c.contactid = u.contactid
    
INNER JOIN fuactions a ON a.actionID = n.actionID
                
INNER JOIN actionusers au ON a.actionID = au.actionID
    
    
WHERE u.suStatus = 'Active' 
AND n.notStatus = 'Pending'
AND u.userid = #session.userid#
AND au.userid = #session.userid#  
and n.notstartdate is not null
               
and DATE(n.notstartdate) <= '#DateFormat(Now(),'yyyy-mm-dd')#'
    
GROUP BY c.recordname,c.contactid, n.IsPastDue
 
</cfquery>		
    
    
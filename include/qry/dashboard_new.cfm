
<cfquery name="dashboards"  result="dash" maxrows="4">
   SELECT p.pnid, p.pntitle, p.pnColXl, p.pnColMd , p.pnFilename, p.pnorderno as 'new_pnorderno'
   
   FROM pgpanels_user p WHERE p.userid = #userid# and p.isvisible is true
order by p.pnorderno

</cfquery>
    
    
  <cfquery datasource="#dsn#" name="notsActives" >
SELECT count(*) as nots_total
                
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

            </cfquery>  

 <cfif #notsactives.recordcount# is "0">

 <cfset nots_total = 0 />

 <cfelse>

<cfset nots_total = notsActives.nots_total />

</cfif>
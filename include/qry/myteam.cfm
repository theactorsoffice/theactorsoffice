<cfquery name="myteam" datasource="#dsn#"  >	
SELECT d.contactid
,d.recordname as contactname

,d.contactStatus

  
    
FROM contactdetails d


 inner JOIN taousers u ON u.userid = d.userid

 
 WHERE u.userid = #session.userid# AND d.contactStatus = 'Active'
	
and d.contactid in (select contactid from contactitems where valuetext = 'My Team'

and valuecategory = 'Tag')
    
 ORDER BY d.contactfullname
</cfquery>		
<cfquery name="audsources_sel" datasource="#dsn#"  >	
SELECT audsourceid AS id, audsource AS NAME 

FROM audsources

<cfif #myteam.recordcount# is  "0">
    
    WHERE audsource <> 'My Team' 
    
    </cfif>
</cfquery>
    
    


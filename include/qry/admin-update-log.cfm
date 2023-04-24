<cfquery name="results"  >	
SELECT 

u.updateID

,u.oldValue
,u.newValue
,u.updateTimestamp as col1
,u.updateTimestamp as col2
,concat(t.userFirstName," ",t.userLastName) as col3    
,p.compname as col4
,u.recordname as col5
,u.updatename as col6
,u.updateDetails as col7
,u.updateSource
,u.recid
,u.compId
,u.userid

,'Date' as 'head1'    
,'Time' as 'head2'  
,'User' as 'head3'
,'Module' as 'head4'   
,'Record' as 'head5' 
,'Label' as 'head6' 
,'Details' as 'head7'    
 FROM updatelog u
    
inner join taousers t ON t.userid = u.userid
inner join pgcomps p on p.compid = u.compid
WHERE u.userid = #FindUser.Userid#
                                                           
 ORDER BY u.updateid desc
</cfquery>		
 
<CFINCLUDE template="remote_load.cfm" />




 <cfquery name="del" datasource="#dsn#" >	
     Delete from shares
     <CFIF #NEW_USERID# IS NOT "0">
     WHERE USERID = #NEW_USERID#
     </CFIF>
</cfquery>
 
<cfquery name="A" datasource="#dsn#" >	
set group_concat_max_len=15360
</cfquery>

<cfquery name="x" datasource="#dsn#" >	

    Insert into shares
select `d`.`contactID` AS `contactid`,`d`.`contactPhoto` AS `contactphoto`,`d`.`contactFirst` AS `col1`,`d`.`contactLast` AS `col2`,(select `contactitems`.`valueCompany` from `contactitems` where ((`contactitems`.`contactID` = `d`.`contactID`) and (`contactitems`.`valueCategory` = 'Company') and (`contactitems`.`itemStatus` = 'active')) order by `contactitems`.`primary_YN` desc limit 1) AS `col3`,(select `contactitems`.`valueText` from `contactitems` where ((`contactitems`.`valueCategory` = 'Tag') and (`contactitems`.`contactID` = `d`.`contactID`) and (`contactitems`.`itemStatus` = 'Active')) order by `contactitems`.`primary_YN` desc limit 1) AS `col4`,(select `e`.`eventTitle` from ((`contactitems` `i` join `tags_user` `tu` on((convert(`tu`.`tagname` using utf8) = `i`.`valueText`))) join `events` `e` on((`e`.`contactid` = `i`.`contactID`))) where ((`tu`.`userid` = `d`.`userID`) and (`tu`.`tagtype` = 'C') and (`e`.`userID` = `tu`.`userid`) and (`e`.`eventTypeName` in ('Meeting','Audition')) and (`e`.`eventStatus` = 'Completed') and (`e`.`contactid` = `d`.`contactID`)) order by `e`.`eventID` desc limit 1) AS `col5`,(select `e`.`eventStart` from ((`contactitems` `i` join `tags_user` `tu` on((convert(`tu`.`tagname` using utf8) = `i`.`valueText`))) join `events` `e` on((`e`.`contactid` = `i`.`contactID`))) where ((`tu`.`userid` = `d`.`userID`) and (`tu`.`tagtype` = 'C') and (`e`.`userID` = `tu`.`userid`) and (`e`.`eventTypeName` in ('Meeting','Audition')) and (`e`.`eventStatus` = 'Completed') and (`e`.`contactid` = `d`.`contactID`)) order by `e`.`eventID` desc limit 1) AS `col6`,`d`.`contactMeetingLoc` AS `col7`,`d`.`contactMeetingDate` AS `col8`,(select `contactitems`.`valueText` from `contactitems` where ((`contactitems`.`valueCategory` = 'Email') and (`contactitems`.`contactID` = `d`.`contactID`) and (`contactitems`.`itemStatus` = 'Active')) order by `contactitems`.`primary_YN` desc limit 1) AS `col9`,(select `contactitems`.`valueText` from `contactitems` where ((`contactitems`.`valueCategory` = 'Phone') and (`contactitems`.`contactID` = `d`.`contactID`) and (`contactitems`.`itemStatus` = 'Active')) order by `contactitems`.`primary_YN` desc limit 1) AS `col10`,(select group_concat(`n`.`noteDetails` separator ',') from `noteslog` `n` where n.ispublic = 1 and (`n`.`contactID` = `d`.`contactID`)) AS `col11`,`d`.`dateAdded` AS `col12`,`d`.`userID` AS `userid`,left(`u`.`passwordHash`,10) AS `u` from (`contactdetails_tbl` `d` join `taousers` `u` on((`u`.`userID` = `d`.`userID`))) 
    
    where ((`d`.`contactStatus` = 'Active') 
    <CFIF #NEW_USERID# IS NOT "0">
    AND D.USERID = #NEW_USERID#
    </CFIF>
    and (`d`.`IsDeleted` = 0) and (`d`.`contactID` in (select `fusystemusers`.`contactID` from `fusystemusers` where (`fusystemusers`.`systemID` in (3,4))) or `d`.`contactID` in (select `i`.`contactID` from ((`contactitems` `i` join `tags_user` `tu` on((convert(`tu`.`tagname` using utf8) = `i`.`valueText`))) join `events` `e` on((`e`.`contactid` = `i`.`contactID`))) where ((`tu`.`userid` = `d`.`userID`) and (`tu`.`tagtype` = 'C') and (`e`.`userID` = `tu`.`userid`) and (`e`.`eventTypeName` in ('Meeting','Audition')) and (`e`.`eventStatus` = 'Completed')))));
</cfquery>




<cfquery name="z" datasource="#dsn#" >	
SELECT DISTINCT x.contactid, 'Booked' AS topaudstatus, 1 AS priority
FROM  audcontacts_auditions_xref x 
INNER JOIN audprojects p ON p.audprojectID = x.audprojectid
INNER JOIN audroles r ON r.audprojectid = p.audprojectid 
WHERE r.isdeleted = 0 AND p.isDeleted = 0 AND r.isbooked = 1
UNION 


SELECT DISTINCT x.contactid, 'Callback' AS topaudstatus, 2 AS priority
FROM  audcontacts_auditions_xref x 
INNER JOIN audprojects p ON p.audprojectID = x.audprojectid
INNER JOIN audroles r ON r.audprojectid = p.audprojectid 
WHERE r.isdeleted = 0 AND p.isDeleted = 0 AND r.iscallback = 1 AND r.isbooked = 0


UNION 


SELECT DISTINCT x.contactid, 'Audition' AS topaudstatus, 2 AS priority
FROM  audcontacts_auditions_xref x 
INNER JOIN audprojects p ON p.audprojectID = x.audprojectid
INNER JOIN audroles r ON r.audprojectid = p.audprojectid 
WHERE r.isdeleted = 0 AND p.isDeleted = 0 AND r.iscallback = 0 AND r.isbooked = 0
</cfquery>

<cfloop query="z">
    
<cfquery name="updd" datasource="#dsn#" >	  
update shares 
set topaudstatus = '#z.topaudstatus#'
where contactid = #z.contactid# and topaudstatus is null
</cfquery>
    
</cfloop>


 



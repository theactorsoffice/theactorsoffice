<cfinclude template="/include/remote_load.cfm" />


<cfquery name="projectDetails" datasource="#dsn#">
SELECT 
proj.`audprojectID`, 
r.audroleid,
proj.`projName`, 
proj.projDescription,
cat.`audCatName`, 
cat.audcatid,
subcat.`audSubCatName`, 
subcat.audsubcatid,
proj.contactid,
ct.contracttype,
ton.tone, 
net.network,
un.`unionName`,    
c.recordname as castingFullName
FROM audprojects proj 
    INNER JOIN audroles r on r.audprojectid = proj.audprojectid
    LEFT OUTER  JOIN audcontracttypes ct ON ( proj.`contractTypeID` = ct.contracttypeid  )  
	LEFT OUTER  JOIN audsubcategories subcat ON ( proj.`audSubCatID` = subcat.`audSubCatId`  )  
	LEFT OUTER  JOIN audcategories cat ON ( subcat.`audCatId` = cat.`audCatId`  )  
	LEFT OUTER JOIN audtones ton ON ( proj.`toneID` = ton.toneid  )  
	LEFT OUTER JOIN audnetworks net ON ( proj.`networkID` = net.networkid  )  
	LEFT OUTER JOIN contactdetails c on c.contactid = proj.contactid
	LEFT OUTER JOIN audunions un ON ( proj.`unionID` = un.`unionID`  )   
WHERE proj.audprojectID = #audprojectID#
</cfquery>

<cfset audroleid = projectDetails.audroleid />

<cfquery name="roleDetails" datasource="#dsn#">
SELECT 
r.`audroleid`,
r.audprojectid,
r.auddialectid,
r.`audRoleName`, 
r.`charDescription`, 
r.`holdStartDate`, 
r.`holdEndDate`, 
rt.audroletype, 
r.audroletypeid,
di.auddialect,
s.audsource,
r.audsourceid,
r.contactid,
r.payrate,
r.netincome,
r.buyout,
i.incometype,
r.iscallback,
r.isredirect,
r.ispin,
r.isbooked,
c.recordname as contactname

FROM audroles r 
 
	LEFT OUTER JOIN audroletypes rt ON ( r.`audRoleTypeID` = rt.audroletypeid  )  
	LEFT OUTER JOIN auddialects di ON ( r.`audDialectID` = di.auddialectid  )  
    LEFT OUTER JOIN audsources s on (r.audsourceid = s.audsourceid)
    LEFT OUTER JOIN incometypes i on i.incometypeid = r.incometypeid
    LEFT OUTER JOIN contactdetails c on c.contactid = r.contactid
WHERE r.audroleid = #audroleid#
</cfquery>

<cfquery name="events" datasource="#dsn#">
    SELECT
    a.eventid
    FROM events a

    LEFT JOIN audroles r ON r.audroleid = a.audroleid

    LEFT JOIN audprojects p ON p.audprojectID = r.audprojectID
    LEFT JOIN audsources s ON s.audSourceID = r.audSourceID
    LEFT JOIN audtypes t ON t.audtypeid = a.audtypeid
    LEFT JOIN audsteps st ON st.audstepid = a.audstepid
    LEFT JOIN audroletypes rt ON rt.audroletypeid = r.audroletypeid
    WHERE a.isdeleted = 0 and p.isdeleted = 0
    AND r.audroleid = #audroleid#
    and a.eventStart is not null
    ORDER BY a.eventStart
</cfquery>
 
<cfloop query = "events">
    
    <cfset new_eventid = events.eventid />
<cfquery name="del" datasource="#dsn#" >  
update events set isdeleted = 1 where eventid = #new_eventid#
</cfquery>
    
    <cfquery name="del2" datasource="#dsn#" >  
update events_tbl set isdeleted = 1 where eventid = #new_eventid#
</cfquery>
    
    

</cfloop>

<cfquery name="del2" datasource="#dsn#" >  
update audprojects set isdeleted = 1 where audprojectid = #audprojectid#
</cfquery>


<cfquery name="del3" datasource="#dsn#" >  
update audroles set isdeleted = 1 where audroleid = #audroleid#
</cfquery>


      <cflocation url="/app/auditions/" />
    
 

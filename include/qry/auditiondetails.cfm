<CFINCLUDE template="/include/remote_load.cfm" />
<cfparam name="eventid" default="0" />
<cfquery name="auditionDetails" datasource="#dsn#">
SELECT 
a4.`audroleid`,
a.`projName`, 
a.`projDescription`, 
a1.network, 
a2.`audSubCatName`, 
a3.`unionName`, 
a4.`audRoleName`, 
a4.`charDescription`, 
a4.`holdStartDate`, 
a4.`holdEndDate`, 
a5.audroletype, 
a6.auddialect,
ad.*
FROM audprojects a 
	LEFT OUTER JOIN audnetworks a1 ON ( a.`networkID` = a1.networkid  )  
	INNER JOIN audsubcategories a2 ON ( a.`audSubCatID` = a2.`audSubCatId`  )  
	LEFT OUTER JOIN audunions a3 ON ( a.`unionID` = a3.`unionID`  )  
	INNER JOIN audroles a4 ON ( a.`audprojectID` = a4.`audprojectID`  )  
    INNER JOIN events ad on (ad.`audroleid` = a4.`audroleid`)
	LEFT OUTER JOIN audroletypes a5 ON ( a4.`audRoleTypeID` = a5.audroletypeid  )  
	LEFT OUTER JOIN auddialects a6 ON ( a4.`audDialectID` = a6.auddialectid  )  
	 LEFT JOIN audtypes t ON t.audtypeid = ad.audtypeid
WHERE  ad.eventid = #eventid#
</cfquery>
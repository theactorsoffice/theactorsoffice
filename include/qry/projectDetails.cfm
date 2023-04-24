
<CFINCLUDE template="/include/remote_load.cfm" />
<cfquery name="projectDetails" datasource="#dsn#">
SELECT 
proj.`audprojectID`, 
proj.`projName`, 
cat.`audCatName`, 
cat.audcatid,
subcat.`audSubCatName`, 
ct.contracttype,
ton.tone, 
net.network,
un.`unionName`,    
c.recordname as castingFullName



FROM audprojects proj 
    INNER JOIN audcontracttypes ct ON ( proj.`contractTypeID` = ct.contracttypeid  )  
	INNER JOIN audsubcategories subcat ON ( proj.`audSubCatID` = subcat.`audSubCatId`  )  
	INNER JOIN audcategories cat ON ( subcat.`audCatId` = cat.`audCatId`  )  
	LEFT OUTER JOIN audtones ton ON ( proj.`toneID` = ton.toneid  )  
	LEFT OUTER JOIN audnetworks net ON ( proj.`networkID` = net.networkid  )  
	LEFT OUTER JOIN contactdetails c on c.contactid = proj.contactid
	LEFT OUTER JOIN audunions un ON ( proj.`unionID` = un.`unionID`  )   
WHERE proj.audprojectID = #audprojectID#

</cfquery>
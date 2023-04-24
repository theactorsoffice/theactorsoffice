<CFINCLUDE template="/include/remote_load.cfm" />
<cfparam name="audprojectid" default="0" />
<cfquery name="auditionprojectDetails" datasource="#dsn#">
SELECT 
a.audprojectid,
a.projname,
a.projDescription,
a.userid,
a.audSubCatID,
a2.audcatid,
a.unionid,
a.networkID,
a.toneid,
a.contracttypeid,
a.isdeleted,
a.contactid,
a.recordname,
a2.audSubCatName,
ac.audcatname,
ac.audcatid
 
FROM audprojects a 
	LEFT OUTER JOIN audnetworks a1 ON ( a.`networkID` = a1.networkid  )  
	LEFT OUTER JOIN audsubcategories a2 ON ( a.`audSubCatID` = a2.`audSubCatId`  )  
	LEFT OUTER JOIN audunions a3 ON ( a.`unionID` = a3.`unionID`  )  
	LEFT OUTER JOIN audroles a4 ON ( a.`audprojectID` = a4.`audprojectID`  )  
    LEFT OUTER JOIN audcategories ac on ac.audcatid = a2.audcatid
WHERE  a.audprojectid = #audprojectid#
</cfquery>

<cfset new_audcatid = auditionprojectdetails.audcatid />
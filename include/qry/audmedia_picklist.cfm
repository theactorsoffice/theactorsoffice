<CFINCLUDE template="/include/remote_load.cfm" />


 
<cfquery name="audmedia_picklist" datasource="#dsn#">
SELECT 
m.mediaid,
m.mediatypeid,
m.mediaName,
m.mediaLoc,
m.mediaurl,
0 as audid,
m.mediaFilename,
m.mediaExt,
m.userid,
m.mediacreated,
m.isdeleted,
m.isshare,
t.mediaType,
t.isimage,
e.isimage as isValidImage
 FROM audmedia m  
 INNER JOIN audmediatypes t ON t.mediaTypeID = m.mediatypeid
 LEFT JOIN exttypes e on e.mediaext = m.mediaext
 WHERE m.userid = #userid# 
 AND m.isdeleted IS false
 AND t.mediaType <> 'Headshot'
 and m.isshare = 1
 AND m.mediaid NOT IN 
 
 (
 
SELECT 
m.mediaid
 FROM audmedia m  
 inner join audmedia_auditions_xref x on x.mediaid = m.mediaid
 INNER JOIN audmediatypes t ON t.mediaTypeID = m.mediatypeid
 LEFT JOIN exttypes e on e.mediaext = m.mediaext
 WHERE x.audprojectid = #audprojectid# AND m.isdeleted IS false and x.audprojectid <> 0)

 order by t.mediaType, m.mediaName,
</cfquery>

 
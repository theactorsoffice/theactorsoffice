<CFINCLUDE template="/include/remote_load.cfm" />


 
<cfquery name="audmedia" datasource="#dsn#">
SELECT 
m.mediaid,
m.mediatypeid,
m.mediaName,
m.mediaLoc,
m.mediaurl,
m.mediaFilename,
m.mediaExt,
m.userid,
m.mediacreated,
m.isdeleted,
x.audprojectid,
t.mediaType,
t.isimage,
m.isImage,
m.isshare,
e.isimage as isValidImage
 FROM audmedia m  
 inner join audmedia_auditions_xref x on x.mediaid = m.mediaid
 INNER JOIN audmediatypes t ON t.mediaTypeID = m.mediatypeid
 LEFT JOIN exttypes e on e.mediaext = m.mediaext
 WHERE x.audprojectid = #audprojectid# AND m.isdeleted IS false and x.audprojectid <> 0
  AND t.mediaType <> 'Headshot'
</cfquery>

 
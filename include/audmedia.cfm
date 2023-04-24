<CFINCLUDE template="/include/remote_load.cfm" />

<cfparam name="audid" default="0" />
 
<cfquery name="audmedia" datasource="#dsn#">
SELECT 
m.mediaid,
m.mediatypeid,
m.mediaName,
m.mediaLoc,
m.mediaFilename,
m.mediaExt,
m.userid,
m.mediacreated,
m.isdeleted,
m.audid,
t.mediaType,
t.isimage,
m.isImage
 FROM audmedia m  
 INNER JOIN audmediatypes t ON t.mediaTypeID = m.mediatypeid
 WHERE m.audid = #audid# AND m.isdeleted IS false
</cfquery>

 
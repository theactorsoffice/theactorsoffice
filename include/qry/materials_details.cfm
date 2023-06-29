<CFINCLUDE template="/include/remote_load.cfm" />

<cfparam name="userid" default="0" />
 
<cfquery name="materials_details" datasource="#dsn#">
SELECT 
m.mediaid,
m.mediatypeid,
m.mediaName,
m.mediaLoc,
m.mediaurl,
0 as eventid,
m.mediaFilename,
m.mediaExt,
m.userid,
m.mediacreated,
m.isdeleted,
t.mediaType,
t.isimage,
e.isimage as isValidImage,
m.isshare
 FROM audmedia m  
 INNER JOIN audmediatypes t ON t.mediaTypeID = m.mediatypeid
 LEFT JOIN exttypes e on e.mediaext = m.mediaext
 WHERE m.mediaid = #mediaid#
</cfquery>

 
 
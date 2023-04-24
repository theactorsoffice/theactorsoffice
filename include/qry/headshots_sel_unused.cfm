<CFINCLUDE template="/include/remote_load.cfm" />

<cfparam name="userid" default="0" />
 
<cfquery name="headshots_sel" datasource="#dsn#">
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
t.mediaType,

e.isimage as isValidImage
 FROM audmedia m  
 INNER JOIN audmediatypes t ON t.mediaTypeID = m.mediatypeid
 LEFT JOIN exttypes e on e.mediaext = m.mediaext
    WHERE m.userid = #userid# AND m.isdeleted IS false and m.mediatypeid = 1 
    
    and mediaid not in (select mediaid from audmedia_auditions_xref where audprojectid = #audprojectid#)
</cfquery>
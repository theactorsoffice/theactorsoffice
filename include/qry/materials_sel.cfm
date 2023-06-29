<CFINCLUDE template="/include/remote_load.cfm" />

<cfparam name="userid" default="0" />
 
<cfquery name="headshots_sel" datasource="#dsn#">
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
e.isimage as isValidImage
 FROM audmedia m  
 INNER JOIN audmediatypes t ON t.mediaTypeID = m.mediatypeid
 LEFT JOIN exttypes e on e.mediaext = m.mediaext
 WHERE m.userid = #userid# AND m.isdeleted IS false and t.ismaterial = 1 and m.isshare = 1
</cfquery>

 

<cfif #isdefined('adfd')#>
AND e.isimage IS true
</cfif>
<CFINCLUDE template="/include/remote_load.cfm" />
<cfquery name="events"  datasource="#dsn#"    >
SELECT 
e.eventID
,e.eventID as recid
,e.eventTitle
,e.eventStart 
,e.eventStartTime

 FROM events e INNER JOIN eventtypes_user t on t.eventtypename = e.eventtypename
WHERE e.userid = #session.userid# and t.userid = #session.userid#
    
    and e.eventid in (select eventid from eventcontactsxref where contactid = #rcontactid#) 

</cfquery>


<cfquery name="details" datasource="#dsn#"    >
SELECT d.contactid,
d.contactFirst,d.contactlast, 
d.contacttitle,
d.contactMiddle,
 d.contactSuffix,
    d.recordname,
   d.contactmeetingdate,
    d.contactmeetingloc,
d.refer_contact_id,
CONCAT_WS(' ',
        IF(LENGTH(d.contacttitle),d.contacttitle,NULL),
        IF(LENGTH(d.contactfirst),d.contactfirst,NULL),
        IF(LENGTH(d.contactMiddle),d.contactMiddle,NULL),
        IF(LENGTH(d.contactLast),d.contactLast,NULL),
        IF(LENGTH(d.contactSuffix),d.contactSuffix,NULL)
) AS fullName
,d.contactNickname
,d.contactID
,d.userID
,d.contactStatus
,d.contactCreationDate
,d.contactLastUpdated
,d.contactphoto
,d.contactBirthday
,d.contactPronoun
,d.newsletter_yn
,d.googlealert_yn
,d.socialmedia_yn
    
FROM contactdetails d


 inner JOIN taousers u ON u.userid = d.userid
where d.contactID = #rcontactid#
</cfquery>
 
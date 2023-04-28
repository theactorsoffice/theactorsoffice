<CFINCLUDE template="/include/remote_load.cfm" />
 
<cfquery name="note"   datasource="#dsn#"   >
Select * from noteslog where noteid = #noteid#
</cfquery>

<cfquery name="details"  datasource="#dsn#"    >
SELECT d.contactid,
d.contacttitle,
    d.recordname,
   d.contactmeetingdate,
    d.contactmeetingloc,
d.refer_contact_id,
d.contactFullName as fullname
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

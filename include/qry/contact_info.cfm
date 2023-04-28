

<cfquery name="details"     >
SELECT d.contactid,
d.contacttitle,
d.contactMiddle,
 d.contactSuffix,
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
where d.contactID = #contactid#
</cfquery>



<cfif #details.refer_contact_id# is not "">
<cfquery name="refer_details"     >
SELECT d.contactid,
d.contacttitle,
d.contactMiddle,
 d.contactSuffix,
    d.recordname,
   d.contactmeetingdate ,
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

FROM contactdetails d


 inner JOIN taousers u ON u.userid = d.userid
where d.contactID = #details.refer_contact_id#
</cfquery>
</cfif>


<cfquery name="results"  >
SELECT d.contactid, d.recordname as col1
from contactdetails d
Where d.contactstatus = 'Active'
    and d.userid = #session.userid#
order by d.contactfullname
    
</cfquery>

<cfquery name="pronouns"  >
SELECT  genderPronoun FROM genderpronouns_users where userid = #session.userid#
</cfquery>




<Cfif #details.recordcount# is "0">

<cflocation url="/app/contacts/" />
</Cfif>
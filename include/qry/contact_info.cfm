

<cfquery name="details"     >
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
where d.contactID = #contactid#
</cfquery>



<cfif #details.refer_contact_id# is not "">
<cfquery name="refer_details"     >
SELECT d.contactid,
d.contactFirst,d.contactlast, 
d.contacttitle,
d.contactMiddle,
 d.contactSuffix,
    d.recordname,
   d.contactmeetingdate ,
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
order by d.contactlast, d.contactFirst
    
</cfquery>

<cfquery name="pronouns"  >
SELECT  genderPronoun FROM genderpronouns_users where userid = #session.userid#
</cfquery>




<Cfif #details.recordcount# is "0">

<cflocation url="/app/contacts/" />
</Cfif>
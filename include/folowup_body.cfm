
<CFINCLUDE template="/include/remote_load.cfm" />


<cfquery name="details"  datasource="#dsn#"    >
SELECT d.contactid,
d.contacttitle,
    d.recordname,
   d.contactmeetingdate,
    d.contactmeetingloc,
d.refer_contact_id,
d.contactFullName as fullname
,d.contactfullname
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


<p>&nbsp;</p>
            <p>This audition is in the past.  Do you want to add <strong>#details.contactfullname#</strong> to a Follow Up System?<p>
<p>&nbsp;</p>

<form action="/include/systemchange.cfm">
<cfoutput>
<input type="hidden" name="contactid" value="#contactid#">

<input type="hidden" name="suid" value="0">
<input type="hidden" name="new_systemtype" value="Follow Up" >

</cfoutput>
         <div>
         <center> 
         <input name="submit" type="submit" value="Update" class="btn btn-xs btn-primary waves-effect mb-2 waves-light">
         </center>
         </div>



</form>
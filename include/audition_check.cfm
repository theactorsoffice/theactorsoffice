<cfparam name="isnew" default="0" />

<cfif #isAuditionModule# is not "1">
<h5>You do not have access to the auditionz module.</h5>
    
    <form>
 <input type="button" value="Go back!" onclick="history.back()">
</form>
    <cfabort>

</cfif>

<cfquery name="uu" datasource="#dsn#" >
UPDATE events_tbl e
INNER JOIN audroles r ON r.audroleid = e.audroleid
INNER JOIN audprojects p ON p.audprojectid = r.audprojectid
SET e.eventtitle = p.projname,
    e.eventdescription = p.projDescription
WHERE e.eventtitle != p.projname;
</cfquery>


<cfif #isnew# is "1">

<cfquery name="followups" datasource="#dsn#" maxrows="1">
SELECT distinct p.contactid,c.contactfullname, c.userid
FROM events e
INNER JOIN audroles r ON r.audroleid = e.audroleid
INNER JOIN audprojects p ON p.audprojectid = r.audprojectid
INNER JOIN contactdetails c ON c.contactid = p.contactid
WHERE e.isdeleted = 0 

AND r.audprojectid = #audprojectid# 
AND p.contactid NOT IN (

SELECT contactid FROM fusystemusers WHERE sustatus = 'Active')
order by e.eventid desc
</cfquery>


<cfif #followups.recordcount# is "1">

    <script>
        $(document).ready(function() {
            $("#follow").modal('show');
        });
    </script>



<div id="follow" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">

    <div class="modal-dialog">

        <div class="modal-content">

            <div class="modal-header">

                <h4 class="modal-title">

                    <cfoutput>Add Follow Up System</cfoutput>

                </h4>

                <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>

            </div>

            <div class="modal-body">
<p>&nbsp;</p>
            <p>This audition is in the past.  Do you want to add <strong>#followups.contactfullname#</strong> to a Follow Up System?<p>
<p>&nbsp;</p>

<form action="/include/systemchange.cfm">
<cfoutput>
<input type="hidden" name="contactid" value="#followups.contactid#">

<input type="hidden" name="suid" value="0">
<input type="hidden" name="new_systemtype" value="Follow Up" >

</cfoutput>
         <div>
         <center> 
         <input name="submit" type="submit" value="Update" class="btn btn-xs btn-primary waves-effect mb-2 waves-light">
         </center>
         </div>



</form>
            </div>

        </div>

    </div>

</div>



</cfif>

</cfif>
 
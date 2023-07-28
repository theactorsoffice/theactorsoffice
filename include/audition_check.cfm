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


<cfif #followups.recordcount# is "1">
<cfoutput>
    <script>
        $(document).ready(function() {
            // Load the content when the modal is shown
            $("##follow").on("show.bs.modal", function(event) {
                $(this).find(".modal-body").load("/include/folowup_body.cfm?contactid=#followups.contactid#");
            });

            // Show the modal
            $("##follow").modal('show');
        });
    </script>
    </cfoutput>
</cfif>






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

            </div>

        </div>

    </div>

</div>



</cfif>

</cfif>
 

<cfquery name="addmissing" datasource="#dsn#">
 INSERT INTO audcontacts_auditions_xref (contactid,audprojectid,xrefnotes) 

SELECT distinct x.contactid, r.audprojectid,'Was missing - audition_check.cfm' as xrefnotes
FROM eventcontactsxref x
INNER JOIN events e ON x.eventid = e.eventid
INNER JOIN audroles r ON r.audRoleID = e.audroleid
LEFT JOIN audcontacts_auditions_xref ax ON x.contactid = ax.contactid AND r.audprojectid = ax.audprojectid
WHERE ax.contactid IS NULL AND x.contactid > 0 
</cfquery>
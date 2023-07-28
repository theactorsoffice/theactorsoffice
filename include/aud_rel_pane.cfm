<script>
    $(document).ready(function() {
        $("#remoteAddContactAud").on("show.bs.modal", function(event) {
            // Place the returned HTML into the selected element
            $(this).find(".modal-body").load("<cfoutput>/include/remoteAddContactAud.cfm?userid=#userid#&audprojectid=#audprojectid#&src=audition&tagtypes=all</cfoutput>");
        });
    });
</script>

<cfset modalid="remoteAddContactAud" />

<cfset modaltitle="Add Contact" />

<cfinclude template="/include/modal.cfm" />







<cfinclude template="/include/qry/audcontacts.cfm" />

<h4>Audition Relationships</h4>

<p>Add a relationship from your existing relationships or <a href="remoteAddContact.cfm?src=account" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="#remoteAddContactAud"><strong>Add</strong></a> a new one.</p>

<form class="app-search" action="/app/audition/?secid=175" method="POST">
    <cfoutput>  
        <input type="hidden" name="ctaction" value="addmember">
        <input type="hidden" name="audprojectid" value="#audprojectid#">
    </cfoutput>

    <div class="row">
        <div class="col-md-2 py-2">Add relationship:</div>
        <div class="col-md-3 py-2">
            <div class="input-group">
                <input type="text" class="form-control" name="autocomplete_aud" id="autocomplete_aud" placeholder="Search..." autocomplete="off">
                <div class="input-group-append">
                    <button id="mybtns" type="submit" class="btn btn-xs btn-primary waves-effect mb-2 waves-light" style="height: 37.3889px">
                        <i class="fe-plus"></i> Add 
                    </button>
                </div>
            </div>
        </div>
    </div>
<cfif #events.recordcount# is not "0">
    <div class="row">
        <div class="col-md-2 py-2">
        <cfif events.recordcount gte 2>
        Add to appointment(s):
        <cfelseif events.recordcount eq 1 >
        Add to appointment:
        </cfif></div>
        <div class="col-md-8 py-2">
            <div class="form-group">
                <cfoutput query="events">
                    <div>
                        <input type="checkbox" name="events_list" value="#events.eventid#" id="event#events.eventid#">
                        <label for="event#events.eventid#">#dateFormat(events.eventStart, 'mm/dd/yy')#</label>
                    </div>
                </cfoutput>
            </div>
        </div>
    </div>

<cfelse>
<input type="hidden" name="events_list" value="" />
</cfif>

</form>


<div class="container-fluid">
    <div class="row">

        <cfloop query="audcontacts">

            <cfquery datasource="#dsn#" name="mytags">
                SELECT contactid, itemid,concat(' <span class=\'badge badge-blue\'>',`contactitems`.`valueText`,'</span>') as tag,contactitems.valuetext

                FROM contactitems
                WHERE contactid=#audcontacts.contactid# and  valueCategory='Tag' and valuetext <> ''
            </cfquery>

            <cfquery datasource="#dsn#" name="Findphone">
                select contactitems.valueText as phone from contactitems where contactitems.valueCategory = 'Phone' and contactitems.contactID = #audcontacts.contactid# and contactitems.itemStatus = 'Active' order by contactitems.primary_YN desc limit 1
            </cfquery>

            <cfset new_phone=findphone.phone />
            <cfquery datasource="#dsn#" name="Findemail">
                select contactitems.valueText as email from contactitems where contactitems.valueCategory = 'Email' and contactitems.contactID = #audcontacts.contactid# and contactitems.itemStatus = 'Active' order by contactitems.primary_YN desc limit 1
            </cfquery>
            <cfset new_email=Findemail.email />



            <cfoutput>
                <div class="col-xl-3 col-md-4 col-sm-6 col-xs-12 ">
                    <div class="text-center card-box border border-secondary border-1  h-100">
                        <div class="pt-1 pb-1">
                            
                            
                            
            <cfset contact_avatar_filename = "C:\home\theactorsoffice.com\media-#host#\users\#session.userid#\contacts\#audcontacts.contactid#\avatar.jpg" />
                            
                                      <cfif isimagefile(contact_avatar_filename)>
                                        <img src="/media-#host#/users/#session.userid#/contacts/#audcontacts.contactid#/avatar.jpg?ver=#rand()#" class="rounded-circle img-thumbnail avatar-xl" alt="profile-image">
                                                  <cfelse>
                                                        <img src="/media-#host#/defaults/avatar.jpg" class="rounded-circle img-thumbnail avatar-xl" alt="profile-image">
                                                      
                                                      
                                        </cfif>
                                          
                               
                            <h4 class="mt-2"><A href="/app/contact/?contactid=#audcontacts.contactid#">#audcontacts.contactname#</A></h4>



                            <p class="mt-1"><cfset z = 0>
                                <cfloop query="mytags"><cfset z=#z# +1><cfif #z# is "1">
                                    <cfoutput><span class="badge badge-blue">#mytags.valuetext#&nbsp; </span></cfoutput></cfif>
                                </cfloop>
                            </p>
                            <p class="small mt-1">

                                <cfif #new_phone# is not ""> <BR>

                                    <span>Phone: #new_phone# &nbsp;</span>
                                </cfif>

                                <cfif #new_email# is not ""> <BR>
                                    <span> Email: #new_email# &nbsp;</span>
                                </cfif>
                            </p>

<cfif "#projectDetails.contactid#" is not "#audcontacts.contactid#">

                            <a href="/app/audition/?audprojectid=#audprojectid#&ctaction=deleteContact&amp;deletecontactid=#audcontacts.contactid#" title="Remove from Audition" style="padding-left:10px;color:dimgrey;">
                                <span>
                                    <i class="fe-trash-2 font-10 text-muted"></i>
                                </span>
                            </a>

</cfif>

                            <!-- end row-->
            </cfoutput>
    </div> <!-- end .padding -->
</div>
<p>&nbsp;</p> <!-- end card-box-->
</div> <BR>
</cfloop>






</div>



</div>

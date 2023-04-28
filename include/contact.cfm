<CFINCLUDE template="/include/remote_load.cfm" />
<cfparam name="t3" default="0" />
<Cfoutput>#t3# </Cfoutput><cfabort>
<cfif #t3# is "1">

<Cflocation url="/app/contact/?contactid=#contactid#&new_pgid=118" />
</cfif>

<Cfset ppgDir ="contact" />

<cfparam name="dbug" default="N" />

<cfparam name="newendlink" default="" />

<cfparam name="contact_expand" default="true" />

<cfparam name="emaillink" default="unknown" />

<cfparam name="newactionlinkURL" default="" />

<cfparam name="updatenoteid" default="0" />

<cfparam name="pgtype" default="add" />

<cfparam name="ctaction" default="view" />

<cfparam name="pfaction" default="view" />

<cfparam name="status_active" default="Y" />

<cfparam name="status_completed" default="N" />

<cfparam name="status_future" default="N" />

<cfset currentid=contactid />

<cfset session.currentpage="/app/contact/?contactid=#currentid#" />

<cfif isdefined('cookie.status_active')>

    <cfset status_active=cookie.status_active />

</cfif>

<cfif isdefined('cookie.status_completed')>

    <cfset status_completed=cookie.status_completed />

</cfif>

<cfif isdefined('cookie.status_future')>

    <cfset status_future=cookie.status_future />

</cfif>

<cfset rpgid=36 />

<cfinclude template="/include/tab_check.cfm" />

<cfinclude template="/include/modalRemoteNewForm.cfm" />

<cfinclude template="/include/qry/contacts.cfm" />

<cfinclude template="/include/qry/categories.cfm" />

<cfinclude template="/include/qry/items.cfm" />

<cfinclude template="/include/qry/notesContact.cfm" />

<cfinclude template="/include/qry/SystemsContact.cfm" />

<cfinclude template="/include/qry/tagsContact.cfm" />

<cfinclude template="/include/qry/profiles.cfm" />

<cfinclude template="/include/qry/actinglinks.cfm" />

<cfinclude template="/include/qry/sysactive.cfm" />

<cfinclude template="/include/qry/notsall.cfm" />

<cfinclude template="/include/qry/events.cfm" />

<cfinclude template="/include/qry/systemNotificationsActive.cfm" />

<cfinclude template="/include/qry/SystemsActiveContact.cfm" />

<cfinclude template="/include/qry/ru.cfm" />

<cfinclude template="/include/qry/emailcheck.cfm" />

<cfinclude template="/include/qry/phonecheck.cfm" />

<cfinclude template="/include/qry/rels.cfm" />

<cfinclude template="/include/qry/ActiveCategories.cfm" />
    
<cfif #details.contactphoto# is not "">

    <cfset browser_contact_avatar_filename=details.contactphoto />

</cfif>

<div id="showmaint" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">

    <div class="modal-dialog modal-sm">

        <div class="modal-content modal-filled bg-success">

            <div class="modal-body p-4">

                <div class="text-center">

                    <i class="dripicons-checkmark h1 text-white"></i>

                    <h4 class="mt-2 text-white">Follow-up System Completed!</h4>

                    <p class="mt-3 text-white">

                        <cfoutput>#details.recordname#</cfoutput> has been automatically placed into a maintenance list system.

                    </p>

                    <button type="button" class="btn btn-light my-2" data-bs-dismiss="modal">Continue</button>

                </div>

            </div>

        </div>

    </div>

</div>

<script>
    $(document).ready(function() {
        $("#remoteUploadForm").on("show.bs.modal", function(event) {
            // Place the returned HTML into the selected element
            $(this).find(".modal-body").load("/include/remoteUploadForm.cfm");
        });
    });
</script>

<Cfoutput>
    
               <script>
                        $(document).ready(function() {
                            $("##remoteDeleteForm#recid#").on("show.bs.modal", function(event) {
                                // Place the returned HTML into the selected element
                                $(this).find(".modal-body").load("/include/remoteDeleteForm.cfm?recid=#recid#&rpgid=#pgid#&pgaction=update&pgdir=#pgdir#");
                            });
                        });
                    </script>
    
    
    

    <div id="remoteDeleteForm#currentid#" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">

        <div class="modal-dialog">

            <div class="modal-content">

                <div class="modal-header" style="background-color: red;">

                    <h4 class="modal-title">#compname#</h4>

                    <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>

                </div>

                <div class="modal-body">

                </div>

            </div>

        </div>

    </div>

</Cfoutput>

<cfloop query="sysactive">

    <cfinclude template="/include/qry/notsActive.cfm" />

    <cfloop query="notsactive">

        <cfoutput>

            <div id="action#notsActive.actionid#-modal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">

                <div class="modal-dialog">

                    <div class="modal-content">

                        <div class="modal-header">

                            <h4 class="modal-title">#notsActive.actiontitle#</h4>

                            <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true">x</button>

                        </div>

                        <div class="modal-body">

                            <h5>#notsActive.actiondetails#</h5>

                            <p>#notsActive.actionInfo#</p>

                            <cfif #notsActive.actionLinkID# is "2">

                                <cfset newactionlinkURL="mailto:#emaillink#" />

                                <cfif #emailcheck.recordcount# is "1">

                                    <cfset emaillink="#emailcheck.email#" />

                                </cfif>

                            </cfif>

                            <cfif #notsActive.actionLinkID# is "6">

                                <cfset newendlink="#details.contactfullname#" />

                                <cfset newactionlinkURL="#notsactive.ActionLinkURL##newendlink#+acting" />

                            </cfif>

                            <cfif #notsActive.actionLinkID# is not "6" and #notsActive.actionLinkID# is not "2" and #notsActive.actionLinkID# is not "0">

                                <cfset newendlink="#notsactive.endlink#" />

                                <cfset newactionlinkURL="#notsactive.ActionLinkURL#?contactid=#currentid##newendlink#" />

                            </cfif>

                            <p>
                                <center>

                                    <a href="#newActionLinkURL#" target="#notsactive.targetlink#" class="btn btn-xs btn-primary" style="background-color: ##406e8e; border: ##406e8e;">#notsactive.BtnName#</a>

                                </center>

                            </p>

                        </div>

                    </div>

                </div>

            </div>

        </cfoutput>

    </cfloop>

</cfloop>

<cfloop query="ru">

    <script>
        $(document).ready(function() {
            $("#remoteUpdate<cfoutput>SUID#ru.suid#</cfoutput>").on("show.bs.modal", function(event) {
                // Place the returned HTML into the selected element
                $(this).find(".modal-body").load("<cfoutput>/include/remoteUpdateSUID.cfm?userid=#userid#&suid=#ru.suid#&contactid=#currentid#</cfoutput>");
            });
        });
    </script>

    <div id="remoteUpdate<cfoutput>SUID#ru.suid#</cfoutput>" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">

        <div class="modal-dialog">

            <div class="modal-content">

                <div class="modal-header">

                    <h4 class="modal-title">Update <cfoutput>Relationship System</cfoutput>

                    </h4>

                    <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>

                </div>

                <div class="modal-body">

                </div>

            </div>

        </div>

    </div>

</cfloop>

<cfloop query="sysactive">

    <cfoutput>

        <div id="action#sysactive.suid#-modal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">

            <div class="modal-dialog">

                <div class="modal-content">

                    <div class="modal-header">

                        <h4 class="modal-title">#sysactive.recordname#</h4>

                        <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true">x</button>

                    </div>

                    <div class="modal-body">

                        <h5>Description</h5>

                        <p>#sysactive.systemdescript#</p>

                        <p><strong>Start Date:</strong> #dateformat(sysactive.sustartdate)#</p>

                        <cfif #sysactive.suenddate# is not "">

                            <p><strong>Completed:</strong> #dateformat(sysactive.suenddate)#</p>

                        </cfif>

                    </div>

                </div>

            </div>

        </div>

        <script>
            $(document).ready(function() {
                $("##remoteDeleteForm#sysActive.suid#").on("show.bs.modal", function(event) {
                    // Place the returned HTML into the selected element
                    $(this).find(".modal-body").load("/include/remoteDeleteForm.cfm?recid=#sysActive.suid#&rpgid=40&pgaction=update&contactid=#currentid#&pgdir=contact&t4=1");
                });
            });
        </script>

        <div id="remoteDeleteForm#sysActive.suid#" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">

            <div class="modal-dialog">

                <div class="modal-content">

                    <div class="modal-header" style="background-color: red;">

                        <h4 class="modal-title">Follow Up System</h4>

                        <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>

                    </div>

                    <div class="modal-body"></div>

                </div>

            </div>

        </div>

    </cfoutput>

</cfloop>

<cfif notesContactDetails.recordcount eq 1>

    <cfset update_noteDetails=notesContactDetails.noteDetails />
<cfset update_isPublic=notesContactDetails.isPublic />
    <cfelse>

        <cfset update_noteDetails="" />
 <cfset isPublic="" />
</cfif>

<cfif #ctaction# is "deleteitem">

    <cfquery datasource="#dsn#" name="del">
        update contactitems set isDeleted = 1 where itemid = #itemidd# and contactid = #currentid#
    </cfquery>

    <cfset ctaction="update" />

</cfif>

<cfif #ctaction# is "update">

    <cfquery datasource="#dsn#" name="del">
        update contactitems set isDeleted = 1 where contactid = #currentid# and itemstatus = 'Pending'
    </cfquery>

    <CFLOOP QUERY="categories">

        <cfquery datasource="#dsn#" name="Find">
            Select itemid from contactitems
            where contactid = #currentid# and valueCategory = '#categories.valuecategory#' and itemStatus = 'Pending'
        </cfquery>

        <cfif #Find.recordcount# is "0">

            <cfquery datasource="#dsn#" name="Insert">
                INSERT INTO contactitems (contactID,valueType,valuecategory,itemStatus) VALUES (#currentid#,'#categories.valueTypeDef#','#categories.valuecategory#','Pending')
            </cfquery>

        </cfif>

    </CFLOOP>

</cfif>


<cfloop query="eventresults">

    <cfoutput>

        <div id="remoteUpdateForm#eventresults.recid#" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">

            <div class="modal-dialog">

                <div class="modal-content">

                    <div class="modal-header" style="background-color: ##f3f7f9;">

                        <h4 class="modal-title">#compname#</h4>

                        <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>

                    </div>

                    <div class="modal-body">

                    </div>
                </div>

            </div>

        </div>

    </cfoutput>

</cfloop>


        <cfif #ctaction# is "view">

            <cfinclude template="/include/contact_view.cfm" />

        </cfif>

        <cfif #ctaction# is "update">

            <cfinclude template="/include/contact_update.cfm" />

        </cfif>

        <cfif #ctaction# is "update_new">

            <cfinclude template="/include/contact_update_form.cfm" />

        </cfif>

    </div>

</div>

<style>
    #hidden_div {
        display: none;
    }
</style>

<script>
    $(document).ready(function() {
        $("#contacts-datatable").DataTable({

            bFilter: false,
            scrollY: "550px",
            scrollCollapse: !0,
            language: {
                paginate: {
                    previous: "<i class='mdi mdi-chevron-left'>",
                    next: "<i class='mdi mdi-chevron-right'>"
                }
            },
            drawCallback: function() {
                $(".dataTables_paginate > .pagination").addClass("pagination-rounded")
            }
        });
        var a = $("#datatable-buttons").DataTable({
            lengthChange: !1,
            buttons: [{
                extend: "copy",
                className: "btn-light"
            }, {
                extend: "print",
                className: "btn-light"
            }, {
                extend: "pdf",
                className: "btn-light"
            }],
            language: {
                paginate: {
                    previous: "<i class='mdi mdi-chevron-left'>",
                    next: "<i class='mdi mdi-chevron-right'>"
                }
            },
            drawCallback: function() {
                $(".dataTables_paginate > .pagination").addClass("pagination-rounded")
            }
        });

    });
</script>

<script>
    $(document).ready(function() {
        $("#remoteUpdateName").on("show.bs.modal", function(event) {
            // Place the returned HTML into the selected element
            $(this).find(".modal-body").load("<cfoutput>/include/remoteUpdateName.cfm?contactid=#currentid#&userid=#session.userid#</cfoutput>");
        });
    });
</script>

<div id="remoteUpdateName" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">

    <div class="modal-dialog">

        <div class="modal-content">

            <div class="modal-header">

                <h4 class="modal-title">Contact Details</h4>

                <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>

            </div>

            <div class="modal-body">

            </div>

        </div>

    </div>

</div>

<script>
    $(document).ready(function() {
        $("#remoteUpdateRelationship").on("show.bs.modal", function(event) {
            // Place the returned HTML into the selected element
            $(this).find(".modal-body").load("<cfoutput>/include/remoteUpdateRelationship.cfm</cfoutput>");
        });
    });
</script>

<div id="remoteUpdateRelationship" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">

    <div class="modal-dialog">

        <div class="modal-content">

            <div class="modal-header">

                <h4 class="modal-title">Relationship Update</h4>

                <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>

            </div>

            <div class="modal-body">

            </div>

        </div>

    </div>

</div>

<cfquery datasource="#dsn#" name="c">
    SELECT * FROM itemcategory
</cfquery>

<cfloop query="c">

    <script>
        $(document).ready(function() {
            $("#remoteAdd<cfoutput>C#c.catid#</cfoutput>").on("show.bs.modal", function(event) {
                // Place the returned HTML into the selected element
                $(this).find(".modal-body").load("<cfoutput>/include/remoteAddC.cfm?catid=#c.catid#&userid=#session.userid#&contactid=#currentid#</cfoutput>");
            });
        });
    </script>

    <div id="remoteAdd<cfoutput>C#c.catid#</cfoutput>" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">

        <div class="modal-dialog">

            <div class="modal-content">

                <div class="modal-header">

                    <h4 class="modal-title">New <cfoutput>#c.valueCategory# Form</cfoutput>

                    </h4>

                    <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>

                </div>

                <div class="modal-body">

                </div>

            </div>

        </div>

    </div>

</cfloop>

<script>
    $(document).ready(function() {
        $("#remoteUpdateTag").on("show.bs.modal", function(event) {
            // Place the returned HTML into the selected element
            $(this).find(".modal-body").load("<cfoutput>/include/remoteUpdateTag.cfm?contactid=#currentid#&userid=#session.userid#</cfoutput>");
        });
    });
</script>

<div id="remoteUpdateTag" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">

    <div class="modal-dialog">

        <div class="modal-content">

            <div class="modal-header">

                <h4 class="modal-title">Update Tags</h4>

                <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>

            </div>

            <div class="modal-body">

            </div>

        </div>

    </div>

</div>

<cfquery datasource="#dsn#" name="cu">
    SELECT i.itemid, c.catid, c.valuecategory FROM contactitems i INNER JOIN itemcategory c ON c.valuecategory = i.valuecategory WHERE contactid = #currentid#
</cfquery>

<cfloop query="cu">

    <script>
        $(document).ready(function() {
            $("#remoteUpdate<cfoutput>C#cu.itemid#</cfoutput>").on("show.bs.modal", function(event) {
                // Place the returned HTML into the selected element
                $(this).find(".modal-body").load("<cfoutput>/include/remoteUpdateC.cfm?itemid=#cu.itemid#&userid=#session.userid#</cfoutput>");
            });
        });
    </script>

    <div id="remoteUpdate<cfoutput>C#cu.itemid#</cfoutput>" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">

        <div class="modal-dialog">

            <div class="modal-content">

                <div class="modal-header">

                    <h4 class="modal-title">

                        Update <cfoutput>#cu.valueCategory# Form</cfoutput>

                    </h4>

                    <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true">

                        <i class="mdi mdi-close-thick"></i>

                    </button>

                </div>

                <div class="modal-body">

                </div>

            </div>

        </div>

    </div>

</cfloop>

<script>
    $(document).ready(function() {
        $("#remoteUpdateSUID0").on("show.bs.modal", function(event) {
            // Place the returned HTML into the selected element
            $(this).find(".modal-body").load("<cfoutput>/include/remoteUpdateSUID.cfm?suid=0&contactid=#currentid#</cfoutput>");
        });
    });
</script>

<div id="remoteUpdateSUID0" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">

    <div class="modal-dialog">

        <div class="modal-content">

            <div class="modal-header">

                <h4 class="modal-title">

                    <cfoutput>Relationship System</cfoutput>

                </h4>

                <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>

            </div>

            <div class="modal-body">

            </div>

        </div>

    </div>

</div>

<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), " \")#" />

<cfinclude template="/include/bigbrotherinclude.cfm" />
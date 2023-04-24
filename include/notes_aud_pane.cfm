       <h4>Notes</h4>
<cfset returnurl = "audition" />
<div class="d-flex justify-content-between">

    <div class="float-left">

        <cfif #notesaud.recordcount# is "0">

            No notes.

        </cfif>

        <cfoutput>

            You have <strong>#notesaud.recordcount#</strong> note<cfif #notesaud.recordcount# is not "1">s</cfif> .

        </cfoutput>

    </div>

    <div class="float-end">

        <a href="/app/note-add-aud/?returnurl=audition<cfoutput>&audprojectid=#audprojectid#</cfoutput>&rcontactid=0" class="btn btn-xs btn-primary waves-effect mb-2 waves-light" style="background-color: #406e8e; border: #406e8e;">

            Add

        </a>

    </div>

</div>





    <div class="nomobile">
<div class="table-responsive" id="NotesContact_container">
    <table id="notes-datatable" class="table display dt-responsive nowrap w-100 table-striped table-hover">

        <thead>

            <cfoutput query="notesaud" maxrows="1">

                <cfif (notesaud.CurrentRow MOD 2)>

                    <Cfset rowtypee="Odd" />

                </cfif>

                <cfif (notesaud.CurrentRow MOD 1)>

                    <Cfset rowtypee="Even" />

                </cfif>

                <tr class="#rowtypee#">

                    <th>Action</th>

                    <th>#head1#</th>



                    <th>#head4#</th>
                    <th>Links</th>
                    <th>Attachments</th>

                    <th>#head5#</th>

                    <th></th>

                </tr>

            </cfoutput>

        </thead>

        <tbody>
            <CFINCLUDE template="/include/remote_load.cfm" />

            <cfloop query="notesaud">
                <cfset new_noteid=notesaud.noteid />


                <cfquery datasource="#dsn#" name="links">
                    SELECT
                    linkid
                    ,linkname
                    ,linkurl
                    ,userid
                    ,noteid

                    FROM links WHERE noteid = #new_noteid#
                </cfquery>

                <cfquery datasource="#dsn#" name="attachments">
                    SELECT
                    attachid
                    ,noteid
                    ,attachname
                    ,attachfilename
                    ,userid

                    FROM attachments
                    WHERE noteid = #new_noteid#
                </cfquery>

                <cfoutput>
                    
                    
                    
                    
                    
                    
                           <script>
            $(document).ready(function() {
                $("##remoteDeleteFormNoteAud#notesaud.noteid#").on("show.bs.modal", function(event) {
                    // Place the returned HTML into the selected element
                    $(this).find(".modal-body").load("/include/remoteDeleteFormNoteAud.cfm?recid=#notesaud.noteid#&audprojectid=#audprojectid#&returnurl=audition");
                });
            });
        </script>
                    
                    
                            <div id="remoteDeleteFormNoteAud#notesaud.noteid#" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">

            <div class="modal-dialog">

                <div class="modal-content">

                    <div class="modal-header" style="background-color: red;">

                        <h4 class="modal-title">Delete Note Confirmation</h4>

                        <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>

                    </div>

                    <div class="modal-body"></div>

                </div>

            </div>

        </div>
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    

                    <script>
                        $(document).ready(function() {
                            $("##remoteaddlink#notesaud.noteid#").on("show.bs.modal", function(event) {
                                // Place the returned HTML into the selected element
                                $(this).find(".modal-body").load("/include/linkadd.cfm?audprojectid=#audprojectid#&contactid=0&noteid=#new_noteid#&returnurl=audition");
                            });
                        });

                    </script>

                    <div id="remoteaddlink#notesaud.noteid#" class="modal fade" tabindex="-1" aria-labelledby="standard-modalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header" style="background-color: ##f3f7f9;">
                                    <h4 class="modal-title" id="standard-modalLabel">Note Links</h4>
                                    <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>
                                </div>
                                <div class="modal-body">


                                </div>
                            </div>

                        </div>

                    </div>
                    
                                        <script>
                        $(document).ready(function() {
                            $("##remotenotedetails#notesaud.noteid#").on("show.bs.modal", function(event) {
                                // Place the returned HTML into the selected element
                                $(this).find(".modal-body").load("/include/remotenotedetails.cfm?contactid=0&noteid=#new_noteid#&returnurl=audition");
                            });
                        });

                    </script>

                    <div id="remotenotedetails#notesaud.noteid#" class="modal fade" tabindex="-1" aria-labelledby="standard-modalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg modal-dialog-scrollable" role="document">
                            <div class="modal-content">
                                <div class="modal-header" style="background-color: ##f3f7f9;">
                                    <h4 class="modal-title" id="standard-modalLabel">Note</h4>
                                    <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>
                                </div>
                                <div class="modal-body">


                                </div>
                            </div>

                        </div>

                    </div>
                    
                    <script>
                        $(document).ready(function() {
                            $("##remoteaddattachment#notesaud.noteid#").on("show.bs.modal", function(event) {
                                // Place the returned HTML into the selected element
                                $(this).find(".modal-body").load("/include/attachmentaddaud.cfm?audprojectid=#audprojectid#&contactid=0&noteid=#new_noteid#&returnurl=audition");
                            });
                        });

                    </script>

                    <div id="remoteaddattachment#notesaud.noteid#" class="modal fade" tabindex="-1" aria-labelledby="standard-modalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header" style="background-color: ##f3f7f9;">
                                    <h4 class="modal-title" id="standard-modalLabel">Upload an Attachment</h4>
                                    <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>
                                </div>
                                <div class="modal-body">
                                </div>
                            </div>

                        </div>

                    </div>

                    <tr role="row">

                        <td>

                            <a title="Edit" href="/app/note-update-aud/?noteid=#notesaud.noteid#&returnurl=audition&audprojectid=#audprojectid#&rcontactid=0">

                                <i class="mdi mdi-square-edit-outline"></i>

                            </a>

                        </td>



                        <td class="text-nowrap">#dateformat('#notesaud.col1#','m-d-YYYY')#<BR />#timeformat('#notesaud.col2#','medium')#</td>


                        <td class="text-nowrap">
                            <cfif #notesaud.col4# is "1">Public<cfelse>Private</cfif>
                        </td>



                        <TD class="text-nowrap">
                            <a href="" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteaddlink#notesaud.noteid#" data-bs-placement="top" title="Add Link" data-bs-original-title="Add Link">
                                <i class="fe-plus-circle"></i> Add link
                            </a>
                            <cfif #links.recordcount# is not "0">
                                <cfloop query="links">
                                    <BR />
                                    <a href="#linkurl#" target="#new_noteid#">#linkname#</a>
                                    <a href="/include/linkdel.cfm?linkid=#links.linkid#&audprojectid=#audprojectid#&returnurl=audition" title="delete link">
                                        <i class="mdi mdi-trash-can-outline mr-1"></i>
                                    </a>
                                </cfloop>
                            </cfif>
                        </TD>



                        <TD class="text-nowrap">
                            <a href="" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteaddattachment#notesaud.noteid#" data-bs-placement="top" title="Add attachment" data-bs-original-title="Add attachment">
                                <i class="fe-plus-circle"></i> Add attachment
                            </a>
                            <cfif #attachments.recordcount# is not "0">
                                <cfloop query="attachments">
                                    <BR />
                                    <a href="/include/download.cfm?attachid=#attachid#" >#attachname#</a>
                                    <a href="/include/attachmentdelaud.cfm?contactid=0&rcontactid=0&attachid=#attachments.attachid#&audprojectid=#audprojectid#&returnurl=audition" title="delete attachment">
                                        <i class="mdi mdi-trash-can-outline mr-1"></i>
                                    </a>
                                </cfloop>
                            </cfif>
                        </TD>

                        <td>          
                            
                            
                            
                            #notesaud.col5#

<cfif #notedetailshtml# is not ""><BR> <a href="" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remotenotedetails#notesaud.noteid#" data-bs-placement="top" title="View Details" data-bs-original-title="View Details">
                                <i class="mdi mdi-eye-outline"></i> Details
                            </a></cfif>




                        </td>

                        <TD>

<a title="Delete Note" href="" data-bs-toggle="modal" data-bs-target="##remoteDeleteFormNoteAud#notesaud.recid#">
                         
                                <i class="mdi mdi-trash-can-outline mr-1"></i></A>



                        </TD>

                    </tr>



                </cfoutput>

            </cfloop>

        </tbody>

    </table>

</div>
</div>























<div class="mobile" style="100%;">
    
    <cfparam name="target_id" default="0" />

    <div class="row">

        <div class="col-xl-12">

            <div id="accordion_systems" class="mb-3" style="width:100%;">
                <cfset k=0 />
                

                
                
                <cfloop query="notesaud">
                    
  <cfset new_noteID = notesaud.noteID />
 

            <cfoutput>
                
               
                
                <cfset k=#k# + 1 />
            
            </cfoutput>

            <cfset cardclass="" />
                    
                    <cfif #notesaud.currentrow# is "1">
                        <cfoutput>
                        <cfset target_id="#new_noteID#" />
                        </cfoutput>
                    </cfif>
         
<cfif #new_noteID# is "#target_id#">

    <cfset header_aria_exanded="true" />
    
    <cfset collapse_show = "collapse show" />

</cfif>

<cfif #new_noteID# is not "#target_id#">

    <cfset header_aria_exanded="false" />
    
    <cfset collapse_show = "collapse" />

</cfif>              

    <div class="card mb-1" style="width:100%;">
               
                    <div class="card-header" id="heading_system_<cfoutput>#notesaud.currentrow#</cfoutput>">

                        <h5 class="m-0 align-middle" style="width:100%;">
 
                            <a class="text-dark collapsed" data-bs-toggle="collapse" href="#collapse_system_<cfoutput>#notesaud.currentrow#</cfoutput>" aria-expanded="<cfoutput>#header_aria_exanded#</cfoutput>">
 
                                
                                
                                <cfoutput> <strong>#dateformat('#notesaud.noteTimestamp#','short')#</strong> -  #timeformat('#notesaud.noteTimestamp#','short')# <i class="fe-menu"></i> </cfoutput>  

                            <span class="badge badge-sm badge-blue badge-pill float-end" style="font-size:.7em;">      <cfoutput>  <cfif #notesaud.col4# is "1">Public<cfelse>Private</cfif></cfoutput></span>
                            
                            
                      

                            </a>
                            
                        </h5>

                    </div>

                    <div id="collapse_system_<cfoutput>#notesaud.currentrow#</cfoutput>" class="<cfoutput>#collapse_show#</cfoutput>" aria-labelledby="collapse_system_<cfoutput>#notesaud.currentrow#</cfoutput>" data-bs-parent="#accordion_systems"  >


                        <div class="card-body">
                          <cfoutput>
                              <h5>#notesaud.noteDetails# 
                              
                                 <a title="Edit" href="/app/note-update-aud/?noteid=#notesaud.noteid#&returnurl=audition&rcontactid=0">

                                <i class="mdi mdi-square-edit-outline"></i>

                            </a>
                              </h5></cfoutput>
                                   <cfif #notesaud.col4# is not "">
      <h6>Who Can See Note?</h6><p>
                                       
                                       <cfif #notesaud.col4# is "1">Public<cfelse>Private</cfif>
                                       
                                       </p>
                              </cfif>
                            
  <cfif #notesaud.noteDetailsHTML# is not "">
                            <h6>Description</h6> 
                            <p><cfoutput>
                           #notesaud.noteDetailsHTML#
</cfoutput>
                            </cfif>                       
      </p>
                                
                                
                                
                        </div>

                    </div>

                </div>
                 
            </cfloop>  

            </div>

        </div>

    </div>

</div>    





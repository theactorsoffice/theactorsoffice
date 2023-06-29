<cfinclude template="/include/qry/auds_byrole.cfm" />



<cfloop query="events">
   
    <cfoutput>
        
        <script>
    $(document).ready(function() {
        $("##remoteUpdateAnswer").on("show.bs.modal", function(event) {
            // Place the returned HTML into the selected element
            $(this).find(".modal-body").load("/include/remoteassform.cfm?eventid=#eventid#&audprojectid=#audprojectid#");
        });
    });

</script>
        
        
        
        
        <div id="remoteUpdateAnswer" class="modal fade" tabindex="-1" aria-labelledby="standard-modalLabel" aria-hidden="true">

            <div class="modal-dialog">

                <div class="modal-content">

                    <div class="modal-header" style="background-color: ##f3f7f9;">

                        <h4 class="modal-title" id="standard-modalLabel"><strong>#events.audstep#: </strong>#dateformat(events.eventStart,'long')#: Personal Assessment</h4>

                        <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i>

                        </button>

                    </div>

                    <div class="modal-body">

                    </div>

                </div>

            </div>

        </div>
        
        <cfset eventid = "#events.eventid#" />
        
        <cfinclude template="/include/qry/aud_questions.cfm" />
        
        
        <h4>Personal Assessment</h4>
   
            
        
<div class="card mb-1">

                <div class="card-header" id="heading_#events.eventid#">

                    <h5 class="m-0">

                        <a class="text-dark" data-bs-toggle="collapse" href="##collapse_#events.eventid#" aria-expanded="true">

                            <i class="mdi mdi-filmstrip mr-1 text-primary"></i>
                            
                            <strong>#events.audstep#: </strong>#dateformat(events.eventStart,'long')#

                        </a>

                    </h5>

                </div>

                <div id="collapse_#events.eventid#" class="collapse show" aria-labelledby="headin_#events.eventid#" data-bs-parent="##accordion">

                    <div class="card-body">
                        <h4>Audition Assessment Questionnaire        <a href="javascript:;" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteUpdateAnswer" toggle="tooltip" data-bs-placement="top" title="Update Answer" data-bs-original-title="Update Answer">

                                                      <i class="mdi mdi-square-edit-outline"></i> 

                                                  </a></h4>

                        <div class="row">

                          
                            
                                <cfif #questions.recordcount# is "23543543543543534543543">
                                      <div class="col-md-12 col-lg-12 col-xl-12 p-1 text-nowrap">
                                <a href="/include/aud_assessment_add.cfm?eventid=#eventid#&audprojectid=#audprojectid#" class="btn btn-primary waves-effect waves-light">Create</a>
                                    </div>
                                </cfif>
                                
                                
                                <cfloop query="questions">
                                <cfoutput>
                            
                                <div class="col-md-12  p-2 text-dark">
                                <strong>#questions.qorder#. #questions.qtext#</strong>
                                    </div>
                                 
                                        <div class="col-md-12  p-2">&nbsp;
                                            <cfif #questions.qtype#
                               is "rating"> <em>#questions.arating#</em></cfif>
                                            
                                                     <cfif #questions.qtype#
                                is "text"> <em>#questions.atext#</em></cfif>
                                            
                                                 <cfif #questions.qtype#
                                is "long"> <em>#questions.amemo#</em></cfif>
                                            
                                     
                                    </div>
                                </cfoutput>
                                </cfloop>
                            
                            </div>

                        </div>

                    </div>

                </div>

       
        
        </cfoutput>

    </cfloop>

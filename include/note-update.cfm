



<cfparam name="rcontactid" default="0" />

<cfparam name="rcontactid" default="0" />
<cfset currentid = rcontactid />
 
<style>
    #hidden_div {
        display: none;
    }
</style>



<CFINCLUDE template="/include/remote_load.cfm" />
<cfquery datasource="#dsn#" name="relationships">
    select * from contactdetails d where recordname <> '' and userid = #session.userid# order by d.contactfirst, d.contactlast
</cfquery>


<div class="row">


    <div class="col-xl-6 col-lg-8 col-md-12">
        <div class="card">


            <div class="card-body">
                
               <cfoutput><h4>#details.fullName#</h4></cfoutput> 
                
                

                <cfform method="post" action="/include/note-update2.cfm" class="parsley-examples" name="event-form" id="form-event" data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden" data-parsley-trigger="keyup" data-parsley-validate>
                    
                    <cfoutput>
                        
                        <input type="hidden" name="returnurl" value="#returnurl#">
                        
                        <input type="hidden" name="rcontactid" value="#rcontactid#">
                        
                        <input type="hidden" name="userid" value="#session.userid#">
                        
                         <input type="hidden" name="noteid" value="#noteid#">
                   
                    </cfoutput>
                    
                    
                    <div class="row">





                        <script>
                            $(document).ready(function() {
                                $("#select-relationship").selectize({

                                    persist: !1,
                                    createOnBlur: !0,
                                    create: !0,


                                    plugins: ["remove_button"],
                                    delimiter: ",",
                                    persist: false,
                                    create: function(input) {
                                        return {
                                            value: input,
                                            text: input,
                                        };
                                    },


                                });

                            });
                        </script>










                        <div class="form-group col-md-12">
                            <label for="eventDescription">Note Details<span class="text-danger">*</span></label>
                            <textarea class="form-control" type="text" id="noteDetails"   name="noteDetails" placeholder="Write a note..." rows="8" required data-parsley-required data-parsley-error-message="Details are required"><cfoutput>#note.notedetails#</cfoutput></textarea>

                        </div>
<cfif #isdefined('sdfsdfdsf')#>

                        <div class="col-lg-12">
                            <div class="form-group mb-3">
                                <label for="select-relationship">Relationships<span class="text-danger">*</span></label>
                                <select id="select-relationship" name="relationships" autocomplete="off" multiple required data-parsley-required data-parsley-error-message="Relationship is required" class="demo-default selectize-close-btn" style="width: 100%" placeholder="Select a Relationship..." value="">
                                    <option value="">Select a Relationship...</option>
                                    <cfloop query="relationships">
                                        <cfoutput>
                                            <option value="#relationships.contactid#" <cfif "#relationships.contactid#" is "#rcontactid#">selected </cfif>>#recordname#</option>
                                        </cfoutput>
                                    </cfloop>
                                </select>
                            </div>

                        </div>
                    
                    </cfif>


                        <div class="form-group col-md-6">
                            <label for="eventTypeName">Who can see your note?<span class="text-danger">*</span></label>
                            <select class="form-control" name="isPublic" id="isPublic" data-parsley-required data-parsley-error-message="Note type is required">
                                <option value="1" <cfif #note.ispublic# is "1"> selected</cfif> >Team</option>
                                <option value="0" <cfif #note.ispublic# is "0"> selected</cfif> >Only me</option>
                            </select>


                        </div>
 
                
                
                
                               <div class="form-group col-md-6">
                            <label for="eventid">Connect to an event</label>
                            <select class="form-control" name="eventid" id="eventid" >
                                <option value="0" <cfif #events.eventid# is "0"> selected</cfif>>No event</option>
                                
                                <Cfoutput query="events">
                                 <option value="#eventid#" <cfif #events.eventid# is "#note.eventid#"> selected</cfif> >#dateformat(events.eventStart)# - #events.eventTitle#</option>
                                </Cfoutput>
                            
                            </select>


                        </div>



                    </div>



                    <div class="row mt-2">
                        <div class="col-6">

                        </div>
                        <div class="col-6 text-right">
                            <a href="javascript:history.go(-1)"><button type="button" class="btn btn-light mr-1 btn-sm" data-bs-dismiss="modal">Back</button></a>
                            <button type="submit" class="btn btn-primary btn-sm waves-effect waves-light" id="btn-save-event">Update</button>
                        </div>
                    </div>
                </cfform>
            </div>
        </div>

    </div>

</div>

<script>
    $(document).ready(function() {
        $(".parsley-examples").parsley()
    });
</script>





<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), " \")#" />
<cfinclude template="/include/bigbrotherinclude.cfm" />
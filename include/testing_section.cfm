
<h4>Testing Process</h4>

<cfoutput>

                            <div class="row">

                                <cfset n=0 />

                                <cfif #details.customtestpagename# is "">

                                    <cfset startpage="http://uat.theactorsoffice.com/app/#details.pgdir#/" />

                                    <cfset pgnames="#details.pgname#" />

                                </cfif>

                                <cfif #details.customtestpagename# is not "">

                                    <cfset startpage="#details.customtestpagelink#" />

                                    <cfset pgnames="#details.customtestpagename#" />

                                </cfif>

                     

                                    <cfset startpage="#replace('#startpage#','dev.','uat.')#" />

                             
                                
                                <cfset startpage="https://uat.theactorsoffice.com?uatuserid=#session.userid#" />
 

                                <div class="col-md-12">

                                    <div class="media">
                                        
                                        <div class="media-body">

                                            <cfif #details.testingscript# is not "">

                                                <div class="mt-0 font-size-12">

                                                    #details.testingscript#

                                                </div>

                                            </cfif>

                                            <div class="mt-0 mb-3 font-size-12">

                                                <p>To begin testing, open a browser window to the User Testing Site (<A  target="test" HREF="#startpage#" target="test">https://uat.theactorsoffice.com</A>):</p>

                                                <A HREF="#startpage#" target="test">

                                                    <button class="btn btn-sm btn-primary" id="btn-new-event"> Open Browser</button>

                                                </A>
                                                <p>&nbsp;</p>
<p>PLEASE NOTE: The test site has a purple top menu.</p>

                                            </div>

                                        </div>

                                    </div>

                                </div>

    </cfoutput>

    </div>

    <cfquery name="users" datasource="#dsn#">
        SELECT u.userid as new_userid,u.recordname AS username
        FROM taousers u
        where u.userid = #session.userid#
    </cfquery>

    <cfquery name="find" datasource="#dsn#">
        select * from tickettestusers
        where ticketid = #recid#
        and userid = #userid#
    </cfquery>

    <cfif #find.recordcount# is "1">

        <cfset testid=find.id />

        <cfoutput>

            <cfset new_teststatus="#find.teststatus#" />

            <cfset new_rejectNotes="#find.rejectNotes#" />

        </cfoutput>
        
    </cfif>

    <cfif #find.recordcount# is not "1">

            <cfset testid = 0 />

            <cfset new_teststatus="" />

            <cfset new_rejectNotes="" />

    </cfif>

    <cfset cur_icon="">

        <div class="media">

            <div class="media-body">

                <div class="mt-0 mb-2 font-size-12">

                    After testing is complete, approve or reject the ticket below.

                </div>

            </div>

        </div>

        <form id="<cfoutput>approveform#details.recid#</cfoutput>" method="post" action="/include/testing2.cfm">

            <cfoutput query="details">

                <input type="hidden" name="old_ticketstatus" value="#details.ticketstatus#" />

                <input type="hidden" name="new_ticketid" value="#details.recid#" />

                <input type="hidden" name="testid" value="#testid#" />

                <input type="hidden" name="new_userid" value="#users.new_userid#" />

                <input type="hidden" name="oldverid" value="#oldverid#" />
                
          <input type="hidden" name="prod_userid" value="#session.userid#" />
                      
                  

            </cfoutput>

            <div class="form-group col-md-3">

                <label for="tickettype">Ticket Status</label>

                <select class="form-control" name="new_teststatus" id="new_teststatus" required onchange="showDiv('hidden_div', this)">

                    <option value=""></option>

                    <cfif #new_teststatus# is "Approved">

                        <option value="Approved" selected>Approved</option>

                    </cfif>

                    <cfif #new_teststatus# is not "Approved">

                        <option value="Approved">Approved</option>

                    </cfif>

                    <cfif #new_teststatus# is "Rejected">

                        <option value="Rejected" selected>Rejected</option>

                    </cfif>

                    <cfif #new_teststatus# is not "Rejected">

                        <option value="Rejected">Rejected</option>

                    </cfif>

                </select>

            </div>
            
            
            <div class="form-group col-md-6">
            <label for="contactFirst">Notes (optional)</label>

            <input class="form-control" type="text" id="rejectNotestester" name="new_rejectnotes" value="" data-parsley-maxlength="500" data-parsley-maxlength-message="Max length 500 characters"  placeholder="Testing notes">


        </div>
            


            <cfif #new_teststatus# is "Rejected">

                <cfoutput>

                    <div class="form-group col-md-12">

                        <label for="tickettype">If Rejected, state reason:</label>

                        <textarea class="form-control" type="text" id="new_rejectNotes" name="new_rejectNotes" placeholder="Details" rows="2">#new_rejectNotes#</textarea>

                    </div>

                </cfoutput>

            </cfif>

            <cfif #new_teststatus# is not "Rejected">

                <cfoutput>

                    <div class="form-group col-md-12" id="hidden_div">

                        <label for="tickettype">If Rejected, state reason:</label>

                        <textarea class="form-control" type="text" id="new_rejectNotes" name="new_rejectNotes" placeholder="Details" rows="2">

                            #new_rejectNotes#
                    
                        </textarea>

                    </div>

                </cfoutput>

                <cfquery name="finduser" datasource="#dsn#">
                    SELECT userlastname from taousers where userid = #session.userid#
                </cfquery>

                <cfif "#finduser.userlastname#" is "Ansoff" >

                    <cfoutput>

                        <div class="form-group col-md-3">

                            <div class="custom-control custom-checkbox">

                                <input type="checkbox" class="custom-control-input" id="changestatus" value="Y" name="changestatus">

                                <label class="custom-control-label" for="changestatus">Change Status</label>

                            </div>

                        </div>

                    </cfoutput>

                </cfif>

                <cfif "#finduser.userlastname#" is not "Ansoff" and "#finduser.userlastname#" is not "King">

                    <input type="hidden" name="changestatus" value="N" />

                </cfif>

            </cfif>


            <div class="row mt-2">

                <div class="col-6">

                    <button onclick="form_submit()" type="submit" class="btn btn-primary btn-sm waves-effect waves-light" id="btn-save-event">

                        Update

                    </button>

                </div>

                <div class="col-6 text-right">

                    <a href="javascript:history.go(-1)">

                        <button type="button" class="btn btn-light mr-1 btn-sm" data-bs-dismiss="modal">

                            Back

                        </button></a>

                </div>

            </div>

        </form>
        
        
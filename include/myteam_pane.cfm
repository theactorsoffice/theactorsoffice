
<cfinclude template="/include/qry/myteam.cfm" />  

<h4>My Team</h4>

                <p>Add a Team Member from your existing relationships or <a href="remoteAddContact.cfm?src=account" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="#remoteAddContact"><strong>Add</strong></a> a new one.</p>

                <form class="app-search" action="/app/myaccount/?new_pgid=122" method="POST">
                    <input type="hidden" name="ctaction" value="addmember" />
          
                    <div class="row" style="margin: auto;">
                        <div class="col-md-2 p-2">Add Team Member:</div>
                        <div class="col-md-3 p-2">
                            <div class="input-group">
                                <input type="text" class="form-control" name="topsearch_myteam" id="autocomplete2" placeholder="Search..." autocomplete="off">
                                <div class="input-group-append">
                                    <button id="mybtns" type="submit" class="btn btn-xs btn-primary waves-effect mb-2 waves-light" style="background-color: #406e8e; border: #406e8e; height: 37px;">
                                        <i class="fe-plus"></i> Add </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>

   <div class="container-fluid">
                               <div class="row">
                            
                                     <cfloop query="myteam">
                                         
                                          <cfquery datasource="#dsn#" name="mytags"  >
                            SELECT contactid, itemid,concat(' <span class=\'badge badge-blue\'>',`contactitems`.`valueText`,'</span>') as tag,contactitems.valuetext
                                              
                            FROM contactitems
                            WHERE contactid=#myteam.contactid# AND valuetext <> 'My Team'
                                AND valuecategory = 'Tag' AND valuetext <> 'My Rep Team'
                        </cfquery>
                                              
                                                                    <cfquery datasource="#dsn#" name="Findphone"  >  
                      select contactitems.valueText as phone from contactitems where contactitems.valueCategory = 'Phone' and contactitems.contactID = #myteam.contactid# and contactitems.itemStatus = 'Active' order by contactitems.primary_YN desc limit 1
                        </cfquery>
                        
                        <cfset new_phone = findphone.phone />
                          <cfquery datasource="#dsn#" name="Findemail"  >  
                      select contactitems.valueText as email from contactitems where contactitems.valueCategory = 'Email' and contactitems.contactID = #myteam.contactid# and contactitems.itemStatus = 'Active' order by contactitems.primary_YN desc limit 1
                        </cfquery>
    <cfset new_email = Findemail.email />
                                              
                                              
                                              
                                              <cfoutput>
                                         <div class="col-xl-3 col-md-4 col-sm-6 col-xs-12 ">
                                <div class="text-center card-box border border-secondary border-1  h-100">
                                    <div class="pt-1 pb-1">
                                        
                                        
                                        <cfset contact_avatar_filename = "C:\home\theactorsoffice.com\media-#host#\users\#userid#\contacts\#myteam.contactid#\avatar.jpg" />
                                              <cfif isimagefile(contact_avatar_filename)>
                                        <img src="/media-#host#/users/#session.userid#/contacts/#myteam.contactid#/avatar.jpg?ver=#rand()#" class="rounded-circle img-thumbnail avatar-xl" alt="profile-image">
                                                  <cfelse>
                                                        <img src="/media-#host#/defaults/avatar.jpg" class="rounded-circle img-thumbnail avatar-xl" alt="profile-image">
                                                      
                                                      
                                        </cfif>
                                        <h4 class="mt-2"><A href="/app/contact/?contactid=#myteam.contactid#">#myteam.contactname#</A></h4>
                                        
                                        
                                        
                                        <h5 >       <cfloop query="mytags">
                                <cfoutput>#mytags.valuetext#</cfoutput>
                            </cfloop></h5>
                                        <p class="small mt-1">
                                            
                                         <cfif #new_phone# is not ""> 
                                            
                                 <span> #new_phone# &nbsp;</span> </cfif>          
                                        
                                        <cfif #new_email# is not ""> <BR>
                                            <span> #new_email#  &nbsp;</span></cfif>
                                        </p>
                                        
                                            
                                            
                                                     <a href="/app/myaccount/?new_pgid=122&ctaction=deleteitem&amp;deletecontactid=#myteam.contactid#" title="Remove from team" style="padding-left:10px;color:dimgrey;">
                                    <span>
                                        <i class="fe-trash-2 font-10 text-muted"></i>
                                    </span>
                                </a>
                                            
                                            
                                            
                                     <!-- end row-->
</cfoutput>
                                    </div> <!-- end .padding -->
                                             </div> <p>&nbsp;</p> <!-- end card-box-->
                            </div> <BR>
                            </cfloop>
                                              </div></div>
                                         
                                           <h4>Team Share</h4>
<cfoutput>
                <p>You can share with your team using the team share link:  <strong><a href="https://#host#.theactorsoffice.com/share/?u=#u#" target="U"   title="View Teamshare" data-original-title="View Teamshare"  >https://#host#.theactorsoffice.com/share/?u=#u#</a></strong>
                <BR>If you click on the button you will  
see your report. </p>
                </cfoutput>
                        
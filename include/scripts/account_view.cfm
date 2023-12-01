<cfset catArea_UCB="U" />

<cfset showbuttons="false" />

<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="details"  >
    SELECT userfirstname,userlastname,useremail,nletter_yn,nletter_link  ,u.dateformatid
    ,df.formatExample
    ,df.formatNotes
    FROM taousers u
    LEFT JOIN dateformats df on df.id = u.dateFormatid
     WHERE userid = #session.userid#
</cfquery>




<cfinclude template="/include/qry/myteam.cfm" />
<cfinclude template="/include/qry/dashboard.cfm" />

<cfparam name="tab1_expand" default="true" />
<cfparam name="tab2_expand" default="false" />
<cfparam name="tab3_expand" default="false" />
<cfparam name="tab4_expand" default="false" />
<cfparam name="tab5_expand" default="false" />
<cfparam name="tab6_expand" default="false" />

<cfset h5style="font-size:0.875rem;font-weight: 500;text-align:left;margin-bottom:0;" />

<div class="card">


    <div class="card-body py-2 px-3 border-bottom border-light">



        <div class="media py-1">
            <A href="/app/image-upload/?ref_pgid=7">
                <figure>
                    <Center><img src="<Cfoutput>#browser_user_avatar_filename#</cfoutput>?ver=<Cfoutput>#rand()#</cfoutput>" class="mr-2 rounded-circle gambar img-responsive img-thumbnail" title="User ID: <cfoutput>#userid#</cfoutput>" style="height:60px;" alt="profile-image" id="item-img-output" />
                        <figcaption style="margin-left:-10px;"><i class="fa fa-camera"></i></figcaption>
                    </Center>

                </figure>
            </A>



            <cfoutput>
                <div class="media-body">
                    <h4 class="mt-0 mb-0">
                        <a href="" class="text-reset">#userFirstName# #userLastName#</a>
                    </h4>
                    <cfset contactid="#userContactid#" />
                    <cfinclude template="/include/qry/profiles.cfm" />
                    <cfinclude template="/include/qry/actinglinks.cfm" />
            </cfoutput>

        </div>



    </div>


    <div class="card-body">



        <ul class="nav nav-tabs">
            <cfoutput>

                <li class="nav-item"> <a href="##profile" data-toggle="tab" aria-expanded="#tab1_expand#" class="nav-link<cfif #tab1_expand# is 'true'> active</cfif>">My Links</a>
                </li>




                <li class="nav-item"> <a href="##myteam" data-toggle="tab" aria-expanded="#tab2_expand#" class="nav-link<cfif #tab2_expand# is 'true'> active</cfif>">My Team</a>
                </li>

                <li class="nav-item"> <a href="##security" data-toggle="tab" aria-expanded="#tab3_expand#" class="nav-link<cfif #tab3_expand# is 'true'> active</cfif>">Security</a>
                </li>


                <li class="nav-item"> <a href="##preferences" data-toggle="tab" aria-expanded="#tab4_expand#" class="nav-link<cfif #tab4_expand# is 'true'> active</cfif>">Preferences</a>
                </li>

                <li class="nav-item"> <a href="##subscription" data-toggle="tab" aria-expanded="#tab5_expand#" class="nav-link<cfif #tab5_expand# is 'true'> active</cfif>">Billing</a>
                </li>

                <li class="nav-item"> <a href="##integrations" data-toggle="tab" aria-expanded="#tab6_expand#" class="nav-link<cfif #tab6_expand# is 'true'> active</cfif>">Integrations</a>
                </li>

        </ul>

        </cfoutput>


        <div class="tab-content">

            <div class="tab-pane<cfif #tab1_expand# is 'true'> show active</cfif>" id="profile">

                <h4>My Links</h4>

                
                
                
                <div class="row">
                            <div class="col-xl-12">
                                <div id="accordion" class="mb-3">
                                    <cfset z = 0>
                                    <cfloop query="sitetypes">
                                        <cfoutput><cfset z = #z# + 1 /></cfoutput>
                                        
                                        <cfif #z# is "1">
                                            <cfoutput><cfparam name="target_id" default="#sitetypes.sitetypeid#" ></cfoutput>
                                    
                                        </cfif>
                                            
                                         
<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="mylinks_user"   >	
SELECT 
s.id
,s.sitetypeid
,s.sitename
,s.siteurl
,s.siteicon
,s.sitetypeid
,t.sitetypename
,t.pntitle

FROM sitelinks_user s INNER JOIN sitetypes_user t ON t.sitetypeid = s.siteTypeid
WHERE s.userid = #session.userid# AND s.sitetypeid = #sitetypes.sitetypeid#
ORDER BY s.sitename
</cfquery>	
                                            
 <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="mylinks_user_del"   >	
SELECT 
s.id
,s.sitetypeid
,s.sitename
,s.siteurl
,s.siteicon
,s.sitetypeid
,t.sitetypename
,t.pntitle

FROM sitelinks_user_tbl s INNER JOIN sitetypes_user t ON t.sitetypeid = s.siteTypeid
WHERE s.userid = #session.userid# AND s.sitetypeid = #sitetypes.sitetypeid# and s.isdeleted = 1 and s.isCustom = 0
ORDER BY s.sitename
</cfquery>	                                           
                                        
                                        
                                        
                               <cfif #sitetypes.sitetypeid# is "#target_id#">
                                         <div class="card mb-1">
                                        <div class="card-header" id="<cfoutput>heading#sitetypes.sitetypeid#</cfoutput>">
                                            <h5 class="m-0">
                                                <a class="text-dark" data-toggle="collapse" href="#collapse<cfoutput>#sitetypes.sitetypeid#</cfoutput>" aria-expanded="true">
                                                   
                                                  <cfoutput>#sitetypes.sitetypename# <span class="badge badge-success badge-pill float-right">#numberformat(mylinks_user.recordcount)#</span></cfoutput>
                                                </a>
                                            </h5>
                                        </div>
                            
                                        <div id="collapse<cfoutput>#sitetypes.sitetypeid#</cfoutput>" class="collapse show" aria-labelledby="<cfoutput>heading#sitetypes.sitetypeid#</cfoutput>" data-parent="#accordion" style="">
                                            
                                        
                                        <cfelse>
                                           <div class="card mb-1">
                                        <div class="card-header" id="<cfoutput>heading#sitetypes.sitetypeid#</cfoutput>">
                                            <h5 class="m-0">
                                                <a class="text-dark collapsed" data-toggle="collapse" href="#collapse<cfoutput>#sitetypes.sitetypeid#</cfoutput>" aria-expanded="false">
                                                   
                                                  <cfoutput>#sitetypes.sitetypename# <span class="badge badge-success badge-pill float-right">#numberformat(mylinks_user.recordcount)#</span></cfoutput>
                                                </a>
                                            </h5>
                                        </div>
                            
                                        <div id="collapse<cfoutput>#sitetypes.sitetypeid#</cfoutput>" class="collapse" aria-labelledby="<cfoutput>heading#sitetypes.sitetypeid#</cfoutput>" data-parent="#accordion" style="">
                                              
                                            
                                        </cfif>     
                                   
                                            
                                            
                                            
                                            
                                            
                                            
                                            <div class="card-body">
                                                
                                                   <cfoutput><button type="button" class="btn btn-xs btn-primary waves-effect mb-2 waves-light" style="background-color: ##406e8e; border: ##406e8e" href="addlink.cfm" data-remote="true" data-toggle="modal" data-target="##addlink_#sitetypes.sitetypeid#">Add Custom</button></cfoutput>
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                <div class="row">
<cfloop query="mylinks_user">
    <div class="col-md-6 col-lg-4">
                                                    <cfoutput>
                                            <h5><a title="Edit" href="updateuserlink.cfm" data-remote="true" data-toggle="modal" data-target="##updatelink_#mylinks_user.id#">
                                                   <img src="/app/assets/images/retina-circular-icons/14/#mylinks_user.siteicon#" width="14px"  /> #mylinks_user.sitename#
                                         
                                                        
                                                        
                                                            <i class="mdi mdi-square-edit-outline"></i></a>  <A title="Remove #mylinks_user.sitename#" class="pl-1" style="color:red;" href="/include/excludelink.cfm?new_id=#mylinks_user.id#&target_id=#target_id#"><i class="mdi mdi-trash-can-outline"></i></A>
                                                </h5>
                                                
                                                </Cfoutput>
        
    </div>
        </cfloop>
                                                    
                                                 
    </div>
    
                                                
                                                
                                                
                                                
                                                
                                                
       <cfif #mylinks_user_del.recordcount# is not "0">
           <form action="/include/linkinclude.cfm" >
               <cfoutput><input type="hidden" name="target_id" value="#target_id#"></cfoutput>
           <h5>Restore:
                     <select  name="new_id" id="new_id" required="" onchange='this.form.submit()'>
<option value=""></option>
<cfoutput query="mylinks_user_del">
              <option value="#mylinks_user_del.id#" >#mylinks_user_del.sitename#</option>  
              
              </cfoutput>
                            </select>
           
           
           </h5></form></cfif>                                            
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                               
                                            </div>
                                        </div>
                                    </div>
                               </cfloop>
                                </div> <!-- end #accordions-->
                            </div> <!-- end col -->

                       
                        </div>

            </div><!-- end -->





            <div class="tab-pane<cfif #tab2_expand# is 'true'> show active</cfif>" id="myteam">

                <h4>My Team</h4>
           

                <form class="app-search" action="/app/myaccount/" method="POST"   >
            <input type="hidden" name="ctaction" value="addmember" />
                        <input type="hidden" name="t2" value="1" />
                <div class="row" style="margin: auto;">
                    <div class="col-md-2 p-2">Add Team Member:</div>
                    <div class="col-md-3 p-2">
                        <div class="input-group">
                            <input type="text" class="form-control"  name="topsearch_myteam" id="autocomplete2" placeholder="Search..." autocomplete="off">
                            <div class="input-group-append">
                                <button  id="mybtn" type="submit" class="btn btn-xs btn-primary waves-effect mb-2 waves-light" style="background-color: #406e8e; border: #406e8e; height: 37px;">
                                    <i class="fe-plus"></i> Add
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-7 p-2"></div>

                    </form>
              
            
            
            
                    <cfloop query="myteam">
                        <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="mytags"  >
                            SELECT contactid, itemid,concat('<span class=\'badge badge-blue\'>',`contactitems`.`valueText`,'</span>') as tag
                            FROM contactitems WHERE contactid=#myteam.contactid# AND valuetext <> 'My Rep Team' AND valuecategory = 'Tag'
                        </cfquery>

                        <div class="col-md-2 p-2">
                            <cfloop query="mytags">
                                <cfoutput>#mytags.tag#</cfoutput>
                            </cfloop>
                        </div>
                        <div class="col-md-10 p-2">
                            <cfoutput><A href="/app/contact/?contactid=#myteam.contactid#">#myteam.contactname# </A></cfoutput>
                         
                            <cfoutput><a href="/app/myaccount/?ctaction=deleteitem&amp;deletecontactid=#myteam.contactid#" title="Remove from team" style="padding-left:10px;color:dimgrey;"><span>
													<i class="fe-trash-2 font-10 text-muted"></i></span>
                                </a></cfoutput>
                   
                            
                            
                            
                        </div>


                    </cfloop>

                </div>






                    

            </div>

            <div class="tab-pane<cfif #tab3_expand# is 'true'> show active</cfif>" id="security">

                <h4>Account & Security</h4>
                <a title="Edit" href="" data-toggle="modal" data-target="#remoteUpdateAccount">
                    <button type="button" class="btn btn-xs btn-primary waves-effect mb-2 waves-light" style="background-color: #406e8e; border: #406e8e">Edit</button>
                </a>









                <div class="row" style="margin: auto;">
                    <cfoutput>
                        <div class="col-md-2 p-2"><strong>First Name</strong></div>
                        <div class="col-md-10 p-2">#userfirstname#</div>

                        <div class="col-md-2 p-2"><strong>Last Name</strong></div>
                        <div class="col-md-10 p-2">#userlastname#</div>

                        <div class="col-md-2 p-2"><strong>Email</strong></div>
                        <div class="col-md-10 p-2">#userEmail#</div>

                        <div class="col-md-2 p-2"><strong>Password</strong></div>
                        <div class="col-md-10 p-2">*********</div>

                    </cfoutput>
                </div>





            </div>





            <div class="tab-pane<cfif #tab4_expand# is 'true'> show active</cfif>" id="preferences">
     <h4>Preferences</h4>

                <h5>
                    My Newsletter

                </h5>

                <a title="Edit" href="" data-toggle="modal" data-target="#updatenewsletter">
                    <button type="button" class="btn btn-xs btn-primary waves-effect mb-2 waves-light" style="background-color: #406e8e; border: #406e8e">Edit</button>
                </a>




                <div class="row" style="margin: auto;">

                    <div class="col-md-2 p-2"><strong>Newsletter?</strong></div>
                    <div class="col-md-10 p-2">
                        <cfif #details.nletter_yn# is "Y">Yes<cfelse>No</cfif>
                    </div>

                    <div class="col-md-2 p-2"><strong>Newsletter Link</strong></div>
                    <div class="col-md-10 p-2">

                        <cfif #details.nletter_yn# is "Y">

                            <cfif #details.nletter_link# is not "">
                                
                                <cfif #left('#details.nletter_link#','4')# is "http">
                                <cfoutput>
                                    <cfset new_nletter_link = "#details.nletter_link#" />
                                    </cfoutput>
                                 <cfelse>
                                     
                                     
                                         <cfoutput>
                                    <cfset new_nletter_link = "http://#details.nletter_link#" />
                                    </cfoutput>
                                    
                                
                                </cfif>
                                <cfoutput>
                                    <A HREF="#new_nletter_link#" target="external">#details.nletter_link#</A>
                                </cfoutput>
                                <cfelse> <i>Please add your newsletter link. </i>
                            </cfif>


                        </cfif>



                    </div>

                </div>






                <h5>
                    Dashboard Preferences

                </h5>

                <div class="row" style="margin: auto;">

                    <div class="col-md-2 p-2"><a title="Edit" href="dashboardupdate.cfm" data-remote="true" data-toggle="modal" data-target="#dashboardupdate"><strong>Dashboard panels</strong></a></div>
                    <div class="col-md-10 p-2">
                        
                         <cfloop query="dashboards">  <cfoutput><span class="badge badge-secondary">
                        #dashboards.pntitle#</span> </Cfoutput></cfloop>
                            <a title="Edit" href="dashboardupdate.cfm" data-remote="true" data-toggle="modal" data-target="#dashboardupdate"><i class="mdi mdi-square-edit-outline"></i></a>
                     </div>

                </div>




            </div>










            <div class="tab-pane<cfif #tab5_expand# is 'true'> show active</cfif>" id="subscription">
                <h4>Billing</h4>

                <div class="row" style="margin: auto;">
                    <cfoutput>
                        <div class="col-md-2 p-2"><strong>Current Subscription</strong></div>
                        <div class="col-md-10 p-2">Contacts Module</div>

                        <div class="col-md-2 p-2"><strong>Billing Rate</strong></div>
                        <div class="col-md-10 p-2">$9.99/month</div>

                        <div class="col-md-2 p-2"><a href="">
                                <button type="button" class="btn btn-xs btn-primary waves-effect mb-2 waves-light" style="background-color: ##406e8e; border: ##406e8e">Upgrade</button></a></div>




                    </cfoutput>
                </div>

            </div>




            <div class="tab-pane<cfif #tab6_expand# is 'true'> show active</cfif>" id="integrations">

                <h4>Integrations</h4>

                <p>Coming Soon!</p>
            </div>






        </div>





    </div>



</div>







</div>










<div id="updatenewsletter" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="standard-modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="background-color: ##f3f7f9;">
                <h4 class="modal-title" id="standard-modalLabel">Newsletter Update</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
            </div>
            <div class="modal-body">




                <form action="/app/myaccount/" method="post" class="needs-validation" validate id="demo-form">



                    <div class="row" />



                    <cfoutput>
                        <input type="hidden" name="ctaction" value="update_newsletter" />
                        <input type="hidden" name="t4" value="1" />


                        <div class="form-group col-md-3">
                            <label for="eventTypeName">Newsletter</label>
                            <select class="form-control" name="new_nletter_yn" id="new_nletter_yn" required="">


                                <option value="N" <cfif #details.nletter_yn# is "N"> Selected </cfif>>No</option>

                                <option value="Y" <cfif #details.nletter_yn# is "Y"> Selected </cfif>>Yes</option>



                            </select>
                            <div class="invalid-feedback">
                                Please select Yes or No.
                            </div>

                        </div>




                        <div class="form-group col-md-12">
                            <label for="userLastName">Newsletter Link</label>


                            <input class="form-control" type="text" id="new_nletter_link" name="new_nletter_link" value="#details.nletter_link#" placeholder="Enter your newsletter link">

                            <div class="invalid-feedback">
                                Please enter your newsletter link.
                            </div>
                        </div>



                        <div class="form-group text-center col-md-12">
                            <button class=" btn btn-primary editable-submit btn-sm waves-effect waves-light" type="submit" style="background-color: ##406e8e; border: ##406e8e;">Update</button>
                        </div>





                    </cfoutput>





                </form>





            </div>
        </div>

    </div>

</div>

















<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="jsons_myteam"  >
    SELECT col1 from contacts_ss WHERE userid = #session.userid# and col1 not like '%#chr(34)#%'
</cfquery>


































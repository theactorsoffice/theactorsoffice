<div class="d-flex justify-content-between">

    <div class="float-left">

        <cfif #eventresults.recordcount# is "0">

            No appointments.

        </cfif>

        <cfoutput>

            You have <strong>#eventresults.recordcount#</strong> active appointment<cfif #eventresults.recordcount# is not "1">s</cfif> with #details.recordname#.

        </cfoutput>

    </div>

    <div class="float-end">

        <a href="/app/appoint-add/?returnurl=contact&rcontactid=<cfoutput>#currentid#</cfoutput>" class="btn btn-xs btn-primary waves-effect mb-2 waves-light" style="background-color: #406e8e; border: #406e8e;">

            Add

        </a>

    </div>

</div>



   
    <div class="nomobile">

        <table id="events-datatable" class="table display dt-responsive nowrap w-100 table-striped table-hover">

        <thead>

            <cfoutput query="eventresults" maxrows="1">

                <cfif (eventresults.CurrentRow MOD 2)>

                    <Cfset rowtypee="Odd" />

                </cfif>

                <cfif (eventresults.CurrentRow MOD 1)>

                    <Cfset rowtypee="Even" />

                </cfif>

                <tr class="#rowtypee#">

                    <th>Action</th>

                    <th>#head1#</th>

                    <th>#head2#</th>

                    <th>#head3#</th>

                    <th>Time</th>

                    <th>#head5#</th>

                    <th></th>

                </tr>

            </cfoutput>

        </thead>

        <tbody>

            <cfloop query="eventresults">

                <cfoutput>

                    <cfquery datasource="#dsn#" name="finall">
                        SELECT *
                        FROM eventcontactsxref
                        WHERE eventid = #eventresults.eventid#
                    </cfquery>

                    <tr role="row">

                        <td>
                            <cfif #isdefined('xxxxxx')#>
                                 <a title="Details" href="/app/appoint/?eventid=#eventresults.eventid#&returnurl=contact&rcontactid=#currentid#">

                                <i class="mdi mdi-information-outline"></i>

                            </a>
</cfif>
                            <a title="Edit" href="/app/appoint-update/?eventid=#eventresults.eventid#&returnurl=contact&rcontactid=#currentid#">

                                <i class="mdi mdi-square-edit-outline"></i>

                            </a>
                            
                            
                            <cfif #eventresults.audid# is not "">
                                
                        
                                
                                
                                <a href="/app/audition/?audprojectid=#eventresults.audprojectid#" class="btn btn-xs btn-primary waves-effect waves-light"><i class="mdi mdi-eye-outline"></i> View Audition</a>
                                
                                
                                
                                
                             
                            
                            </cfif>

                        </td>

                        <td>#eventresults.col1#</td>

                        <td>#eventresults.col2#</td>

                        <td>#dateformat('#eventresults.col3#','m-d-YYYY')#</td>

                        <td>#timeformat('#eventresults.eventStartTime#','medium')#</td>

                        <td>#eventresults.col5# <cfif #eventresults.audstep# is not "" and #eventresults.audstep# is not "Audition"> (#eventresults.audstep#)</cfif></td>

                        <TD>
                            <cfif "#finall.recordcount#" is "1">

                                <A href="/include/deleteappointment.cfm?recid=#eventresults.recid#&contactid=#currentid#">
                                    <i class="mdi mdi-trash-can-outline mr-1"></i></A>

                            </cfif>

                        </TD>

                    </tr>

                </cfoutput>

            </cfloop>

        </tbody>

    </table>

    </div>
    
<div class="mobile" style="100%;">
    
    <cfparam name="target_id" default="0" />

    <div class="row">

        <div class="col-xl-12">

            <div id="accordion_systems" class="mb-3" style="width:100%;">
                <cfset k=0 />
                
                <cfloop query="eventresults">
                    
  <cfset new_eventid = eventresults.eventid />
 

            <cfoutput>
                
               
                
                <cfset k=#k# + 1 />
            
            </cfoutput>

            <cfset cardclass="" />
                    
                    <cfif #eventresults.currentrow# is "1">
                        <cfoutput>
                        <cfset target_id="#new_eventid#" />
                        </cfoutput>
                    </cfif>
         
<cfif #new_eventID# is "#target_id#">

    <cfset header_aria_exanded="true" />
    
    <cfset collapse_show = "collapse show" />

</cfif>

<cfif #new_eventID# is not "#target_id#">

    <cfset header_aria_exanded="false" />
    
    <cfset collapse_show = "collapse" />

</cfif>              

    <div class="card mb-1" style="width:100%;">
               
                    <div class="card-header" id="heading_system_<cfoutput>#eventresults.currentrow#</cfoutput>">

                        <h5 class="m-0 align-middle" style="width:100%;">
 
                            <a class="text-dark collapsed" data-bs-toggle="collapse" href="#collapse_system_<cfoutput>#eventresults.currentrow#</cfoutput>" aria-expanded="<cfoutput>#header_aria_exanded#</cfoutput>">
 
                                
                                
                                <cfoutput> <strong>#dateformat('#eventresults.col3#','short')#</strong> -  #timeformat('#eventresults.eventStartTime#','short')# <i class="fe-menu"></i> </cfoutput>  

                            <span class="badge badge-sm badge-blue badge-pill float-end" style="font-size:.7em;">      <cfoutput>#eventresults.col5#</cfoutput></span>
                            
                            
                      

                            </a>
                            
                        </h5>

                    </div>

                    <div id="collapse_system_<cfoutput>#eventresults.currentrow#</cfoutput>" class="<cfoutput>#collapse_show#</cfoutput>" aria-labelledby="collapse_system_<cfoutput>#eventresults.currentrow#</cfoutput>" data-bs-parent="#accordion_systems"  >


                        <div class="card-body">
                          <cfoutput>
                              <h5>#eventresults.col1# 
                              
                                  <a title="Edit" href="/app/appoint-update/?eventid=#eventresults.eventid#&returnurl=contact&rcontactid=#currentid#">

                                <i class="mdi mdi-square-edit-outline"></i>

                            </a>
                              </h5></cfoutput>
                                   <cfif #eventresults.col2# is not "">
      <h6>Location</h6><p><cfoutput>#eventresults.col2#</p> </cfoutput>
                              </cfif>
                            
                            
                            <cfif #eventresults.eventDescription# is not "">
                            <h6>Description</h6> 
                            <p><cfoutput>
                           #eventresults.eventDescription#
</cfoutput>
                            </p>
                                
                                
                                </cfif>

                        </div>

                    </div>

                </div>
                 
            </cfloop>  

            </div>

        </div>

    </div>

</div>                




    <cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), " \")#" />
    <cfinclude template="/include/bigbrotherinclude.cfm" />
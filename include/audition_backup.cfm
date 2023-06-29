<cfparam name="istab" default="Y" />
<cfparam name="pgaction" default="View" />


<cfif #isdefined('recid')#>

    <cfset eventid=recid />
</cfif>

<cfif #pgaction# is "change">
    <cfoutput>
<cfset cookie.istab = "#new_istab#" /></cfoutput>
    <cfset pgaction = "view">
</cfif>

<cfif #isdefined('cookie.istab')#>
    <cfoutput>
<cfset istab = "#cookie.istab#" />
    </cfoutput>
</cfif>

<cfset new_audcatid=numberformat(projectDetails.audcatid) />

<cfinclude template="/include/qry/audunions_sel.cfm" />
<cfinclude template="/include/qry/audnetworks_sel.cfm" />
<cfinclude template="/include/qry/audtones_sel.cfm" />
<cfinclude template="/include/qry/audcontracttypes_sel.cfm" />


<cfinclude template="/include/qry/notesaud.cfm" />

<script>
    $(document).ready(function() {
        $("#catupdate").on("show.bs.modal", function(event) {
            // Place the returned HTML into the selected element
            $(this).find(".modal-body").load("/include/catupdateform.cfm?AUDPROJECTID=<cfoutput>#projectdetails.audprojectid#</cfoutput>&audcatid=<cfoutput>#projectdetails.audcatid#</cfoutput>&rpgid=184&secid=176&details_recid=<Cfoutput>#eventid#</cfoutput>&details_pgid=176&eventid=<Cfoutput>#eventid#</cfoutput>&pgdir=audition");
        });
    });

</script>
<div id="catupdate" class="modal  fade" tabindex="-1" aria-labelledby="standard-modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #f3f7f9;">
                <h4 class="modal-title" id="standard-modalLabel">Category Update</h4>
                <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>
            </div>
            <div class="modal-body">
            </div>
        </div>
    </div>
</div>






<script>
    $(document).ready(function() {
        $("#auditionupdate").on("show.bs.modal", function(event) {
            // Place the returned HTML into the selected element
            $(this).find(".modal-body").load("/include/remoteaudupdateform.cfm?secid=<cfoutput>#secid#</cfoutput>&eventid=<cfoutput>#eventid#</cfoutput>&rpgid=184&details_recid=<Cfoutput>#eventid#</cfoutput>&details_pgid=176&recid=<Cfoutput>#eventid#</cfoutput>&pgdir=audition");
        });
    });

</script>
<div id="auditionupdate" class="modal fade" tabindex="-1" aria-labelledby="standard-modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #f3f7f9;">
                <h4 class="modal-title" id="standard-modalLabel">Appointment Update</h4>
                <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>
            </div>
            <div class="modal-body">


            </div>
        </div>

    </div>

</div>

<script>
    $(document).ready(function() {
        $("#projectupdate").on("show.bs.modal", function(event) {
            // Place the returned HTML into the selected element
            $(this).find(".modal-body").load("/include/remote_aud_project_update.cfm?<cfoutput>secid=#secid#</cfoutput>&audprojectid=<cfoutput>#projectdetails.audprojectid#</cfoutput>&rpgid=148&eventid=<Cfoutput>#eventid#</cfoutput>&pgdir=audition");
        });
    });

</script>
<div id="projectupdate" class="modal fade" tabindex="-1" aria-labelledby="standard-modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #f3f7f9;">
                <h4 class="modal-title" id="standard-modalLabel">Project Update</h4>
                <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>
            </div>
            <div class="modal-body">


            </div>
        </div>

    </div>

</div>

<cfparam name="secid" default="176" />
<cfset eventid=auditiondetails.eventid />
<div class="row">
    
    <cfif #isdefined('sffsdfds')#>
        
        
    <cfoutput>
           <div class="col-md-12">
<form action="/app/audition/"  >
                  <input type="hidden" name="pgaction" value="change" />
               <input type="hidden" name="recid" value="#eventid#" />
  <label for="new_audroletypeid">Style:  </label>
    <select id="new_istab" name="new_istab"    onchange="this.form.submit()">
        <option value="Y" <cfif #istab# is "Y"> Selected</cfif>>Tabs</option>
<option value="N" <cfif #istab# is "N"> Selected</cfif>>Dropdown</option>
  

            </select>
    </form>
        </div>
</cfoutput>

</cfif>
    <div class="col-md-4 col-sm-4 col-xs-12">

        <div class="card h-100 ribbon-box">
            
                   <cfif #isdefined('sdfsdf')#>
                      
                                    <div class="ribbon-two ribbon-two-success"><span>Booked</span></div>
                                    </cfif>

            <Center>

                <h4 class="card-header text-nowrap" style="color:white;background-color: #406E8E;margin:0!important;padding:15px!important;">
                    <cfoutput>Appointment Information</cfoutput>


                </h4>



            </Center>

            <div class="card-body">



                <div class="row">
                    <cfoutput>
                        <h4 class="p-1 d-flex">#dateformat('#auditiondetails.eventStart#','long')#



                            <span class="ms-auto text-muted"> <a href="javascript:;" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##auditionupdate" data-bs-placement="top" title="Update Appointment" data-bs-original-title="Update Appointment">

                                    <i class="mdi mdi-square-edit-outline"></i>

                                </a></span>



                        </h4>



                        <div class="col-md-12 p-1"><strong>Time: </strong>#timeformat(auditiondetails.eventStartTime)# <cfif #auditiondetails.eventStopTime# is not "">- #timeformat(auditiondetails.eventStopTime)#</cfif>
                        </div>

                        <div class="col-md-12 p-1"><strong> Stage: </strong>#auditiondetails.audstep#</div>

                        <div class="col-md-12 p-1"><strong> Type: </strong>#auditiondetails.audtype#</div>
                        <cfif #auditiondetails.audtype# is "online">
                            <div class="col-md-12 p-1"><strong> Platform: </strong>#auditiondetails.audplatform#</div>
                        </cfif>
                        <div class="col-md-12 p-1"><strong> Worked with Coach: </strong>
                            <cfif #auditiondetails.workwithcoach# is "1">Yes<cfelse>No</cfif>
                        </div>


                        <cfif #auditiondetails.audtype# is not "online">
                            <div class="col-md-12 p-1"><strong>Location: </strong>#auditiondetails.audLocation#</div>
                            <cfelse>
                                <div class="col-md-12 p-1"><strong>Zoom Link: </strong>#auditiondetails.audLocation#</div>
                        </cfif>


                        <div class="col-md-12 p-1"><strong>Parking Details: </strong>#auditiondetails.parkingdetails#</div>

                    </cfoutput>
                </div>

            </div>
        </div>

    </div>

    <cfoutput>

        <cfset h5style="font-size:0.875rem;font-weight: 500;text-align:left;margin-bottom:0;" />

    </cfoutput>

    <div class="col-md-8 col-sm-8 col-xs-12">

        <div class="card h-100">


            <Center>

                <h4 class="card-header text-nowrap" style="color:white;background-color: #406E8E;margin:0!important;padding:15px!important;">
                    <cfoutput>Project Details</cfoutput>
                </h4>



            </Center>
            <Cfoutput>
                <div class="card-body">

                    <div class="row" style="margin: auto;">


                        <h4 class="p-1 d-flex">#projectdetails.projName#

                            <span class="ms-auto text-muted"> <a href="javascript:;" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##projectupdate" data-bs-placement="top" title="Update Project" data-bs-original-title="Update Project">

                                    <i class="mdi mdi-square-edit-outline"></i>

                                </a></span>
                        </h4>



                        <div class="col-md-12 col-lg-12  col-xl-6 p-1 text-nowrap"><strong>Category: </strong><a href="javascript:;" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##catupdate" data-bs-placement="top" title="Update Category" data-bs-original-title="Update Category">#projectdetails.audCatName# - #projectdetails.audSubCatName#</a></div>

                        <div class="col-md-12 col-lg-12  col-xl-6 p-1 text-nowrap"><strong>Casting Director: </strong>#projectdetails.castingfullname#</div>

                        <cfif #audunions_sel.recordcount# is not "0">
                            <div class="col-md-12 col-lg-12  col-xl-6 p-1 text-nowrap"><strong>Union Status: </strong>#projectdetails.unionName#</div>
                        </cfif>
                        <cfif #audcontracttypes_sel.recordcount# is not "0">
                            <div class="col-md-12 col-lg-12  col-xl-6 p-1 text-nowrap"><strong>Contract Type: </strong>#projectdetails.contracttype#</div>
                        </cfif>
                        <cfif #audnetworks_sel.recordcount# is not "0">
                            <div class="col-md-12 col-lg-12  col-xl-6 p-1 text-nowrap"><strong>Network: </strong>#projectdetails.network#</div>
                        </cfif>
                        <cfif #audtones_sel.recordcount# is not "0">
                            <div class="col-md-12 col-lg-12  col-xl-6 p-1 text-nowrap"><strong>Tone: </strong>#projectdetails.tone#</div>
                        </cfif>

                        <div class="col-md-12 p-1"><strong>Project Description / Logline: </strong>#projectdetails.projDescription#</div>








                    </div>










                </div>
            </Cfoutput>
        </div>

    </div>

</div>
<p>&nbsp;</p>



<cfif #istab# is "N">

    <div class="card">

        <div class="btn-group col-md-12">

            <button type="button" class="btn btn-primary btn-lg dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

                <Cfoutput>#sec_det.pgtitle#</Cfoutput>
                <i class="fe-menu"></i>

            </button>
            <div class="dropdown-menu">

                <cfloop query="options">
                    <cfoutput>
                        <a class="dropdown-item" href="/app/audition/?audprojectid=#audprojectid#&eventid=#eventid#&secid=#options.pgid#">#options.pgtitle#</a>
                    </cfoutput>
                </cfloop>

            </div>
        </div><!-- /btn-group -->




        <div class="card-body">



            <cfif #secid# is "176">
                <cfinclude template="/include/aud_role_pane.cfm" />
            </cfif>


            <cfif #secid# is "175">
                <cfinclude template="/include/aud_rel_pane.cfm" />
            </cfif>

            <cfif #secid# is "177">
                <cfinclude template="/include/aud_mat_pane.cfm" />
            </cfif>

            <cfif #secid# is "178">
                <cfinclude template="/include/aud_notes_pane.cfm" />
            </cfif>

            <cfif #secid# is "179">
                <cfinclude template="/include/aud_ques_pane.cfm" />
            </cfif>

            <cfif #secid# is "180">
                <cfinclude template="/include/aud_call_pane.cfm" />
            </cfif>

            <cfif #secid# is "181">
                <cfinclude template="/include/aud_book_pane.cfm" />
            </cfif>

        </div>
    </div>



</cfif>



<cfif #istab# is "Y">

 <cfif #secid# is "176"><cfset role_active = "active"><cfelse><cfset role_active = ""></cfif>
 <cfif #secid# is "175"><cfset rel_active = "active"><cfelse><cfset rel_active = ""></cfif>
 <cfif #secid# is "177"><cfset mat_active = "active"><cfelse><cfset mat_active = ""></cfif>
 <cfif #secid# is "178"><cfset notes_active = "active"><cfelse><cfset notes_active = ""></cfif>  
 <cfif #secid# is "179"><cfset ques_active = "active"><cfelse><cfset ques_active = ""></cfif> 
 <cfif #secid# is "180"><cfset call_active = "active"><cfelse><cfset call_active = ""></cfif> 
 <cfif #secid# is "181"><cfset book_active = "active"><cfelse><cfset book_active = ""></cfif> 
 
 <cfif #secid# is "176"><cfset role_showactive = "show active"><cfelse><cfset role_showactive = ""></cfif>
 <cfif #secid# is "175"><cfset rel_showactive = "show active"><cfelse><cfset rel_showactive = ""></cfif>
 <cfif #secid# is "177"><cfset mat_showactive = "show active"><cfelse><cfset mat_showactive = ""></cfif>
 <cfif #secid# is "178"><cfset notes_showactive = "show active"><cfelse><cfset notes_showactive = ""></cfif>  
 <cfif #secid# is "179"><cfset ques_showactive = "show active"><cfelse><cfset ques_showactive = ""></cfif> 
 <cfif #secid# is "180"><cfset call_showactive = "show active"><cfelse><cfset call_showactive = ""></cfif> 
 <cfif #secid# is "181"><cfset book_showactive = "show active"><cfelse><cfset book_showactive = ""></cfif> 





    <div class="card" class="p-3">

        <ul class="nav nav-pills navtab-bg nav-justified p-1" role="tablist">
            
            
            <li class="nav-item" role="presentation">
                <a href="#role" data-bs-toggle="tab" aria-expanded="true" class="nav-link <Cfoutput>#role_active#</Cfoutput>"  role="tab">
                    Role Breakdown
                </a>
            </li>
            
            <li class="nav-item" role="presentation">
                <a href="#rel" data-bs-toggle="tab" aria-expanded="false" class="nav-link <Cfoutput>#rel_active#</Cfoutput>"  role="tab" tabindex="-1">
                    Audition Relationships
                </a>
            </li>
            
            
         
              <li class="nav-item" role="presentation">
                <a href="#mat" data-bs-toggle="tab" aria-expanded="false" class="nav-link <Cfoutput>#mat_active#</Cfoutput>"  tabindex="-1" role="tab">
                    Materials Submitted
                </a>
            </li>
        
            
            
            <li class="nav-item" role="presentation">
                <a href="#notes" data-bs-toggle="tab" aria-expanded="false" class="nav-link <Cfoutput>#notes_active#</Cfoutput>"  tabindex="-1" role="tab">
                    Audition Notes
                </a>
            </li>
            
            <li class="nav-item" role="presentation">
                <a href="#ques" data-bs-toggle="tab" aria-expanded="false" class="nav-link <Cfoutput>#ques_active#</Cfoutput>"  tabindex="-1" role="tab">
                    Personal Assessment
                </a>
            </li>

            <li class="nav-item" role="presentation">
                <a href="#call" data-bs-toggle="tab" aria-expanded="false" class="nav-link <Cfoutput>#call_active#</Cfoutput>"  tabindex="-1" role="tab">
                    Callbacks, Redirects and Pins
                </a>
            </li>
            
            <li class="nav-item" role="presentation">
                <a href="#book" data-bs-toggle="tab" aria-expanded="false" class="nav-link <Cfoutput>#book_active#</Cfoutput>"  tabindex="-1" role="tab">
                    Booking
                </a>
            </li>
            
        
            
            
          

        </ul>



        
<div class="tab-content">
    
    <div class="tab-pane <cfoutput>#role_showactive#</cfoutput>" id="role" role="tabpanel">
        
        <div class="p-3">
            
            <cfinclude template="/include/aud_role_pane.cfm" />
            
        </div>
        
    </div>
    
    <div class="tab-pane <cfoutput>#rel_showactive#</cfoutput>" id="rel" role="tabpanel">
        
        <div class="p-3">
            
           <cfinclude template="/include/aud_rel_pane.cfm" />
            
        </div>

    </div>
    
    
   

 <div class="tab-pane <cfoutput>#mat_showactive#</cfoutput>" id="mat" role="tabpanel">
                
                <div class="p-3">

              <cfinclude template="/include/aud_mat_pane.cfm" /> 

                </div>
                
            </div>
            
            
                  <div class="tab-pane <cfoutput>#notes_showactive#</cfoutput>" id="notes" role="tabpanel">
                
                <div class="p-3">

     <cfinclude template="/include/aud_notes_pane.cfm" /> 

                </div>
                
            </div>
            
 
           
            
            
                  <div class="tab-pane <cfoutput>#ques_showactive#</cfoutput>" id="ques" role="tabpanel">
                
                <div class="p-3">

      <cfinclude template="/include/aud_ques_pane.cfm" />   

                </div>
                
            </div>
            
            
            
            
            
            
                  <div class="tab-pane <cfoutput>#call_showactive#</cfoutput>" id="call" role="tabpanel">
                
                <div class="p-3">

        <cfinclude template="/include/aud_call_pane.cfm" />       

                </div>
                
            </div>
            
            
            
                  <div class="tab-pane <cfoutput>#book_showactive#</cfoutput>" id="book" role="tabpanel">
                
                <div class="p-3">

            <cfinclude template="/include/aud_book_pane.cfm" />      

                </div>
                
            </div>
 
    
    
    
    
    
    
    
    
    
    
    
    
    

</div>





</cfif>

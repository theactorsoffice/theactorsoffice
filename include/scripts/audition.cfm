<cfinclude template="/include/qry/notesaud.cfm" />

<cfparam name="secid" default="175" />
<cfset new_eventid =  aud_det.new_eventid />
<div class="row">

    <div class="col-md-4 col-sm-6 col-xs-12">

        <div class="card h-100">

            <Center>

                <h4 class="card-header text-nowrap" style="color:white;background-color: #406E8E;margin:0!important;padding:15px!important;">
                    <cfoutput>Appointment Information</cfoutput>
                </h4>



            </Center>

            <div class="card-body">

  
 
<div class="row">
 <cfoutput>
<center>
   <h3><i class="mdi mdi-24px mdi-calendar-account-outline text-primary"></i> #dateformat('#aud_det.eventStart#','long')#</h3> 
    <p>&nbsp;</p>
        <h4><i class="mdi mdi-18px mdi-account-clock text-primary"></i> #timeformat(aud_det.eventStartTime)# <cfif #aud_det.eventStopTime# is not "">- #timeformat(aud_det.eventStopTime)#</cfif></h4> <p>&nbsp;</p> <p>&nbsp;</p>
    <h5><i class="mdi mdi-14px mdi-google-maps text-primary"></i> #aud_det.audLocation#</h5>
     
 
     </center>  
</cfoutput>
                </div>

            </div>
        </div>

    </div>

    <cfoutput>

        <cfset h5style="font-size:0.875rem;font-weight: 500;text-align:left;margin-bottom:0;" />

    </cfoutput>

    <div class="col-md-8 col-sm-6 col-xs-12">

        <div class="card h-100">


        <Center>

                <h4 class="card-header text-nowrap" style="color:white;background-color: #406E8E;margin:0!important;padding:15px!important;">
                    <cfoutput>Audition Details</cfoutput>
                </h4>

   

            </Center>
<Cfoutput>
            <div class="card-body">
                <h4 class="text-nowrap">
                    #aud_det.projName#
                </h4>
                <div class="row" style="margin: auto;">


                               <div class="col-md-12 col-lg-6 p-1 text-nowrap"><strong>Category: </strong>#aud_det.audcatname#</div>

 <div class="col-md-12 col-lg-6 p-1 text-nowrap"><strong>Subcategory: </strong>#aud_det.audcatname#</div>
 <div class="col-md-12 col-lg-6 p-1 text-nowrap"><strong>Audition Type: </strong>#aud_det.audtype#</div>
 <cfif #aud_det.audsource# is not ""><div class="col-md-12 col-lg-6 p-1 text-nowrap"><strong>Audition Source: </strong>#aud_det.audsource#</div></cfif>
                    <cfif #aud_det.unionName# is not ""><div class="col-md-12 col-lg-6 p-1 text-nowrap"><strong>Union Status: </strong>#aud_det.unionName#</div></cfif>
                    <cfif #aud_det.contracttype# is not ""><div class="col-md-12 col-lg-6 p-1 text-nowrap"><strong>Contract Type: </strong>#aud_det.contracttype#</div></cfif>
  <cfif #aud_det.holdstartdate# is not ""><div class="col-md-12 col-lg-6 p-1 text-nowrap"><strong>Hold Dates: </strong><cfif #aud_det.holdstartdate# is not "">#aud_det.holdStartDate# <cfif #aud_date.holdenddate# is not "">- #aud_det.holdenddate#</cfif><cfelse>N/A</cfif></div>       </cfif>           
      <cfif #aud_det.audplatform# is not "">     <div class="col-md-12 col-lg-6 p-1 text-nowrap"><strong>Online Platform: </strong>#aud_det.audplatform#</div> </cfif>  
      <cfif #aud_det.parkingDetails# is not "">  <div class="col-md-12 col-lg-12 p-1 text-nowrap"><strong>Parking Details: </strong>#aud_det.parkingDetails#</div>  </cfif>
                </div>










            </div>
</Cfoutput>
        </div>

    </div>

</div>
<p>&nbsp;</p>






















    <div class="card">

        <div class="btn-group col-md-12">

            <button type="button" class="btn btn-primary btn-lg dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

                <Cfoutput>#sec_det.pgtitle#</Cfoutput>
                <i class="fe-menu"></i>

            </button>
            <div class="dropdown-menu">

                <cfloop query="options">
                    <cfoutput>
                        <a class="dropdown-item" href="/app/audition/?secid=#options.pgid#">#options.pgtitle#</a>
                    </cfoutput>
                </cfloop>

            </div>
        </div><!-- /btn-group -->




        <div class="card-body">
 
            <cfif #secid# is "175">
                <cfinclude template="/include/aud_rel_pane.cfm" />
            </cfif>

            <cfif #secid# is "176">
                <cfinclude template="/include/aud_role_pane.cfm" />
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

 <div class="row">
     
     <CFINCLUDE template="/include/remote_load.cfm" />

 
    
    <cfquery name="types" datasource="#dsn#">
    SELECT * from audmediatypes WHERE mediatypeid in (9,10,11)
</cfquery>
<cfloop query="types">
    <cfquery name="find_#types.mediatypeid#" datasource="#dsn#">
        
                SELECT * from audmedia m inner join audmedia_auditions_xref x on x.mediaid = m.mediaid WHERE x.audprojectid = #audprojectid# and m.isdeleted is false AND m.mediatypeid = #types.mediatypeid# and m.isdeleted is false
    </cfquery>
     </cfloop>
     
     <cfloop query="types">

    <cfoutput>
        <script>
            $(document).ready(function() {
                $("##remoteadd#types.mediatypeid#").on("show.bs.modal", function(event) {
                    // Place the returned HTML into the selected element
                    $(this).find(".modal-body").load("/include/remotaudmatadd.cfm?eventid=#eventid#&audprojectid=#audprojectid#&mediatypeid=#types.mediatypeid#&secid=177");
                });
            });

        </script>

        <div id="remoteadd#types.mediatypeid#" class="modal fade" tabindex="-1" aria-labelledby="standard-modalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: ##f3f7f9;">
                        <h4 class="modal-title" id="standard-modalLabel">Upload Media</h4>
                        <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>
                    </div>
                    <div class="modal-body">
                    </div>
                </div>

            </div>

        </div>






    </cfoutput>

</cfloop>

<cfif #roledetails.isbooked# is "0">

     <div class="col-md-12 col-lg-12 col-xl-12 p-1 text-nowrap">
         <Cfoutput>
             <a href="/include/booked.cfm?audprojectid=#audprojectid#&eventid=#eventid#&secid=181&audroleid=#audroleid#" class="btn btn-success waves-effect waves-light">I Booked It!</a>
         </Cfoutput>
     </div>

     
     
     
     
     
     
     </cfif>
     
     
     <cfif #roledetails.isbooked# is "1">
         
         <cfoutput>
<script>
      $(document).ready(function() {
          $("##bookupdate").on("show.bs.modal", function(event) {
              // Place the returned HTML into the selected element
              $(this).find(".modal-body").load("/include/bookupdateform.cfm?secid=<cfoutput>#secid#</cfoutput>&audprojectid=<cfoutput>#audprojectid#</cfoutput>&focusid=<cfoutput>#focusid#</cfoutput>&eventid=<Cfoutput>#eventid#&audroleid=#audroleid#</cfoutput>&pgdir=audition");
          });
      });
  </script>
       <div id="bookupdate" class="modal  fade" tabindex="-1" aria-labelledby="standard-modalLabel" aria-hidden="true">
           <div class="modal-dialog">
               <div class="modal-content">
                   <div class="modal-header" style="background-color: ##f3f7f9;">
                       <h4 class="modal-title" id="standard-modalLabel">Booking Update</h4>
                       <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>
                   </div>
                   <div class="modal-body">
                   </div>
               </div>
           </div>
       </div> 
</cfoutput>

         
         
         
         <script>
    $(document).ready(function() {
        $("#auditionadd").on("show.bs.modal", function(event) {
            // Place the returned HTML into the selected element
            $(this).find(".modal-body").load("/include/remoteaudaddform.cfm?new_audprojectid=<cfoutput>#audprojectid#</cfoutput>&new_audstepid=4&secid=181&audroleid=<cfoutput>#audroleid#</cfoutput>&pgdir=audition");
        });
    });

</script>
<div id="auditionadd" class="modal fade" tabindex="-1" aria-labelledby="standard-modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #f3f7f9;">
                <h4 class="modal-title" id="standard-modalLabel">Booking Appointment Add</h4>
                <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>
            </div>
            <div class="modal-body">


            </div>
        </div>

    </div>

</div>
             
           <h4 class="p-1 d-flex">Booking Details
 <span class="ms-auto text-muted"> <a href="javascript:;" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="#bookupdate" data-bs-placement="top" title="Update Booking" data-bs-original-title="Update Booking">

                                                  <i class="mdi mdi-square-edit-outline"></i>

                                              </a></span>
                    </h4>
         
         
      <cfif #isdefined('dfd')#>
                               
                               
                                <div class="col-md-12">
         
                                                     <Cfoutput>
 <a href="javascript:;" class="btn btn-primary waves-effect waves-light" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##auditionadd" data-bs-placement="top" title="Add Booking Appointment" data-bs-original-title="Add Booking Appointment"><i class="fe-plus-circle"></i> Add Booking Appointment</a> 
         </Cfoutput>
         
         </div>
         </cfif>
         
         
         <cfoutput>
         
             <div class="col-md-12 col-lg-6  col-xl-4 p-1 text-nowrap"><strong>Income Type: </strong>#roledetails.incometype#</div>
                   <div class="col-md-12 col-lg-6  col-xl-4 p-1 text-nowrap"><strong>Payrate/Session fee: </strong>#dollarformat(roledetails.payrate)#
             
             <cfif #roledetails.paycycleid# is not ""> (#roledetails.paycyclename#)</cfif>
             </div>
             
             <cfif #roledetails.incometype# is "w2">
             
             
                                <div class="col-md-12 col-lg-6  col-xl-4 p-1 text-nowrap"><strong>Net income: </strong>#dollarformat(roledetails.netincome)#</div>
             
     </cfif>
             
             
             <cfif #projectDetails.audcatname# is "Commercial">    <div class="col-md-12 col-lg-6  col-xl-4 p-1 text-nowrap"><strong>Buyout: </strong>#dollarformat(roledetails.buyout)#</div></cfif>
             
             
</cfoutput>
     

     
     
     </cfif>
     
     
     
     

 </div>

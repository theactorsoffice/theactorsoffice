<CFINCLUDE template="/include/remote_load.cfm" />

<cfinclude template="/include/qry/audmedia.cfm" />

<cfquery name="types" datasource="#dsn#">
    SELECT mediatypeid,mediatype from audmediatypes WHERE mediatypeid in (1,2,3,5,6,7,8)
</cfquery>

<cfquery name="audlinks" datasource="#dsn#">
    SELECT * from audlinks where audroleid = #audroleid#
</cfquery>


<cfset modalid="remoteselectheadshot" />

<cfset modaltitle="Select a Headshot" />

<cfinclude template="/include/modal.cfm" />

<cfset modalid="remoteselectmaterial" />

<cfset modaltitle="Select Material" />

<cfinclude template="/include/modal.cfm" />



<cfoutput>
    
        <script>
        $(document).ready(function() {
            $("##remoteselectheadshot").on("show.bs.modal", function(event) {
                // Place the returned HTML into the selected element
                $(this).find(".modal-body").load("/include/remoteselectheadshot.cfm?selected_eventid=#eventid#&eventid=#eventid#&audprojectid=#audprojectid#&secid=196");
            });
        });
    </script>



    
    
    
    <script>
        $(document).ready(function() {
            $("##remoteadd").on("show.bs.modal", function(event) {
                // Place the returned HTML into the selected element
                $(this).find(".modal-body").load("/include/remotaudmatadd.cfm?eventid=#eventid#&audprojectid=#audprojectid#&secid=196");
            });
        });
    </script>

    <div id="remoteadd" class="modal fade" tabindex="-1" aria-labelledby="standard-modalLabel" aria-hidden="true">
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









<cfset i=0 />

<cfoutput>

    <div class="col-md-12 col-lg-12 col-xl-12 p-1 d-flex">
        <center>

        
                
                
                  <a data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteselectheadshot" data-bs-placement="top" title="Select Headshots" data-bs-original-title="Add media" class="btn btn-xs btn-primary waves-effect waves-light">My Headshots</a>
                

        </center>

    </div>




</cfoutput>
<div class="row pt-3 pb-3">

    <cfloop query="audmedia">










        <cfoutput>

            <script>
                $(document).ready(function() {
                    $("##remoteDelete#audmedia.mediaid#").on("show.bs.modal", function(event) {
                        // Place the returned HTML into the selected element
                        $(this).find(".modal-body").load("/include/remoteDeleteaudmedia_auditions_xref.cfm?mediaid=#audmedia.mediaid#&secid=196&audprojectid=#audprojectid#");
                    });
                });
            </script>

            <div id="remoteDelete#audmedia.mediaid#" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">

                <div class="modal-dialog">

                    <div class="modal-content">

                        <div class="modal-header" style="background-color: red;">

                            <h4 class="modal-title">Delete Media</h4>

                            <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>

                        </div>

                        <div class="modal-body"></div>

                    </div>

                </div>

            </div>

        </cfoutput>






        <Cfoutput>

            <div class="col-xl-2 col-lg-4 col-md-6 col-sm-12">






                <div class="p-3">
                    <center>
             
                  <cfif #audmedia.isimage# is "1">
                   <a href="https://#host#.theactorsoffice.com/media-#host#/users/#session.userid#/#audmedia.mediafilename#?ver=#rand()#" data-toggle="lightbox" data-gallery="example-gallery">
                       
                       
                       
                        <img src="https://#host#.theactorsoffice.com/media-#host#/filetypes/#audmedia.mediaext#.png" class="img-fluid p-0 m-0" style="max-width:64px;" />





                        </a>
                      
                      <cfelse>
                                      <a href="https://#host#.theactorsoffice.com/media-#host#/users/#session.userid#/#audmedia.mediafilename#?ver=#rand()#" data-toggle="lightbox" data-gallery="example-gallery">
                       
                       
                       
                        <img src="https://#host#.theactorsoffice.com/media-#host#/filetypes/#audmedia.mediaext#.png" class="img-fluid p-0 m-0" style="max-width:64px;" />





                        </a>
                          
                   
                          
                          
                      
                      </cfif>
                        
                        
                        
                    </center>
                </div>
               <A class="pt-0" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteDelete#audmedia.mediaid#" data-bs-placement="top" title="Delete media" data-bs-original-title="Delete media">

                    <p class="p-0" style="padding:10px;">
                        <center>

                            #audmedia.medianame# <i class="mdi mdi-trash-can-outline"></i>
                        </center>
                </A>

                <BR>
                <center> <a class="btn-lg" href="/include/download_media.cfm?mediaid=#audmedia.mediaid#"> <i class="mdi mdi-cloud-download-outline"></i></a></center>
                </p>


                <span class="p-3">&nbsp;</span> <span class="p-3">&nbsp;</span>
            </div>


        </Cfoutput>

    </cfloop>






</div>
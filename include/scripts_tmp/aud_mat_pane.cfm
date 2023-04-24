<CFINCLUDE template="/include/remote_load.cfm" />

<cfinclude template="/include/qry/audmedia.cfm" />

<cfoutput>
    <script>
        $(document).ready(function() {
            $("##matupdate").on("show.bs.modal", function(event) {
                // Place the returned HTML into the selected element
                $(this).find(".modal-body").load("/include/matupdateform.cfm?audid=<Cfoutput>#audid#</cfoutput>&pgdir=audition");
            });
        });

    </script>
    <div id="matupdate" class="modal  fade" tabindex="-1" aria-labelledby="standard-modalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" style="background-color: ##f3f7f9;">
                    <h4 class="modal-title" id="standard-modalLabel">Submit Materials</h4>
                    <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>
                </div>
                <div class="modal-body">
                </div>
            </div>
        </div>
    </div>

</cfoutput>



<cfoutput>

    <h4 class="p-1 d-flex">Materials Submitted

        <span class="ms-auto text-muted"> <a href="javascript:;" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##matupdate" data-bs-placement="top" title="Update Materials" data-bs-original-title="Update Materials">

                <i class="mdi mdi-square-edit-outline"></i>

            </a>

        </span>

    </h4>


</cfoutput>

<cfset i=0 />

<div class="row">
    
           <div class="col-md-6 p-2 text-nowrap"><strong>Where taped: </strong>Living room</div>
    
         <div class="col-md-6 p-2 text-nowrap"><strong>Link to self-tape: </strong>http://www.linkit.com/linktotape/</div>
    



</div>

<div class="container"><HR>
<div class="row pt-3">
  
    <cfloop query="audmedia">
        
        <Cfoutput>
    
    <div class="col-lg-4 pb-3 pt-3">
        <center>
        <cfif #audmedia.isimage# is "1"><a href="https://#host#.theactorsoffice.com/media-#host#/users/#userid#/#audmedia.mediafilename#" data-toggle="lightbox" data-gallery="mixedgallery" >
            <div
  class="bg-image hover-overlay ripple shadow-1-strong rounded"
  data-mdb-ripple-color="light"
>
                
                
            <img src="https://#host#.theactorsoffice.com/media-#host#/users/#userid#/#audmedia.mediafilename#" class="avatar-xl w-100" /> 
                 <div class="mask" style="background-color: rgba(251, 251, 251, 0.2)"></div>   </a>
            </div>
         
        
                                                           
            
            <cfelse>
            <a href="https://#host#.theactorsoffice.com/media-#host#/filetypes/#audmedia.mediaext#.png" data-toggle="lightbox" data-gallery="mixedgallery" >
            <img src="https://#host#.theactorsoffice.com/media-#host#/filetypes/#audmedia.mediaext#.png" class="avatar-xl" /> 
            </a> 
        </cfif>
            
            <A class="pt-3">
            <p class="pb-3" style="padding:10px;">
            
           #audmedia.medianame#
            </p></A>
            
       </center>
                                                           
            
    </div>
    
        
        </Cfoutput>
    
    </cfloop>
    
    
</div>
    
</div>



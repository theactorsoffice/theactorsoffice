<script>
    $(document).ready(function() {
    $("#remoteaddMaterial").on("show.bs.modal", function(event) {
    // Place the returned HTML into the selected element
    $(this).find(".modal-body").load("
    <cfoutput>/include/remoteaddMaterial.cfm?userid=#userid#&src=account</cfoutput>
    ");
    });
    });
</script>

<cfset modalid = "remoteaddMaterial"/>

<cfset modaltitle = "Add Material"/>

<cfinclude template="/include/modal.cfm"/>

<cfset modalid = "remoteDeleteaudmedia"/>

<cfset modaltitle = "Delete Material"/>

<cfinclude template="/include/modal.cfm"/>

<cfinclude template="/include/qry/materials_sel.cfm"/>

<cfoutput>

    <h4 class="p-1 d-flex">
        My Materials 
        <span class="ms-auto text-muted">
            <a href="javascript:;" data-bs-remote="true" data-bs-toggle="modal" 
               data-bs-target="##matupdate" data-bs-placement="top" title="Update Materials" 
               data-bs-original-title="Update Materials">
            </a>
        </span>
    </h4>
    
</cfoutput>

<cfset i = 0/>

<cfoutput>

    <div class="col-md-12 col-lg-12 col-xl-12 p-1 d-flex">
        <center>
        
            <a data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteaddMaterial" 
               data-bs-placement="top" title="Add media" data-bs-original-title="Add material" 
               class="btn btn-xs btn-primary waves-effect waves-light">
                Add Material
            </a>
        </center>
    </div>
    
</cfoutput>
<div class="row pt-3 pb-3">

    <cfloop query="headshots_sel">
    
        <cfoutput>
        
            <script>
                $(document).ready(function() {
                $("##remoteDeleteaudmedia
                #headshots_sel.mediaid#
                ").on("show.bs.modal", function(event) {
                // Place the returned HTML into the selected element
                $(this).find(".modal-body").load("/include/remoteDeleteaudmedia.cfm?mediaid=
                #headshots_sel.mediaid#
                &secid=177");
                });
                });
            </script>
            
            <div id="remoteDeleteaudmedia#headshots_sel.mediaid#" class="modal fade" tabindex="-1" 
                 role="dialog" aria-hidden="true">
            
                <div class="modal-dialog">
                
                    <div class="modal-content">
                    
                        <div class="modal-header" style="background-color: red;">
                        
                            <h4 class="modal-title">
                                Delete Material
                            </h4>
                            
                            <button type="button" class="close" data-bs-dismiss="modal" 
                                    aria-hidden="true">
                                <i class="mdi mdi-close-thick">
                                </i>
                            </button>
                        </div>
                        
                        <div class="modal-body">
                        </div>
                    </div>
                </div>
            </div>
            
        </cfoutput>
    
        <cfoutput>
        
            <div class="col-xl-2 col-lg-4 col-md-6 col-sm-12">
            
                <div class="p-3">
                    <center>
                        <cfif #headshots_sel.isValidImage# is "true">
                            <a href="https://#host#.theactorsoffice.com/media-#host#/users/#userid#/#headshots_sel.mediaFileName#?ver=#rand()#" 
                               data-toggle="lightbox" data-gallery="example-gallery">
                        <cfelse>
                            <a href="https://#host#.theactorsoffice.com/media-#host#/users/#userid#/#headshots_sel.mediaFileName#?ver=#rand()#" 
                               data-toggle="lightbox" data-gallery="example-gallery">
                        </cfif>
                    
                        <img src="https://#host#.theactorsoffice.com/media-#host#/users/#userid#/#headshots_sel.mediaFileName#?ver=#rand()#" 
                             class="mr-2 rounded-square gambar  img-thumbnail img-fluid p-0 m-0" 
                             title="User ID: 30" style="max-width:120px; height:120px; height:100%" 
                             alt="profile-image" id="item-img-output">
                            </a>
                    </center>
                </div>
                <a href="javascript:;">
                
                    <p class="p-0" style="padding:10px;">
                    <center>
                    
                        #headshots_sel.medianame#
                        <a class="pt-0" data-bs-remote="true" data-bs-toggle="modal" 
                           data-bs-target="##remoteDeleteaudmedia#headshots_sel.mediaid#" 
                           data-bs-placement="top" title="Delete media" 
                           data-bs-original-title="Delete media">
                        <i class="mdi mdi-trash-can-outline">
                        </i>
                    </center>
                </a>
                
                <br>
                <center>
                    <a class="btn-lg" 
                       href="/include/download_media.cfm?mediaid=#headshots_sel.mediaid#">
                        <i class="mdi mdi-cloud-download-outline">
                        </i>
                    </a>
                </center>
                    </p>
                <span class="p-3">
                    &nbsp;
                </span>
                <span class="p-3">
                    &nbsp;
                </span>
            </div>
            
        </cfoutput>
    
    </cfloop>
</div>
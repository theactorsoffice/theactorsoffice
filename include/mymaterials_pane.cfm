<cfoutput>
    <script>
        $(document).ready(function() {
        $("##remoteaddMaterial").on("show.bs.modal", function(event) {
        // Place the returned HTML into the selected element
        $(this).find(".modal-body").load("/include/remoteaddMaterial.cfm?userid=#userid#&src=account");
        });
        });
    </script>
</cfoutput>

<cfset modalid = "remoteaddMaterial"/>

<cfset modaltitle = "Add Material"/>

<cfinclude template="/include/modal.cfm"/>

<cfset modalid = "remoteDeleteaudmedia"/>

<cfset modaltitle = "Delete Material"/>

<cfset modalid = "remoteupdatematerial"/>

<cfset modaltitle = "Update Material"/>

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










    <table id="basic-datatable" class="table dt-responsive nowrap w-100 table-striped" role="grid">
                    <thead>
                    




                     


                                <tr class="#rowtype#">
                                    <th width="50">Action </th>
                                    <th>Type</th>
                                    <th>Name</th>
                                    <th>Filename</th>
                     
                                    <th>URL</th>
                                    <th>Created</th>
                                </tr>
                      
                
                    <tbody>
  
                    








    <cfloop query="headshots_sel">
    
        <cfoutput>
        
            <script>
                $(document).ready(function() {
                $("##remoteDeleteaudmedia#headshots_sel.mediaid#").on("show.bs.modal", function(event) {
                // Place the returned HTML into the selected element
                $(this).find(".modal-body").load("/include/remoteDeleteaudmedia.cfm?mediaid=#headshots_sel.mediaid#&secid=177");
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






     <script>
                $(document).ready(function() {
                $("##remoteupdatematerial#headshots_sel.mediaid#").on("show.bs.modal", function(event) {
                // Place the returned HTML into the selected element
                $(this).find(".modal-body").load("/include/remoteupdatematerial.cfm?mediaid=#headshots_sel.mediaid#");
                });
                });
            </script>
            
            <div id="remoteupdatematerial#headshots_sel.mediaid#" class="modal fade" tabindex="-1" 
                 role="dialog" aria-hidden="true">
            
                <div class="modal-dialog">
                
                    <div class="modal-content">
                    
                        <div class="modal-header" >
                        
                            <h4 class="modal-title">
                                Update Material
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







               <tr role="row">

                        <td>

                            <a title="Edit"  data-bs-toggle="modal" data-bs-target="##remoteupdatematerial#headshots_sel.mediaid#">

                                <i class="mdi mdi-square-edit-outline"></i>

                            </a>

                        </td>






                        <td class="text-nowrap">

                        #headshots_sel.mediaType#
                           
                        </td>



                        <td class="text-nowrap">

                        #headshots_sel.mediaName#
                           
                        </td>



      <td class="text-nowrap">

                        #headshots_sel.mediaFilename#
                           
                        </td>

 


   <td class="text-nowrap">

                        #headshots_sel.mediaurl#
                           
                        </td>








                        <td class="text-nowrap">#dateformat('#headshots_sel.mediacreated#','m-d-YYYY')#<BR />#timeformat('#headshots_sel.mediacreated#','medium')#</td>



                    </tr>






            
   
        </cfoutput>
            
    </cfloop>

    
                    </tbody>

                </table>


</div>
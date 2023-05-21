<CFINCLUDE template="/include/remote_load.cfm" />

<cfinclude template="/include/qry/audmedia_materials.cfm" />

<cfinclude template="/include/qry/audmedia_picklist.cfm" />

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
                $(this).find(".modal-body").load("/include/remoteselectheadshot.cfm?selected_audid=#audid#&audid=#audid#&audprojectid=#audprojectid#&secid=177");
            });
        });
    </script>

<script>
    $(document).ready(function() {
        $("##remoteselectmaterial").on("show.bs.modal", function(event) {
            // Place the returned HTML into the selected element
            $(this).find(".modal-body").load("/include/remoteselectmaterial.cfm?selected_audid=#audid#&audid=#audid#&audprojectid=#audprojectid#&secid=177");
        });
    });
</script>

    
    
    
    <script>
        $(document).ready(function() {
            $("##remoteadd").on("show.bs.modal", function(event) {
                // Place the returned HTML into the selected element
                $(this).find(".modal-body").load("/include/remotaudmatadd.cfm?audid=#audid#&audprojectid=#audprojectid#&secid=177");
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







<cfoutput>
    <script>
        $(document).ready(function() {
            $("##matupdate").on("show.bs.modal", function(event) {
                // Place the returned HTML into the selected element
                $(this).find(".modal-body").load("/include/audlinkadd.cfm?audroleid=<Cfoutput>#audroleid#</cfoutput>&audid=<Cfoutput>#audid#&audprojectid=#audprojectid#</cfoutput>&pgdir=audition");
            });
        });
    </script>
    <div id="matupdate" class="modal  fade" tabindex="-1" aria-labelledby="standard-modalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" style="background-color: ##f3f7f9;">
                    <h4 class="modal-title" id="standard-modalLabel">Add Link</h4>
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


            </a>

        </span>

    </h4>


</cfoutput>

<cfset i=0 />


 <form action="/include/linkmedia.cfm" />
       
<cfoutput>
<input type="hidden" name="audprojectid" value="#audprojectid#" />
</cfoutput>
    <select id="new_mediaid" name="new_mediaid"  onchange="this.form.submit()">

                                        <option value="">Link Material</option>

                             <cfoutput query="audmedia_picklist">
  <option value="#audmedia_picklist.mediaid#">#audmedia_picklist.medianame#</option>

                             </cfoutput>

                                    </select>

</form>
 

<cfoutput>
<div style="padding:10px;">

            <a data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteadd" data-bs-placement="top" title="Add media" data-bs-original-title="Add media" class="btn btn-xs btn-primary waves-effect waves-light">Add Material</a>

         
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
                                    <th>Location</th>
                                    <th>URL</th>
                                    <th>Created</th>
                                </tr>
                      
                
                    <tbody>
  
                    








    <cfloop query="audmedia">
    
        <cfoutput>
        
            <script>
                $(document).ready(function() {
                $("##remoteDeleteaudmedia#audmedia.mediaid#").on("show.bs.modal", function(event) {
                // Place the returned HTML into the selected element
                $(this).find(".modal-body").load("/include/remoteDeleteaudmedia.cfm?mediaid=#audmedia.mediaid#&secid=177");
                });
                });
            </script>
            
            <div id="remoteDeleteaudmedia#audmedia.mediaid#" class="modal fade" tabindex="-1" 
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
                $("##remoteupdatematerial#audmedia.mediaid#").on("show.bs.modal", function(event) {
                // Place the returned HTML into the selected element
                $(this).find(".modal-body").load("/include/remoteupdatematerial.cfm?mediaid=#audmedia.mediaid#");
                });
                });
            </script>
            
            <div id="remoteupdatematerial#audmedia.mediaid#" class="modal fade" tabindex="-1" 
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

                            <a title="Edit"  data-bs-toggle="modal" data-bs-target="##remoteupdatematerial#audmedia.mediaid#">

                                <i class="mdi mdi-square-edit-outline"></i>

                            </a>

                        </td>






                        <td class="text-nowrap">

                        #audmedia.mediaType#
                           
                        </td>



                        <td class="text-nowrap">

                        #audmedia.mediaName#
                           
                        </td>



      <td class="text-nowrap">

                        #audmedia.mediaFilename#
                           
                        </td>


   <td class="text-nowrap">

                        #audmedia.mediaLoc#
                           
                        </td>


   <td class="text-nowrap">

                        #audmedia.mediaurl#
                           
                        </td>








                        <td class="text-nowrap">#dateformat('#audmedia.mediacreated#','m-d-YYYY')#<BR />#timeformat('#audmedia.mediacreated#','medium')#</td>



                    </tr>






            
   
        </cfoutput>
            
    </cfloop>

    
                    </tbody>

                </table>


</div>
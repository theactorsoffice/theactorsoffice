<div id="essencehelp" class="modal  fade" tabindex="-1" aria-labelledby="standard-modalLabel" aria-hidden="true">
           <div class="modal-dialog">
               <div class="modal-content">
                   <div class="modal-header" style="background-color: #f3f7f9;">
                       <h4 class="modal-title" id="standard-modalLabel">Essences</h4> <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i>

                    </button>   </div>

                   <div class="modal-body">
                       
                                        <p>Branding is the identification and articulation of your unique, 3-dimensional essence. It is the key to getting your foot in the door and being remembered. </p><p>Being able to track your events through the lens of your brand essences will give you vital data on how you're perceived, what you do best, and your niche. I recommend using 3-5 brand essences here. </p>

<p>Examples:<bR>
                       
                       <ul>
<li>Wealthy and manipulative narcissistic milf</li>
<li>Ambitious, strong truth seeker</li>
<li>Neurotic and Type-A mom who means well</li>
<li>Sensitive voice of reason everyone loves</li>
</ul>
    
    </p>
<p>If you need support in identifying your brand and your essences, check out <A href="https://www.theactorsbrandingsystem.com/" target="new">The Actor's Branding System</A>.</p>
                   </div>
               </div>
           </div>
       </div> 

<script>
    $(document).ready(function() {
        $("#remoteAddEssenceContact").on("show.bs.modal", function(event) {
            // Place the returned HTML into the selected element
            $(this).find(".modal-body").load("<cfoutput>/include/remoteAddEssenceContact.cfm?userid=#userid#&src=account</cfoutput>");
        });
    });
</script>


<cfset modalid="remoteAddEssenceContact" />

<cfset modaltitle="Add Essence" />

<cfinclude template="/include/modal.cfm" />



<cfinclude template="/include/qry/essence_sel.cfm" />
 
 

<h4>My Essence <a href="" title="click for details" data-bs-toggle="modal" data-bs-target="#essencehelp">     
 <i class="fe-info font-14 mr-1"></i>

                        </a></h4>

                <p>Add an <a href="remoteAddContact.cfm?src=account" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="#remoteAddEssenceContact"><strong>Essence</strong></a> </p>

                <form class="app-search" action="/app/myaccount/?new_pgid=122" method="POST">
                    <input type="hidden" name="ctaction" value="addmember" />
          
                    <div class="row" style="margin: auto;">
                        <div class="col-md-12 p-2">My Essences:</div>
            
                    </div>
                </form>

   <div class="container-fluid">
                               <div class="row">
                          
                                     <cfloop query="essence_sel">
                                         
                                          <div class="col-md-2 col-lg-3 col-sm-12"> 
                                    <Cfoutput>    
                                         
                                         
                                         
                                         
                                         <script>
    $(document).ready(function() {
        $("##remoteUpdateEssenceContact_#essence_sel.id#").on("show.bs.modal", function(event) {
            // Place the returned HTML into the selected element
            $(this).find(".modal-body").load("/include/remoteUpdateEssenceContact.cfm?userid=#userid#&src=account&essenceid=#essence_sel.id#");
        });
    });
</script>

<cfset modalid="remoteUpdateEssenceContact_#essence_sel.id#" />

<cfset modaltitle="Update Essence" />

<cfinclude template="/include/modal.cfm" />
 
                                
                                  <p class="p-2">
                                             <a href="" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteUpdateEssenceContact_#essence_sel.id#"> <button type="button" class="btn  btn-soft-secondary rounded-pill waves-effect">#Essence_sel.Name#</button> </a>
                                      </p>
                                              
                                        
                                        
                               </cfoutput>
                               <BR>
                              </div>
                            </cfloop>
                             
                                   
             
                                             </div>
       </div>                     

                        
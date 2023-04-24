 <form method="post" action="/include/remoteaddessenceContact2.cfm" class="parsley-examples" name="version-form" id="form-version"   data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden"
  data-parsley-trigger="keyup" data-parsley-validate>
                  

     
      
     
     
     
     
     
      
                    <cfoutput>  <input type="hidden" name="userid" value="#session.userid#" ></cfoutput>
                     <div class="row">
            
      
                         
                  
         <cfoutput>  
                        <div class="form-group col-md-12">

                                 <label class="control-label">Essence</label>
                                 <input class="form-control"  required type="text" name="new_essenceName" id="new_essenceName"  
                />  
                          
                             </div>
             
                            <div class="invalid-feedback">
                    Please enter an essence.
                </div>
             
             
                         </div>
             
             
   

</cfoutput>

                
                
                

                
                
                     <div class="row mt-2">
                         <div class="col-6">
            
                         </div>
                         <div class="col-6 text-right">
                          <cfif #isdefined('sdfsdf')#>   <a href="javascript:history.go(-1)"><button type="button" class="btn btn-light mr-1 btn-sm" data-bs-dismiss="modal">Back</button></a></cfif>
                             <button type="submit" class="btn btn-primary btn-sm waves-effect waves-light" id="btn-save-event">Add</button>
                         </div>
                     </div>
                 </form>



</div>    
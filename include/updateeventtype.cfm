
<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="linkdetails"  >
                    SELECT * FROM eventtypes_user where id = #id#
                </cfquery> 

      <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="find_events"  >
                    SELECT * FROM events where eventtypename = '#linkdetails.eventtypename#' and userid = #linkdetails.userid#
                </cfquery> 

 



<form action="/include/updateeventtypeupdate.cfm" method="post" class="needs-validation" validate id="profile-form">
    <cfoutput><input type="hidden" name="id" value="#linkdetails.id#" >

           <input type="hidden" name="new_iscustom" value="#linkdetails.iscustom#" >
    </cfoutput>
    
    
        <div class="row" />
    
    
    
    <cfif #linkdetails.iscustom# is "0"> 
    
    
    
     
        
    <cfoutput><input type="hidden" name="new_eventtypename" value="#linkdetails.eventtypename#"></cfoutput>
        
    
      <div class="form-group col-md-6">

          
          <h5><Cfoutput>
                <span class="fc-event-dot" style="background-color:#linkdetails.eventtypecolor#"></span>&nbsp; #linkdetails.eventtypename#
          </Cfoutput>
          </h5>
          
          
          
                </div>
    
    
    <cfelse>
    
    
                <div class="form-group col-md-12">
          <label for="new_eventtypename">Name:</label>
  <cfoutput>
          <input class="form-control" type="text" id="new_eventtypename" name="new_eventtypename" value="#linkdetails.eventtypename#" required placeholder="Enter an Event Type">
 </cfoutput>
                <div class="invalid-feedback">
                    Please enter your Event Type.
                </div>
                </div>
    

       
        
    </cfif>
    
    
    
    
    

          <div class="form-group col-md-12">
          <label for="hexa-colorpicker">Color:</label>
           <cfoutput>
          <input type="text" id="hexa-colorpicker_#id#" name="new_eventtypecolor" class="form-control" value="#linkdetails.eventtypecolor#">
          
</cfoutput>
                <div class="invalid-feedback">
                    Please enter a color.
                </div>
                </div>

        <cfif #linkdetails.isCustom# is "1">
 
 <cfif #find_events.recordcount# is "0">
 
     
     
     <div class="form-group col-md-12">
     
     <div class="custom-control custom-checkbox">
         <input type="checkbox" class="custom-control-input" id="deletelink" value="1" name="deletelink">
         <label class="custom-control-label" for="deletelink">Remove</label>
     </div>




     </div>
     
     
     
       </cfif>
        </cfif>

      <div class="form-groupcol-md-12">
                            <button class=" btn btn-primary editable-submit btn-sm waves-effect waves-light" type="submit" style="background-color: #406e8e; border: ##406e8e;">Update</button>
                        </div>

      
    
    </div>
</form>

<script>
   $(function () {
      $('#hexa-colorpicker<cfoutput>_#linkdetails.id#</cfoutput>').colorpicker();
   });
</script>




<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" /><cfinclude template="/include/bigbrotherinclude.cfm" /> 

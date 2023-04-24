<CFINCLUDE template="/include/remote_load.cfm" />
<cfquery name="actiondetails" datasource="#dsn#">
                                SELECT au.id,
                         s.systemID
                         ,s.systemName
                         ,s.SystemType
                         ,s.SystemScope
                         ,s.SystemDescript
                         ,s.SystemTriggerNote
                         ,a.actionID
                         ,a.actionNo
                         ,a.actionDetails
                         ,a.actionTitle
                         ,a.navToURL
                         ,au.actionDaysNo
                         ,au.actionDaysRecurring
                         ,a.actionNotes
                         ,a.actionInfo

                         FROM fusystems s
                         INNER JOIN fuactions a ON s.systemid = a.systemid

                         INNER JOIN actionusers au on au.actionid = a.actionid
                         WHERE au.id = #id#
                </cfquery> 


<form action="/include/remoteactionUpdateUpdate.cfm" method="post" class="parsley-examples"  data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden"
  data-parsley-trigger="keyup" data-parsley-validate id="action_update">
    <cfoutput><input type="hidden" name="id" value="#actiondetails.id#" >
    <input type="hidden" name="target_id_system" value="#actiondetails.systemid#" >
 
    </cfoutput>
    
    
        <div class="row" />
    
    
    
 
    
    
     
        

        
    
      <div class="form-group col-md-6">

          
          <h5><Cfoutput>
        #actiondetails.actiontitle#
          </Cfoutput>
          </h5>
          
          
          
                </div>
    
 
    
    
                <div class="form-group col-md-12">
          <label for="userLastName">1st Reminder Starts In... (enter number of days)</label>
  <cfoutput>
          <input class="form-control" style="max-width:80px;" type="text" 	data-parsley-type="number" id="new_actionDaysNo" name="actionDaysNo" value="#actiondetails.actionDaysNo#"  placeholder="Enter Number of Days"
                 
                data-parsley-required data-parsley-error-message="No Days is required"
           
                 
                 >
 </cfoutput>
              </div>
    

    
                    <div class="form-group col-md-12">
          <label for="userLastName">Reminder repeats every... (enter number of days) </label>
  <cfoutput>
          <input  class="form-control"  style="max-width:80px;" type="text" 	data-parsley-type="number" id="new_actionDaysRecurring" name="actionDaysRecurring" value="#actiondetails.actionDaysRecurring#"   
            
           
                 
                 >
 </cfoutput>  
              </div>
    
    
    
       
   
 <div class="form-group col-md-12">
    
    <div class="custom-control custom-checkbox">
                                                        <input type="checkbox" class="custom-control-input" id="deleteaction" value="1" name="deleteaction">
                                                        <label class="custom-control-label" for="deleteaction">Remove</label>
                                                    </div>
    
    
    </div>



      <div class="form-group text-center col-md-12">
                            <button class=" btn btn-primary editable-submit btn-sm waves-effect waves-light" type="submit" style="background-color: #406e8e; border: ##406e8e;">Update</button>
                        </div>

      
    
    </div>
</form>

    <script>      
 $(document).ready(function() {
    $(".parsley-examples").parsley()
});
 </script>  
         

    

<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" /><cfinclude template="/include/bigbrotherinclude.cfm" /> 

<CFINCLUDE template="/include/remote_load.cfm" />
<cfparam name="target" default="myaccount" />
<cfquery name="linkdetails" datasource="#dsn#">
                    SELECT * FROM sitelinks_user where id = #id#
                </cfquery> 


<form action="/include/remotelinkUpdateUpdate.cfm" method="post" class="parsley-examples"  data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden"
  data-parsley-trigger="keyup" data-parsley-validate id="actinglinks_update">
    <cfoutput><input type="hidden" name="id" value="#linkdetails.id#" >
    <input type="hidden" name="target_id" value="#linkdetails.sitetypeid#" >
           <input type="hidden" name="new_iscustom" value="#linkdetails.iscustom#" >
                      <input type="hidden" name="target" value="#target#" >
    </cfoutput>
    
    
        <div class="row" />
    
    
    
    <cfif #linkdetails.iscustom# is "0"> 
    
    
    
     
        
    <cfoutput><input type="hidden" name="new_siteName" value="#linkdetails.sitename#"></cfoutput>
        
    
      <div class="form-group col-md-6">

          
          <h5><Cfoutput>
                <img src="/app/assets/images/retina-circular-icons/14/#linkdetails.siteicon#" width="14px"  /> #linkdetails.sitename#
          </Cfoutput>
          </h5>
          
          
          
                </div>
    
    
    <cfelse>
    
    
                <div class="form-group col-md-12">
          <label for="userLastName">Site Name<span class="text-danger">*</span></label>
  <cfoutput>
          <input class="form-control" type="text" id="new_siteName" name="new_siteName" value="#linkdetails.sitename#"  placeholder="Enter Site Name"
                 
                       data-parsley-minlength="3" 
                data-parsley-minlength-message="Min length 3 characters" 
                data-parsley-maxlength="200" 
                data-parsley-maxlength-message="Max length 200 characters" 
                data-parsley-required data-parsley-error-message="Site Name is required"
           
                 
                 >
 </cfoutput>
              </div>
    

       
        
    </cfif>
    
    
    
    
    

          <div class="form-group col-md-12">
          <label for="userLastName">URL<span class="text-danger">*</span></label>
           <cfoutput>
          
          <input class="form-control" type="text" id="new_siteurl" name="new_siteurl" value="#linkdetails.siteurl#"    
                       data-parsley-minlength="5" 
                data-parsley-minlength-message="Min length 5 characters" 
                data-parsley-maxlength="200" 
                data-parsley-maxlength-message="Max length 200 characters" 
              
                  placeholder="Enter your  URL">
</cfoutput>
          
                </div>

 <div class="form-group col-md-12">
    
 



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

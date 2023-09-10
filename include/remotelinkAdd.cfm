<CFINCLUDE template="/include/remote_load.cfm" /> 
<cfparam name="target" default="myaccount"  />

<form action="/include/remotelinkadd2.cfm" method="post" class="parsley-examples" data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden"
  data-parsley-trigger="keyup" data-parsley-validate id="profile-form">
    <cfoutput>   <input type="hidden" name="new_sitetypeid" value="#New_sitetypeid#" >
        <input type="hidden" name="userid" value="#userid#" >
    <input type="hidden" name="target_id" value="#new_sitetypeid#" >
      <input type="hidden" name="target" value="#target#" >
    </cfoutput>
    
    
    
        <div class="row">
    
      <div class="form-group col-md-12">

           
            <div class="form-group col-md-12">
          <label for="userLastName">Site Name<span class="text-danger">*</span></label>
  
          <input class="form-control" type="text" id="new_siteName" name="new_siteName"  
                       data-parsley-minlength="3" 
                data-parsley-minlength-message="Min length 3 characters" 
                data-parsley-maxlength="200" 
                data-parsley-maxlength-message="Max length 200 characters" 
    
                 
                  data-parsley-trigger="focusout" data-parsley-checksitename data-parsley-checksitename-message="Site Name already Exists"
                 
                 
                 placeholder="Enter Site Name">
 
          
                </div>

          <div class="form-group col-md-12">
          <label for="userLastName">URL<span class="text-danger">*</span></label>
       
          
          <input class="form-control" type="text" id="new_siteurl" name="new_siteurl" value=""  data-parsley-minlength="4" 
     
                data-parsley-trigger="focusout" data-parsley-checksiteurl data-parsley-checksitename-message="Site URL already Exists"
                  placeholder="Enter your  URL">
 
     
                </div>




      <div class="form-group text-center col-md-12">
                            <button class=" btn btn-primary editable-submit btn-sm waves-effect waves-light" type="submit" style="background-color: #406e8e; border: ##406e8e;">Add</button>
                        </div>

      
    
    </div>
</form>
    
    
    <script>      
 $(document).ready(function() {
    $(".parsley-examples").parsley()
});
 </script> 
    
    <script>
  $(document).ready(function(){
      
    $('#new_siteName').parsley();

    window.Parsley.addValidator('checksitename', {
      validateString: function(value)
      {
        return $.ajax({
          url:'/include/fetch_sitename.php?userID=<Cfoutput>#userid#</cfoutput>',
          method:"POST",
          data:{sitename:value},
          dataType:"json",
          success:function(data)
          {
            return true;
          }
        });
      }
    });

  });
</script>
    
    <script>
  $(document).ready(function(){
      
    $('#new_siteurl').parsley();

    window.Parsley.addValidator('checksiteurl', {
      validateString: function(value)
      {
        return $.ajax({
          url:'/include/fetch_siteurl.php?userID=<Cfoutput>#userid#</cfoutput>',
          method:"POST",
          data:{siteurl:value},
          dataType:"json",
          success:function(data)
          {
            return true;
          }
        });
      }
    });

  });
</script>
    
    <cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" /><cfinclude template="/include/bigbrotherinclude.cfm" /> 
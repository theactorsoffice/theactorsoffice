<CFINCLUDE template="/include/remote_load.cfm" /> 


<form action="/include/remotePaneladd2.cfm" method="post" class="parsley-examples" data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden"
  data-parsley-trigger="keyup" data-parsley-validate id="profile-form">
    
    
   <cfoutput> 
    
     
        <input type="hidden" name="userid" value="#userid#" >
  <input type="hidden" name="pgrtn" value="#pgrtn#" >
    </cfoutput>
    
    
    
        <div class="row">
    
      <div class="form-group col-md-12">

           
            <div class="form-group col-md-12">
          <label for="new_pnTitle">Panel Name<span class="text-danger">*</span></label>
  
          <input class="form-control" type="text" id="new_sitetypename" name="new_sitetypename"  
   
                data-parsley-required="true"
                data-parsley-trigger="focusout" 
                data-parsley-checksitetypename 
                data-parsley-checksitetypename-message="Panel already Exists"
                placeholder="Enter Panel Name">
 
          
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
      
    $('#new_sitetypename').parsley();

    window.Parsley.addValidator('checksitetypename', {
      validateString: function(value)
      {
        return $.ajax({
          url:'/include/fetch_sitetypename.php?userID=<cfoutput>#userID#</cfoutput>',
          method:"POST",
          data:{sitetypename:value},
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
    
    
<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" />
    
<cfinclude template="/include/bigbrotherinclude.cfm" /> 
<form action="/include/remoteticketupdate2.cfm" method="post" class="parsley-examples"  data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden"
  data-parsley-trigger="keyup" data-parsley-validate id="actinglinks_update">

    
        <div class="row" />
    
    

    



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

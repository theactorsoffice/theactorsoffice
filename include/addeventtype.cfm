

<form action="/include/addeventtypeadd.cfm" method="post" class="needs-validation" validate id="profile-form">
    <cfoutput>
           <input type="hidden" name="new_iscustom" value="1" >
    </cfoutput>
    
    
        <div class="row" />
    
    
    

    
    
    
    
                <div class="form-group col-md-12">
          <label for="new_eventtypename">Name:</label>
  <cfoutput>
          <input class="form-control" type="text" id="new_eventtypename" name="new_eventtypename"  required placeholder="Enter an Event Type">
 </cfoutput>
                <div class="invalid-feedback">
                    Please enter your Event Type Name.
                </div>
                </div>
    

 
    
    
    

          <div class="form-group col-md-12">
          <label for="hexa-colorpicker">Color:</label>
   
          <input type="text" id="hexa-colorpicker" name="new_eventtypecolor" value="#FFFFFF" class="form-control" >
          
 
                <div class="invalid-feedback">
                    Please enter a color.
                </div>
                </div>
        
       

      <div class="form-groupcol-md-12">
                            <button class="btn btn-primary editable-submit btn-sm waves-effect waves-light" type="submit" style="background-color: #406e8e; border: ##406e8e;">Add</button>
                        </div>

      
    
    </div>
</form>

<script>
   $(function () {
      $('#hexa-colorpicker').colorpicker();
   });
</script>




<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" /><cfinclude template="/include/bigbrotherinclude.cfm" /> 

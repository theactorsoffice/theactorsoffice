<script>
function unlock(){
    document.getElementById('buttonSubmit').removeAttribute("disabled");
}
</script>

<CFINCLUDE template="/include/remote_load.cfm" />
<cfparam name="placeholder" default="" />
 
<cfquery name="FindUser" datasource="#dsn#">
    SELECT
    u.userid
    ,u.recordname
    ,u.userFirstName
    ,u.userLastName
    ,u.userEmail
    ,u.contactid
    ,u.userRole
    ,u.calstarttime
    ,u.calendtime
    ,u.avatarname
    ,u.IsBetaTester
    ,u.defRows
    
    
    ,u.contactid AS userContactID
    ,u.tzid
    FROM taousers u
    WHERE u.userid = '#session.userid#'
</cfquery>

   <cfquery datasource="#dsn#" name="notes"  >             
 SELECT * from noteslog where noteid = #noteid#
                </cfquery> 

 

 
 <form action="/include/attachmentadd2aud.cfm" method="post" class="parsley-examples" enctype="multipart/form-data" id="upload" data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden"
  data-parsley-trigger="keyup" data-parsley-validate>
     <cfoutput>
 
                  <input type="hidden" name="returnurl" value="#returnurl#">
          <input type="hidden" name="noteid" value="#noteid#">
          <input type="hidden" name="audprojectid" value="#audprojectid#">
 
                    <input type="hidden" name="rcontactid" value="#contactid#">
     </cfoutput>


     <div class="row" />

     <cfset placeholder="https://" />

     <cfset minlength="3" />
     
   
     

     <div class="form-group col-md-12">

         <label for="attachmenturl">Upload File <span class="text-danger">*</span></label>
<p>
            <input name="file" onchange="unlock();" type="file"  />
 
</p>

     </div>



         <div class="form-group text-center col-md-12">
             <button class=" btn btn-primary editable-submit btn-sm waves-effect waves-light" type="submit" style="background-color: #406e8e; border: #406e8e;" id="buttonSubmit" disabled >Upload</button>
         </div>
     
     
            <div class="form-group col-md-12">

         <label for="attachname">Name (Optional)</label>

         <input class="form-control" type="text" id="attachname" name="attachname" data-parsley-maxlength="800" data-parsley-maxlength-message="Max length 800 characters"  v placeholder="Add a name/brief description">


     </div>
     



         </div>
 </form>
        
    <script>      
 $(document).ready(function() {
    $(".parsley-examples").parsley()
});
 </script>     

        


        
        
<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" /><cfinclude template="/include/bigbrotherinclude.cfm" /> 

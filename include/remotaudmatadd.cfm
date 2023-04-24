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

   <cfquery datasource="#dsn#" name="Type"  >             
SELECT mediatypeid,mediatype from audmediatypes WHERE mediatypeid in (1,2,3,5,6,7,8)
                </cfquery> 

 
 <form action="/include/remoteaudmatadd2.cfm" method="post" class="parsley-examples" enctype="multipart/form-data" id="upload" >
     <cfoutput>
      
           <input type="hidden" name="audprojectid" value="#audprojectid#">
 
        
     </cfoutput>


     <div class="row" />

     <cfset placeholder="https://" />

     <cfset minlength="3" />
     
   
    <div class="form-group col-md-6 col-sm-12">
    <label for="new_mediatypeid">Media Type<span class="text-danger">*</span></label>

    <select id="new_mediatypeid" name="new_mediatypeid" class="form-control" data-parsley-required data-parsley-error-message="Media Type is required">
     

        <cfoutput query="type">
            <option value="#type.mediatypeid#"   >#type.mediatype#</option>
        </cfoutput>

    </select>


</div>
     
     
   

     <div class="form-group col-md-12">

         <label for="attachmenturl">Upload File <span class="text-danger">*</span></label>
<p>
            <input name="file" onchange="unlock();" type="file"  />
 
</p>

     </div>



         <div class="form-group text-center col-md-12">
             <button class=" btn btn-primary editable-submit btn-sm waves-effect waves-light" type="submit" style="background-color: #406e8e; border: #406e8e;" id="buttonSubmit" disabled >Upload  </button>
         </div>
     
     
            <div class="form-group col-md-12">

         <label for="attachname">Name (Optional)</label>

         <input class="form-control" type="text" id="new_medianame" name="new_medianame" data-parsley-maxlength="800" data-parsley-maxlength-message="Max length 800 characters"    placeholder="Add a name/brief description">


     </div>
     



         </div>
 </form>
        
    <script>      
 $(document).ready(function() {
    $(".parsley-examples").parsley()
});
 </script>     

        


        
        
<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" /><cfinclude template="/include/bigbrotherinclude.cfm" /> 

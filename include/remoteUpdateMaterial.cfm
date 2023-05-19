<script>
$(document).keypress(function (e) {
    if (e.which == 13 && e.target.nodeName != "TEXTAREA") {
        event.preventDefault();
        return false;
    }
});
</script>

<script>
function unlock(){
    document.getElementById('buttonSubmit').removeAttribute("disabled");
}
</script>


<CFINCLUDE template="/include/remote_load.cfm" />
<cfparam name="placeholder" default="" />
<cfparam name="audid" default="" />
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

<cfinclude template="/include/qry/materials_details.cfm" />

   <cfquery datasource="#dsn#" name="Type"  >             
SELECT mediatypeid,mediatype from audmediatypes WHERE mediatype <> 'Headshot' and isdeleted = 0
                </cfquery>  

 
 <form action="/include/remoteUpdateMaterial2.cfm" method="post" class="parsley-examples" enctype="multipart/form-data" id="upload" data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden"
  data-parsley-trigger="keyup" data-parsley-validate>


     <div class="row" />

     <cfset placeholder="https://" />

     <cfset minlength="3" />
     
<cfoutput query="materials_details" >
 
    <div class="form-group col-md-6 col-sm-12">
    <label for="new_mediatypeid">Media Type<span class="text-danger">*</span></label>


</cfoutput>


    <select id="new_mediatypeid" name="new_mediatypeid" class="form-control" data-parsley-required data-parsley-error-message="Media Type is required">
     
  <option value=""   >SELECT A TYPE</option>
        <cfoutput query="type">
            <option value="#type.mediatypeid#"   >#type.mediatype#</option>
        </cfoutput>

    </select>


</div>


<cfoutput query="materials_details" >


            <div class="form-group col-md-12">

         <label for="new_medianame">Name</label>

         <input class="form-control" type="text" id="new_medianame" name="new_medianame" data-parsley-maxlength="800" data-parsley-maxlength-message="Max length 800 characters"    placeholder="Add a name/brief description">


     </div>


            <div class="form-group col-md-12">

         <label for="new_medialoc">Location</label>

         <input class="form-control" type="text" id="new_medialoc" name="new_medialoc" data-parsley-maxlength="800" data-parsley-maxlength-message="Max length 800 characters"    placeholder="Add a physical location">


     </div>

               <div class="form-group col-md-12">

         <label for="new_medialoc">URL</label>

         <input class="form-control" type="text" id="new_mediaurl" name="new_mediaurl" data-parsley-maxlength="800" data-parsley-maxlength-message="Max length 800 characters"    placeholder="Add a URL">


     </div>

     </cfoutput>
   




         <div class="form-group text-center col-md-12">
             <button class="btn btn-primary editable-submit btn-sm waves-effect waves-light" type="submit"  id="buttonSubmit"  style="background-color: #406e8e; border: #406e8e;" >Update  </button>
         </div>
     
     

     



         </div>
 </form>
        
    <script>      
 $(document).ready(function() {
    $(".parsley-examples").parsley()
});
 </script>     

        


        
        
<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" /><cfinclude template="/include/bigbrotherinclude.cfm" /> 

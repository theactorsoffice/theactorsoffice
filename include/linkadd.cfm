<CFINCLUDE template="/include/remote_load.cfm" />
<cfparam name="placeholder" default="" />
<cfparam name="contactid" default="0" />

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

<cfset new_eventid = notes.eventid />

 
 <form action="/include/linkadd2.cfm" method="post" class="parsley-examples"  id="linkadd" data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden"
  data-parsley-trigger="keyup" data-parsley-validate>
     <cfoutput>
           <input type="hidden" name="rcontactid" value="#contactid#">
         <input type="hidden" name="reventid" value="#new_eventid#">
                 <input type="hidden" name="contactid" value="#contactid#">
         <input type="hidden" name="eventid" value="#new_eventid#">
                  <input type="hidden" name="returnurl" value="#returnurl#">
          <input type="hidden" name="noteid" value="#noteid#">
  
             <cfif #isdefined('audprojectid')#>
         <input type="hidden" name="audprojectid" value="#audprojectid#">
         </cfif>
     </cfoutput>


     <div class="row" />

     <cfset placeholder="https://" />

     <cfset minlength="3" />
     
          <div class="form-group col-md-12">

         <label for="linkname">Name <span class="text-danger">*</span></label>

         <input class="form-control" type="text" id="linkname" name="linkname" data-parsley-maxlength="800" data-parsley-maxlength-message="Max length 800 characters"  data-parsley-required="true" placeholder="Enter Name or Title">


     </div>
     
     

     <div class="form-group col-md-12">

         <label for="linkurl">URL <span class="text-danger">*</span></label>

         <input class="form-control" type="text" id="linkurl" name="linkurl" data-parsley-maxlength="800" data-parsley-maxlength-message="Max length 800 characters" data-parsley-required="true" placeholder="Enter URL">


     </div>



         <div class="form-group text-center col-md-12">
             <button class=" btn btn-primary editable-submit btn-sm waves-effect waves-light" type="submit" style="background-color: #406e8e; border: #406e8e;">Add</button>
         </div>



         </div>
 </form>
        
    <script>      
 $(document).ready(function() {
    $(".parsley-examples").parsley()
});
 </script>     

        


        
        
<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" /><cfinclude template="/include/bigbrotherinclude.cfm" /> 

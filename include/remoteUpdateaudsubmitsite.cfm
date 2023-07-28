 
<CFINCLUDE template="/include/remote_load.cfm" />
 
   


     <cfquery name="details" datasource="#dsn#"   >
                SELECT submitsiteid,submitsitename, catlist
        FROM audsubmitsites_user 
        WHERE submitsiteid = #submitsiteid#
     </cfquery>
<cfset old_catlist = details.catlist />

<form method="post" action="/include/remoteupdateaudsubmitsite2.cfm" class="parsley-examples" name="version-form" id="form-version"   data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden"
  data-parsley-trigger="keyup" data-parsley-validate>
                  

     
      
     
     
     
     
     
      
                    <cfoutput>  <input type="hidden" name="userid" value="#session.userid#" >
     <input type="hidden" name="submitsiteid" value="#submitsiteid#" >
     
     </cfoutput>
                     <div class="row">
            
      
                         
                  
         <cfoutput>  
                        <div class="form-group col-md-12">

                                 <label class="control-label">Submission  Site</label>
<input class="form-control"  required  type="text" value="#details.submitsitename#" name="new_submitsitename" id="new_submitsitename" />  
                          
                             </div>
             
                            <div class="invalid-feedback">
                    Please enter a Submission Site.
                </div>
             
             </cfoutput>

             <cfquery name="getCategories" datasource="#dsn#">
  SELECT audcatid, audcatname 
  FROM audcategories 
  WHERE isdeleted = 0 
  ORDER BY audcatname
</cfquery>

<div class="form-group col-md-12">
  <label class="control-label">Valid Audition Categories:</label>
  <div class="custom-group custom-checkbox">
    <cfloop query="getCategories">
      <div class="form-check"  style="margin-left:25px;">
        <cfoutput>
          <input class="form-check-input" type="checkbox" value="#audcatid#" id="catlist#audcatid#" name="catlist" 
          <cfif listFind(old_catlist, audcatid)>checked</cfif>>
          <label class="form-check-label" for="catlist#audcatid#">
            #audcatname#
          </label>
        </cfoutput>
      </div>
    </cfloop>
  </div>
</div>
             
                       <cfquery name="findsubs" datasource="#dsn#">
                       Select * from audroles where userid = #session.userid# and subsiteid = #subsiteid#
                       </cfquery>

                       <cfif #findsubs.recordcount# is "0">

                       <cfset disable_tag = "" />

                       <cfelse>
<cfset disable_tag = "disabled" />
                       </cfif>
             
             <div class="custom-group custom-checkbox">

<div style="margin-left:25px;">    <cfoutput>   
                <label class="custom-control-label">
             <input type="checkbox" #disable_tag# class="custom-control-input" id="IsDeleted" value="1" name="IsDeleted"  >
               <span class="custom-control-label" Style="color:#disable_tag#red;" for="deleteitem">Delete</span></label>
            </div>   </cfoutput>  

<cfif #disable_tag# is "disabled"><p><i>*Submission sites in use cannot be deleted.</i></p>
</div>
             
             
             
             
             
             
             
             
             
             
                         </div>
             
             
    
                
                

                
                
                     <div class="row mt-2">
                         <div class="col-6">
            
                         </div>
                         <div class="col-6 text-right">
                           <button type="button" class="btn btn-light mr-1 btn-sm" data-bs-dismiss="modal">Cancel</button> 
                             <button type="submit" class="btn btn-primary btn-sm waves-effect waves-light" id="btn-save-event">Update</button>
                         </div>
                     </div>
                 </form>



</div>    
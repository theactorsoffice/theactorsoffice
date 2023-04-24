<cfset dbug = "N" />

<cfparam name="focusid" default="0" />

<CFINCLUDE template="/include/remote_load.cfm" />

<cfquery name="aud_details" datasource="#dsn#">
SELECT 
r.`audroleid`,
r.audprojectid,
r.auddialectid,
r.`audRoleName`, 
r.`charDescription`, 
r.`holdStartDate`, 
r.`holdEndDate`, 
rt.audroletype, 
r.audroletypeid,
di.auddialect,
s.audsource,
r.audsourceid,
 
subcat.audcatid,
proj.audprojectid
FROM audroles r 
 
	LEFT OUTER JOIN audroletypes rt ON ( r.`audRoleTypeID` = rt.audroletypeid  )  
	LEFT OUTER JOIN auddialects di ON ( r.`audDialectID` = di.auddialectid  )  
    LEFT OUTER JOIN audsources s on (r.audsourceid = s.audsourceid)
    inner join audprojects proj on proj.audprojectid = proj.audprojectid
 
	inner JOIN audsubcategories subcat ON ( proj.`audSubCatID` = subcat.`audSubCatId`  )  
    
    
WHERE r.audroleid = #audroleid#
</cfquery>
  <cfinclude template="/include/qry/audlocations_sel.cfm">   
<cfset audprojectid = aud_details.audprojectid />

 
<cfparam name="new_audstepid" default="1">

<cfset new_audcatid = aud_details.audcatid />

 
 
<cfquery name="audtypes_sel" datasource="#dsn#">
SELECT audtypeid as id,audtype as name,audcatid FROM audtypes WHERE isdeleted = 0 and audcatid = #new_audcatid#  
    
    ORDER BY audtype
</cfquery>

<cfquery name="audsteps_sel" datasource="#dsn#">
SELECT audstepid as id,audstep as NAME 
FROM audsteps 
WHERE isdeleted = 0  
ORDER BY audstep
</cfquery>
<cfinclude template="/include/qry/audplatforms_sel.cfm" />

<cfset dbug = "N" />
     <script src="/app/assets/js/jquery.chained.js"></script>
<p>Enter the information below and press the update button to continue.</p>
<form action="/include/remoteaudaddform2.cfm" method="post"  class="parsley-examples" name="event-form" id="form-event"  data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden"
  data-parsley-trigger="keyup" data-parsley-validate>
<cfoutput> 
      <input type="hidden" name="focusid" value="#focusid#" />
         <input type="hidden" name="audprojectid" value="#audprojectid#" />
        <input type="hidden" name="new_userid" value="#userid#" />
   <input type="hidden" name="new_audstepid" value="#new_audstepid#" />   
       <input type="hidden" name="secid" value="#secid#" />     
    <input type="hidden" name="new_audroleid" value="#aud_details.audroleid#" />
</cfoutput>
    <div class="row" />


    
    
    
    
    
    
    
    
        
      <div class="form-group col-md-6 col-sm-12">
    <label for="audtypeid">Type<span class="text-danger">*</span></label>

    <select id="audtypeid" name="new_audtypeid" class="form-control" data-parsley-required data-parsley-error-message="Type is required">
        <option value="">--</option>

        <cfoutput query="audtypes_sel">
            <option value="#audtypes_sel.id#" data-chained="#audtypes_sel.audcatid#"  >#audtypes_sel.name#</option>
        </cfoutput>

    </select>


</div>

              <input type="hidden" value="audstepid" value="4" />

 

 
      <div class="form-group col-md-6 col-sm-12">
    <label for="audplatformid">Audition Platform<span class="text-danger">*</span></label>

    <select id="audplatformid" name="new_audplatformid" class="form-control" data-parsley-required data-parsley-error-message="platform is required">
        
 
        <option value="">--</option>

        <cfoutput query="audplatforms_sel">
            <option value="#audplatforms_sel.id#"  >#audplatforms_sel.name#</option>
        
    
        </cfoutput>
           
    </select>


</div>
    
  
 
         <div class="form-group col-md-6">
                 <label for="new_audstartdate">Start Date<span class="text-danger">*</span></label>
                 <input id="new_audstartdate"  class="form-control" autocomplete="off" name="new_audstartdate"   type="date" data-parsley-required data-parsley-error-message="Start Date is required">
                 

                    
             </div>
                         
  
 
              
              
              
 
             <div class="form-group col-md-6">
                 <label for="new_audstartTime">Start Time<span class="text-danger">*</span></label>
             

 

     <select class="form-control" name="new_audstartTime"  autocomplete="off" id="new_audstartTime"  data-parsley-required data-parsley-error-message="Start Time is required">
         <option value="">Select a Start Time</option>

option value="07:00">07:00 AM</option>
<option value="07:15">07:15 AM</option>
<option value="07:30">07:30 AM</option>
<option value="07:45">07:45 AM</option>
<option value="08:00">08:00 AM</option>
<option value="08:15">08:15 AM</option>
<option value="08:30">08:30 AM</option>
<option value="08:45">08:45 AM</option>
<option value="09:00">09:00 AM</option>
<option value="09:15">09:15 AM</option>
<option value="09:30">09:30 AM</option>
<option value="09:45">09:45 AM</option>
<option value="10:00">10:00 AM</option>
<option value="10:15">10:15 AM</option>
<option value="10:30">10:30 AM</option>
<option value="10:45">10:45 AM</option>
<option value="11:00">11:00 AM</option>
<option value="11:15">11:15 AM</option>
<option value="11:30">11:30 AM</option>
<option value="11:45">11:45 AM</option>
<option value="12:00">12:00 PM</option>
<option value="12:15">12:15 PM</option>
<option value="12:30">12:30 PM</option>
<option value="12:45">12:45 PM</option>
<option value="13:00">01:00 PM</option>
<option value="13:15">01:15 PM</option>
<option value="13:30">01:30 PM</option>
<option value="13:45">01:45 PM</option>
<option value="14:00">02:00 PM</option>
<option value="14:15">02:15 PM</option>
<option value="14:30">02:30 PM</option>
<option value="14:45">02:45 PM</option>
<option value="15:00">03:00 PM</option>
<option value="15:15">03:15 PM</option>
<option value="15:30">03:30 PM</option>
<option value="15:45">03:45 PM</option>
<option value="16:00">04:00 PM</option>
<option value="16:15">04:15 PM</option>
<option value="16:30">04:30 PM</option>
<option value="16:45">04:45 PM</option>
<option value="17:00">05:00 PM</option>
<option value="17:15">05:15 PM</option>
<option value="17:30">05:30 PM</option>
<option value="17:45">05:45 PM</option>
<option value="18:00">06:00 PM</option>
<option value="18:15">06:15 PM</option>
<option value="18:30">06:30 PM</option>
<option value="18:45">06:45 PM</option>
<option value="19:00">07:00 PM</option>
<option value="19:15">07:15 PM</option>
<option value="19:30">07:30 PM</option>
<option value="19:45">07:45 PM</option>
<option value="20:00">08:00 PM</option>
<option value="20:15">08:15 PM</option>
<option value="20:30">08:30 PM</option>
<option value="20:45">08:45 PM</option>
<option value="21:00">09:00 PM</option>
<option value="21:15">09:15 PM</option>
<option value="21:30">09:30 PM</option>
<option value="21:45">09:45 PM</option>
<option value="22:00">10:00 PM</option>
<option value="22:15">10:15 PM</option>
<option value="22:30">10:30 PM</option>
<option value="22:45">10:45 PM</option>
<option value="23:00">11:00 PM</option>
<option value="23:15">11:15 PM</option>
<option value="23:30">11:30 PM</option>
<option value="23:45">11:45 PM</option>

                 </select>
                     
                     
             </div>
     
     


             <div class="form-group col-md-6">
                 <label for="new_audendtime">End Time</label>
     <select class="form-control" name="new_audendtime"  autocomplete="off" id="new_audendtime"  >
         <option value="">Select a Stop Time</option>
option value="07:00">07:00 AM</option>
<option value="07:15">07:15 AM</option>
<option value="07:30">07:30 AM</option>
<option value="07:45">07:45 AM</option>
<option value="08:00">08:00 AM</option>
<option value="08:15">08:15 AM</option>
<option value="08:30">08:30 AM</option>
<option value="08:45">08:45 AM</option>
<option value="09:00">09:00 AM</option>
<option value="09:15">09:15 AM</option>
<option value="09:30">09:30 AM</option>
<option value="09:45">09:45 AM</option>
<option value="10:00">10:00 AM</option>
<option value="10:15">10:15 AM</option>
<option value="10:30">10:30 AM</option>
<option value="10:45">10:45 AM</option>
<option value="11:00">11:00 AM</option>
<option value="11:15">11:15 AM</option>
<option value="11:30">11:30 AM</option>
<option value="11:45">11:45 AM</option>
<option value="12:00">12:00 PM</option>
<option value="12:15">12:15 PM</option>
<option value="12:30">12:30 PM</option>
<option value="12:45">12:45 PM</option>
<option value="13:00">01:00 PM</option>
<option value="13:15">01:15 PM</option>
<option value="13:30">01:30 PM</option>
<option value="13:45">01:45 PM</option>
<option value="14:00">02:00 PM</option>
<option value="14:15">02:15 PM</option>
<option value="14:30">02:30 PM</option>
<option value="14:45">02:45 PM</option>
<option value="15:00">03:00 PM</option>
<option value="15:15">03:15 PM</option>
<option value="15:30">03:30 PM</option>
<option value="15:45">03:45 PM</option>
<option value="16:00">04:00 PM</option>
<option value="16:15">04:15 PM</option>
<option value="16:30">04:30 PM</option>
<option value="16:45">04:45 PM</option>
<option value="17:00">05:00 PM</option>
<option value="17:15">05:15 PM</option>
<option value="17:30">05:30 PM</option>
<option value="17:45">05:45 PM</option>
<option value="18:00">06:00 PM</option>
<option value="18:15">06:15 PM</option>
<option value="18:30">06:30 PM</option>
<option value="18:45">06:45 PM</option>
<option value="19:00">07:00 PM</option>
<option value="19:15">07:15 PM</option>
<option value="19:30">07:30 PM</option>
<option value="19:45">07:45 PM</option>
<option value="20:00">08:00 PM</option>
<option value="20:15">08:15 PM</option>
<option value="20:30">08:30 PM</option>
<option value="20:45">08:45 PM</option>
<option value="21:00">09:00 PM</option>
<option value="21:15">09:15 PM</option>
<option value="21:30">09:30 PM</option>
<option value="21:45">09:45 PM</option>
<option value="22:00">10:00 PM</option>
<option value="22:15">10:15 PM</option>
<option value="22:30">10:30 PM</option>
<option value="22:45">10:45 PM</option>
<option value="23:00">11:00 PM</option>
<option value="23:15">11:15 PM</option>
<option value="23:30">11:30 PM</option>
<option value="23:45">11:45 PM</option>
                 </select>

             


             </div>
      
      
    
    
     <div class="form-group col-md-6 col-sm-12">
                 <label for="new_audLocation">Physical Location<span class="text-danger">*</span></label>
                             
                            
                            
                            <select id="new_audlocid" class="form-control" name="new_audlocid" data-parsley-required data-parsley-error-message="Location is required" onchange="if (this.value=='custom'){this.form['custom'].style.visibility='visible',this.form['custom'].required=true} else {this.form['custom'].style.visibility='hidden',this.form['custom'].required=false};">
        <option value="">--</option>
                                        <option value="custom">***ADD NEW***</option>
                                
        <cfoutput query="audlocations_sel">
            <option value="#audlocations_sel.id#">#audlocations_sel.name#</option>
        </cfoutput>
    </select>
                            
                            
                                    <div class="form-group col-md-12 pt-3" id="special" style="visibility:hidden">
        


                <input class="form-control" type="text" id="custom" name="custom" style="visibility:hidden;" value="" placeholder="Enter Custom Location">


        </div>
                                        
                                        
                                        
                                        
                                        
                                        
                            
                            
                          <label for="new_audstartdate">Zoom Link<span class="text-danger">*</span></label>
                            
                 <input class="form-control" type="text" id="new_audLocation"  autocomplete="off"   data-parsley-error-message=" Zoom linkis required"  name="new_audLocation" placeholder="Location">
                            
                            
                     
                            
                            
                            
                            
                            
                            
                            
     </div>
      
      
     
     
     
     
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
    
    
    
    
    
    
    
    
    
    
     
          
                           <div class="form-group col-md-12">
                 <label for="new_parkingDetails">Parking Details</label>
                 <input class="form-control" type="text" id="new_parkingDetails"  autocomplete="off"    name="new_parkingDetails" placeholder="Location">
     </div>
          
                <div class="form-group col-md-6">
          <div class="custom-group custom-checkbox">

        <div style="margin-left:25px;">
            <label class="custom-control-label">
                <input type="checkbox" class="custom-control-input" id="workwithcoach" value="1"
                       
               
                       name="new_workwithcoach">
                <span class="custom-control-label" for="workwithcoach">Worked with Coach</span></label>
        </div>
    </div>
          </div>


                <div class="form-group col-md-6">
          <div class="custom-group custom-checkbox">

        <div style="margin-left:25px;">
            <label class="custom-control-label">
                <input type="checkbox" class="custom-control-input" id="trackmileage" value="1"
                       
               
                       name="new_trackmileage">
                <span class="custom-control-label" for="trackmileage">Track Mileage</span></label>
        </div>
    </div>
          </div>


 
    <div class="form-group text-center  col-md-12">
        <button class="btn btn-xs btn-primary waves-effect mb-2 waves-light" style="background-color: #406e8e; border: #406e8e;" type="submit">Add</button>
    </div>

    </div>
</form>
        
            <script src="/app/assets/js/libs/parsleyjs/parsley.min.js"></script>

  <script>$("#new_audsubcatid").chained("#audcatid");</script>
 
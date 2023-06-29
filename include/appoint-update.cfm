
<cfparam name="reventid" default="0" />
<cfparam name="rcontactid" default="0" />

<cfinclude template="/include/qry/durations.cfm" />

<style>
   <cfif #eventdetails.dow# is "">
    #hidden_div {
    display: none;
}
    <cfelse>
    #hidden_div {
    display: block;
}
    
</cfif>
</style>
 

<script>
$(document).ready(function(){
$("#select-relationship").selectize({

      persist: !1,
                createOnBlur: !0,
                create: !0  ,
    
    
    plugins: ["remove_button"],
  delimiter: ",",
  persist: false,
  create: function (input) {
    return {
      value: input,
      text: input,
    };
  },
    
    
});
              
              });
</script>
  

<div class="row">


     <div class="col-xl-6 col-lg-8 col-md-12">
          <div class="card">




            <div class="card-body">
         
              <form method="post" action="/include/appoint-update2.cfm" class="parsley-examples" name="event-form" id="form-event"   data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden"
  data-parsley-trigger="keyup" data-parsley-validate>
                  
                  <cfoutput>
                      
                       <input type="hidden" name="reventid" value="#reventid#" >
                      <input type="hidden" name="returnurl" value="#returnurl#" >
                            <input type="hidden" name="rcontactid" value="#rcontactid#" >
                      <input type="hidden" name="eventid" value="#eventdetails.eventid#" >
                     <div class="row">
                         <div class="col-12">
                             <div class="form-group">
                                 <label class="control-label">Title<span class="text-danger">*</span></label>
                                 <input class="form-control" placeholder="Insert Appointment Title" value="#eventdetails.eventtitle#" type="text" name="eventTitle" id="eventTitle"  data-parsley-minlength="3" 
                data-parsley-minlength-message="Min length 3 characters" 
                data-parsley-maxlength="200" 
                data-parsley-maxlength-message="Max length 200 characters" 
                data-parsley-required data-parsley-error-message="Title is required" />  
                          
                             </div>
                         </div>
                         </cfoutput> 
                      
                      
 
                      

           <div class="col-lg-12">
                                <div class="form-group mb-3">
                                  <label for="select-relationship">Relationships:</label>
    <select id="select-relationship" name="relationships" multiple required class="demo-default selectize-close-btn" style="width: 100%" placeholder="Select a Relationship..." value="">
      <option value="">Select a Relationship...</option>
        
        
        <cfloop query="relationships">
            
            
            
            
                       <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="finde" >
            SELECT *
			FROM eventcontactsxref 
			WHERE contactID = #ContactID# and eventid = #eventdetails.eventid#

            </cfquery>
            
            <cfif #finde.recordcount# is "1">
            <cfset new_select = "selected" />
                
            <cfelse>
                <cfset new_select = "" />
                
            </cfif>
                
                
                
                
                
   
            <cfoutput>
         <option value="#contactid#" #new_select#>#recordname#</option>
                </cfoutput>
</cfloop>
        
        
    </select>
  </div>
   </div>
        
     
                     <cfoutput>
                            <div class="form-group col-md-12">
                 <label for="eventDescription">Description</label>
                 <textarea class="form-control" type="text" autocomplete="off" value="#eventdetails.eventDescription#" id="eventDescription" name="eventDescription" placeholder="Description" rows="4">#eventdetails.eventDescription#</textarea>
                 <div class="invalid-feedback">
                     Please enter a Description.
                 </div>
             </div>
             <div class="form-group col-md-12">
                 <label for="eventLocation">Location</label>
                 <input class="form-control" type="text" autocomplete="off" id="eventLocation" value="#eventdetails.eventlocation#" name="eventLocation" placeholder="Location">

                 <div class="invalid-feedback">
                     Please enter a Location.
                 </div>
             </div>
             <div class="form-group col-md-6">
                 <label for="eventStart">Start Date</label>
                 <input class="form-control" id="eventStart" autocomplete="off" value="#dateformat(eventdetails.eventstart,'YYYY-MM-dd')#"  name="eventStart" type="date">
                 <div class="invalid-feedback">
                     Please choose a Start Date.
                 </div>
             </div>
                         
                </cfoutput>
             <div class="form-group col-md-6">
                 <label for="eventTypeName">Type</label>
                 <select class="form-control" name="eventTypeName" autocomplete="off" id="eventTypeName">
                     <cfoutput query="types">
                         <option value="#types.eventtypename#" <cfif #types.eventtypename# is "#eventdetails.eventtypename#"> selected</cfif> >#types.eventtypename#</option>
</cfoutput>
</select>
                 <div class="invalid-feedback">
                     Please select a Type.
                 </div>

             </div>
              
              
              
<cfoutput> 
    
    
    
             <div class="form-group col-md-6">
                 <label for="eventStartTime">Start Time  </label>
   
 <select class="form-control" name="eventStartTime" id="eventStartTime" autocomplete="off"  data-parsley-required data-parsley-error-message="Start Time is required">
         <option value="">Select a Start Time</option>
<option value="00:00"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "00:00" > selected </cfif> >12:00 AM</option>
<option value="00:15"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "00:15" > selected </cfif> >12:15 AM</option>
<option value="00:30"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "00:30" > selected </cfif> >12:30 AM</option>
<option value="00:45"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "00:45" > selected </cfif> >12:45 AM</option>
<option value="01:00"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "01:00" > selected </cfif> >01:00 AM</option>
<option value="01:15"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "01:15" > selected </cfif> >01:15 AM</option>
<option value="01:30"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "01:30" > selected </cfif> >01:30 AM</option>
<option value="01:45"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "01:45" > selected </cfif> >01:45 AM</option>
<option value="02:00"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "02:00" > selected </cfif> >02:00 AM</option>
<option value="02:15"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "02:15" > selected </cfif> >02:15 AM</option>
<option value="02:30"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "02:30" > selected </cfif> >02:30 AM</option>
<option value="02:45"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "02:45" > selected </cfif> >02:45 AM</option>
<option value="03:00"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "03:00" > selected </cfif> >03:00 AM</option>
<option value="03:15"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "03:15" > selected </cfif> >03:15 AM</option>
<option value="03:30"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "03:30" > selected </cfif> >03:30 AM</option>
<option value="03:45"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "03:45" > selected </cfif> >03:45 AM</option>
<option value="04:00"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "04:00" > selected </cfif> >04:00 AM</option>
<option value="04:15"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "04:15" > selected </cfif> >04:15 AM</option>
<option value="04:30"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "04:30" > selected </cfif> >04:30 AM</option>
<option value="04:45"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "04:45" > selected </cfif> >04:45 AM</option>
<option value="05:00"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "05:00" > selected </cfif> >05:00 AM</option>
<option value="05:15"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "05:15" > selected </cfif> >05:15 AM</option>
<option value="05:30"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "05:30" > selected </cfif> >05:30 AM</option>
<option value="05:45"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "05:45" > selected </cfif> >05:45 AM</option>
<option value="06:00"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "06:00" > selected </cfif> >06:00 AM</option>
<option value="06:15"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "06:15" > selected </cfif> >06:15 AM</option>
<option value="06:30"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "06:30" > selected </cfif> >06:30 AM</option>
<option value="06:45"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "06:45" > selected </cfif> >06:45 AM</option>
<option value="07:00"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "07:00" > selected </cfif> >07:00 AM</option>
<option value="07:15"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "07:15" > selected </cfif> >07:15 AM</option>
<option value="07:30"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "07:30" > selected </cfif> >07:30 AM</option>
<option value="07:45"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "07:45" > selected </cfif> >07:45 AM</option>
<option value="08:00"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "08:00" > selected </cfif> >08:00 AM</option>
<option value="08:15"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "08:15" > selected </cfif> >08:15 AM</option>
<option value="08:30"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "08:30" > selected </cfif> >08:30 AM</option>
<option value="08:45"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "08:45" > selected </cfif> >08:45 AM</option>
<option value="09:00"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "09:00" > selected </cfif> >09:00 AM</option>
<option value="09:15"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "09:15" > selected </cfif> >09:15 AM</option>
<option value="09:30"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "09:30" > selected </cfif> >09:30 AM</option>
<option value="09:45"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "09:45" > selected </cfif> >09:45 AM</option>
<option value="10:00"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "10:00" > selected </cfif> >10:00 AM</option>
<option value="10:15"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "10:15" > selected </cfif> >10:15 AM</option>
<option value="10:30"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "10:30" > selected </cfif> >10:30 AM</option>
<option value="10:45"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "10:45" > selected </cfif> >10:45 AM</option>
<option value="11:00"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "11:00" > selected </cfif> >11:00 AM</option>
<option value="11:15"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "11:15" > selected </cfif> >11:15 AM</option>
<option value="11:30"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "11:30" > selected </cfif> >11:30 AM</option>
<option value="11:45"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "11:45" > selected </cfif> >11:45 AM</option>
<option value="12:00"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "12:00" > selected </cfif> >12:00 PM</option>
<option value="12:15"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "12:15" > selected </cfif> >12:15 PM</option>
<option value="12:30"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "12:30" > selected </cfif> >12:30 PM</option>
<option value="12:45"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "12:45" > selected </cfif> >12:45 PM</option>
<option value="13:00"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "13:00" > selected </cfif> >01:00 PM</option>
<option value="13:15"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "13:15" > selected </cfif> >01:15 PM</option>
<option value="13:30"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "13:30" > selected </cfif> >01:30 PM</option>
<option value="13:45"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "13:45" > selected </cfif> >01:45 PM</option>
<option value="14:00"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "14:00" > selected </cfif> >02:00 PM</option>
<option value="14:15"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "14:15" > selected </cfif> >02:15 PM</option>
<option value="14:30"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "14:30" > selected </cfif> >02:30 PM</option>
<option value="14:45"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "14:45" > selected </cfif> >02:45 PM</option>
<option value="15:00"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "15:00" > selected </cfif> >03:00 PM</option>
<option value="15:15"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "15:15" > selected </cfif> >03:15 PM</option>
<option value="15:30"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "15:30" > selected </cfif> >03:30 PM</option>
<option value="15:45"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "15:45" > selected </cfif> >03:45 PM</option>
<option value="16:00"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "16:00" > selected </cfif> >04:00 PM</option>
<option value="16:15"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "16:15" > selected </cfif> >04:15 PM</option>
<option value="16:30"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "16:30" > selected </cfif> >04:30 PM</option>
<option value="16:45"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "16:45" > selected </cfif> >04:45 PM</option>
<option value="17:00"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "17:00" > selected </cfif> >05:00 PM</option>
<option value="17:15"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "17:15" > selected </cfif> >05:15 PM</option>
<option value="17:30"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "17:30" > selected </cfif> >05:30 PM</option>
<option value="17:45"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "17:45" > selected </cfif> >05:45 PM</option>
<option value="18:00"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "18:00" > selected </cfif> >06:00 PM</option>
<option value="18:15"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "18:15" > selected </cfif> >06:15 PM</option>
<option value="18:30"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "18:30" > selected </cfif> >06:30 PM</option>
<option value="18:45"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "18:45" > selected </cfif> >06:45 PM</option>
<option value="19:00"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "19:00" > selected </cfif> >07:00 PM</option>
<option value="19:15"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "19:15" > selected </cfif> >07:15 PM</option>
<option value="19:30"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "19:30" > selected </cfif> >07:30 PM</option>
<option value="19:45"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "19:45" > selected </cfif> >07:45 PM</option>
<option value="20:00"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "20:00" > selected </cfif> >08:00 PM</option>
<option value="20:15"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "20:15" > selected </cfif> >08:15 PM</option>
<option value="20:30"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "20:30" > selected </cfif> >08:30 PM</option>
<option value="20:45"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "20:45" > selected </cfif> >08:45 PM</option>
<option value="21:00"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "21:00" > selected </cfif> >09:00 PM</option>
<option value="21:15"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "21:15" > selected </cfif> >09:15 PM</option>
<option value="21:30"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "21:30" > selected </cfif> >09:30 PM</option>
<option value="21:45"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "21:45" > selected </cfif> >09:45 PM</option>
<option value="22:00"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "22:00" > selected </cfif> >10:00 PM</option>
<option value="22:15"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "22:15" > selected </cfif> >10:15 PM</option>
<option value="22:30"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "22:30" > selected </cfif> >10:30 PM</option>
<option value="22:45"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "22:45" > selected </cfif> >10:45 PM</option>
<option value="23:00"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "23:00" > selected </cfif> >11:00 PM</option>
<option value="23:15"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "23:15" > selected </cfif> >11:15 PM</option>
<option value="23:30"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "23:30" > selected </cfif> >11:30 PM</option>
<option value="23:45"  <cfif #timeformat(eventdetails.eventStartTime,'HH:MM')# is "23:45" > selected </cfif> >11:45 PM</option>

                 </select>


             </div>



</cfoutput>


               <div class="form-group col-md-6">
                                <label for="new_eventStopTime">Duration</label>
                                <select class="form-control" name="new_durid" autocomplete="off" id="new_durid">
                                    <cfoutput query="durations">
                                        <option value="#durations.durid#" <cfif #durations.durid# is "#new_durid#"> selected </cfif> >#durations.durname#</option>
                                    </cfoutput>
                                </select>
                </div>




<cfoutput> 


   <div class="form-group col-md-12">    
        <label for="eventStopTime">Recurring every:</label>
<div id="checkboxes">
    <input type="checkbox" name="dow" value="1" <cfif #eventdetails.dow# contains "1">checked</cfif>  onchange="showDiv('hidden_div', this)"> Monday
    &nbsp;<input type="checkbox" name="dow" value="2" <cfif #eventdetails.dow# contains "2">checked</cfif> onchange="showDiv('hidden_div', this)" > Tuesday
    &nbsp; <input type="checkbox" name="dow" value="3" <cfif #eventdetails.dow# contains "3">checked</cfif>  onchange="showDiv('hidden_div', this)"> Wednesday
     &nbsp;<input type="checkbox" name="dow" value="4" <cfif #eventdetails.dow# contains "4">checked</cfif> onchange="showDiv('hidden_div', this)" > Thursday
    &nbsp; <input type="checkbox" name="dow" value="5" <cfif #eventdetails.dow# contains "5">checked</cfif> onchange="showDiv('hidden_div', this)" > Friday
    &nbsp; <input type="checkbox" name="dow" value="6" <cfif #eventdetails.dow# contains "6">checked</cfif> onchange="showDiv('hidden_div', this)" > Saturday
    &nbsp; <input type="checkbox" name="dow" value="0" <cfif #eventdetails.dow# contains "0">checked</cfif>  onchange="showDiv('hidden_div', this)"> Sunday
</div>
     </div>
 <cfif #eventdetails.endRecur# is not "">

      <cfset   endRecurDisplay = dateAdd('d', -1, eventdetails.endRecur) />
     <Cfelse>
         
         <cfset endRecurDisplay = "" />
     
     </cfif>
     
          <div class="form-group col-md-6"  id="hidden_div">
                 <label for="eventStart">Recurring Until:</label>
                 <input class="form-control" id="endRecur" name="endRecur" value="#dateformat(endRecurDisplay,'YYYY-MM-dd')#" type="date"  >
                
             </div> 
    
    
    
    


         </div>

</cfoutput>

                         
                 
                     <div class="row mt-2">
                         <div class="col-6">
                <a href="/include/appoint-delete.cfm?eventid=<cfoutput>#eventid#</cfoutput>">  <button type="button" class="btn btn-danger btn-sm" id="btn-delete-event">Delete</button></a>
                         </div>
                         <div class="col-6 text-right">
                             <a href="javascript:history.go(-1)"><button type="button" class="btn btn-light mr-1 btn-sm" data-bs-dismiss="modal">Back</button></a>
                             <button type="submit" class="btn btn-primary btn-sm waves-effect waves-light" id="btn-save-event">Update</button>
                         </div>
                     </div>
                 </form>
              </div>
         </div>
         
    </div>
    
</div>
<style>
         .selectize-dropdown, .selectize-input { 
  line-height: 28px; }
</style>



        <script>      
 $(document).ready(function() {
    $(".parsley-examples").parsley()
});
 </script>  
         
                  
        <script>      
 $(document).ready(function() {
    $(".parsley-examples").parsley()
});
 </script>  



<script>                       
        function showDiv(divId, element)
{
    var checked = document.querySelectorAll('input:checked');
    if (checked.length === 0) {
document.getElementById(divId).style.display = 'none';
} else {
document.getElementById(divId).style.display = 'block';
}
}
</script> 


 <script>
$('select[name=eventStartTime]').on("change",function(){
    var theSelectedIndex = $(this)[0].selectedIndex;
    $.each($('select[name=eventStopTime] option'), function(){
        var endOptionIndex = $(this).index();
        if (endOptionIndex < theSelectedIndex){
           $(this).attr('disabled','disabled');
        } else{
           $(this).removeAttr('disabled').prop('selected', true);
           return false;
        }
    });
});
</script>



<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" /><cfinclude template="/include/bigbrotherinclude.cfm" /> 

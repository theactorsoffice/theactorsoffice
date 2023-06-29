<CFINCLUDE template="/include/remote_load.cfm" />
<cfquery datasource="#dsn#" name="details"  >
        select * from events where eventid = #eventid#
        </cfquery>

<cfoutput>
    
    
<center>Are you sure you want to delete this #dateformat(details.eventStart)# audition?</center></cfoutput>
<p></p>

 

    <form action="/include/remoteDeleteFormAudDelete.cfm" method="post" class="needs-validation" novalidate>
        <cfoutput><input type="hidden" name="rpgid" value="175" />
                           <input type="hidden" name="eventid" value="#eventid#" />
                   <input type="hidden" name="audprojectid" value="#audprojectid#" />
                     <input type="hidden" name="audroleid" value="#audroleid#" />
 
            
        </cfoutput>

<p>&nbsp;</p>
     <div class="form-group text-center  col-md-12">
            <button class="btn btn-xs btn-primary waves-effect mb-2 waves-light" style="background-color: red; border: red"  type="submit">Delete</button>
        </div>
</form>


 
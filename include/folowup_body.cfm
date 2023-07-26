<p>&nbsp;</p>
            <p>This audition is in the past.  Do you want to add <strong>#followups.contactfullname#</strong> to a Follow Up System?<p>
<p>&nbsp;</p>

<form action="/include/systemchange.cfm">
<cfoutput>
<input type="hidden" name="contactid" value="#followups.contactid#">

<input type="hidden" name="suid" value="0">
<input type="hidden" name="new_systemtype" value="Follow Up" >

</cfoutput>
         <div>
         <center> 
         <input name="submit" type="submit" value="Update" class="btn btn-xs btn-primary waves-effect mb-2 waves-light">
         </center>
         </div>



</form>
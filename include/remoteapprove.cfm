<CFINCLUDE template="/include/remote_load.cfm" />

<cfquery name="details" datasource="#dsn#">
    SELECT
    p.pgid
    ,t.ticketID as recID
    ,t.ticketID as pk
    ,CONCAT(u.userfirstname,' ',u.userlastname) AS col1
    ,'User' as head1
    ,'Date' as head2
    ,'Time' as head3
    ,'Page' as head4
    ,'Status' as head5
    ,'Title' as head6
    ,'Response' as head7
    ,'Completed' as head8
    ,t.ticketResponse 
    ,t.ticketCompletedDate
    ,t.ticketdetails
    ,t.ticketCreatedDate 
    ,t.ticketCreatedDate 
    ,p.pgname
    ,t.ticketStatus
    ,t.ticketType
    ,t.ticketPriority
    ,t.verid
    ,t.esthours
    ,t.ticketName
    ,t.ticketResponse
    ,t.ticketCompletedDate
    ,p.pgname
    ,p.pgdir
    ,t.patchnote
    ,t.complete_email
    ,t.initial_email
    FROM tickets t
    INNER JOIN taousers u ON u.userid = t.userid
    INNER JOIN pgpages p ON p.pgid = t.pgid
    WHERE t.ticketid = #recid#
</cfquery>


	<cfquery name="users" datasource="#dsn#" >
SELECT u.userid as new_userid,u.recordname AS username

FROM taousers u 
where u.userid = #session.userid#
</cfquery>
    
 	<cfquery name="find" datasource="#dsn#" > 
    select * from tickettestusers
        where ticketid = #recid#
        and userid = #userid#
</cfquery>
    <cfif #find.recordcount# is "1">

        <cfset testid = find.id />
        <cfoutput>
        <cfset new_teststatus = "#find.teststatus#" />
        <cfset new_rejectNotes = "#find.rejectNotes#" />
        </cfoutput>
        
        <cfelse>
            
            <cfset testid = 0>
          <cfset new_teststatus = "" />
        <cfset new_rejectNotes = "" />

</cfif>
  
<div class="row">


<cfset cur_icon="">


    <form class="px-3 col-md-12" id="<cfoutput>approveform#details.recid#</cfoutput>" method="post" action="/include/remoteapprove2.cfm">

    <cfoutput query="details">
        
        

      
      <input type="hidden" name="oldverid" value="#oldverid#" />
            <input type="hidden" name="new_ticketid" value="#details.recid#" />
          <input type="hidden" name="testid" value="#testid#" />
                  <input type="hidden" name="new_userid" value="#users.new_userid#" />  
        <div class="form-group col-md-12">
            <h5>Ticket No. #details.recid#</h5>
<p>#details.ticketname#</p>
</div>  
        
        
         
         <div class="form-group col-md-12">
            <h5>Tested By</h5>
<p>#users.username#</p>
</div>  
               
        
        
                                    
        
    </cfoutput>                            

    
    
    
                        <div class="form-group col-md-6">
        <label for="tickettype">Test Status</label>
         <select class="form-control" name="new_teststatus" id="new_teststatus" required>
      

             <option value="Approved" <cfif #new_teststatus# is "Approved"> Selected </cfif> >Approved</option>
     <option value="Rejected" <cfif #new_teststatus# is "Rejected"> Selected </cfif> >Rejected</option>
          
        </select>
                   
      </div>   

<cfoutput>

       


<div class="form-group col-md-12">
<label for="tickettype">If Rejected, state reason:</label>
<textarea class="form-control" type="text" id="new_rejectNotes" name="new_rejectNotes" placeholder="Details" rows="2" >#new_rejectNotes#
</textarea>    
</div> 
            
            
      </div>  




</cfoutput>


             <div class="row mt-2">
                         <div class="col-6">
            
                         </div>
                         <div class="col-6 text-right">
                             <a href="javascript:history.go(-1)"><button type="button" class="btn btn-light mr-1 btn-sm" data-bs-dismiss="modal">Back</button></a>
                             <button onclick="form_submit()" type="submit" class="btn btn-primary btn-sm waves-effect waves-light" id="btn-save-event">Update</button>
                         </div>
                     </div>
                 </form>

<cfoutput>

  <script type="text/javascript">
  function form_submit() {
    document.getElementById("<cfoutput>approveform#details.recid#</cfoutput>").submit();
   }    
  </script>
</cfoutput>
</div>

  


<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" /><cfinclude template="/include/bigbrotherinclude.cfm" /> 

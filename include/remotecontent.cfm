<CFINCLUDE template="/include/remote_load.cfm" />

<cfquery name="details" datasource="#dsn#">
    SELECT
    p.pgid,
    t.ticketID as recID,
    t.ticketID as pk
    ,CONCAT(u.userfirstname,' ',u.userlastname) AS col1
    ,'User' as head1
    ,'Date' as head2
    ,'Time' as head3
    ,'Page' as head4
    ,'Status' as head5
    ,'Title' as head6
    ,'Response' as head7
    ,'Completed' as head8
    ,t.ticketResponse as col7
    ,t.ticketCompletedDate as col8
    ,t.ticketdetails
    ,t.ticketCreatedDate AS col2
    ,t.ticketCreatedDate AS col3
    ,p.pgname AS col4
    ,t.ticketStatus AS col5
    ,t.ticketName AS col6
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

<cfquery name="uu" datasource="#dsn#">
select * from taousers where userid = #session.userid#
</cfquery>


<div class="row">


<cfset cur_icon="">


   <form class="px-3 col-md-11" action="/include/ticketcomplete.cfm">

    <cfoutput query="details">
        
        

            
            <div class="form-group">
        <div class="col-md-11">#details.ticketdetails#</div>
            </div>

      

            <input type="hidden" name="recid" value="#details.recid#" />
        
                <div class="form-group">
                <label for="emailaddress">Patch Note</label>

                <input class="form-control" type="text" id="patchnote" value="#details.patchnote#" name="patchnote" > 
            </div>

        
        


<cfif #details.col5# is "Pending">

            <div class="form-group">
                <label for="emailaddress">Response</label>

                <textarea class="form-control" type="text" id="ticketresponse" name="ticketresponse" rows="4">#details.ticketresponse#</textarea>
            </div>

<div class="form-check">
                                                        <input type="checkbox" name="email_user" value="Y" class="form-check-input" id="customCheck1">
                                                        <label class="form-check-label" for="customCheck1">Email User</label>
                                                    </div>



            <div class="form-group text-center">
                <button class="btn btn-primary" type="submit">Completed</button>
            </div>
    </form>
        
        
        
 
</cfif>
        <cfif #details.col5# is "Completed">
               <div class="form-group text-center">
                
                   <a href="/include/ticketclose.cfm?recid=#recid#&userid=#uu.userid#"> Close Ticket</a>
        </div>
               <p>Ticket has been reviewed by #uu.userFirstName# #uu.userLastName#</p>
        </cfif>
    </cfoutput>

 

    <cfoutput>
 <cfif #session.userid# is "30">   <p><a href="/include/ticketpass.cfm?recid=#recid#">pass</a></p></cfif>
        
        </cfoutput>
</div>

  


<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" /><cfinclude template="/include/bigbrotherinclude.cfm" /> 

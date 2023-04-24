<CFINCLUDE template="/include/remote_load.cfm" />

<cfquery name="notes" datasource="#dsn#">
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
    WHERE t.verid = #recid# and t.patchnote <> ""
</cfquery>
   
    

<div class="row">
<div style="padding:15px;">
<ul>
    <cfoutput query="notes">
    <li>#notes.patchnote#</li>
    </cfoutput>
    </ul>
</div>

</div>

  


<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" /><cfinclude template="/include/bigbrotherinclude.cfm" /> 

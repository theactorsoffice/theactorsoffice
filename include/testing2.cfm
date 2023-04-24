<CFINCLUDE template="/include/remote_load.cfm" />

<cfoutput>
<cfparam name="new_ticketstatus" default="#old_ticketstatus#" />
<cfparam name="changestatus" default="N" />
</cfoutput>

<cfquery name="finduser" datasource="#dsn#" >
SELECT * from taousers where userid = #session.userid#
</cfquery>

<cfif #testid# is "0">

    <cfquery name="Insert" datasource="#dsn#" >
    INSERT INTO `tickettestusers`  ( `ticketid`, `userid`, `teststatus`, `rejectNotes`) 

        VALUES (
        <cfqueryparam cfsqltype="cf_sql_integer" value="#new_ticketid#" />, 
        <cfqueryparam cfsqltype="cf_sql_integer" value="#new_userid#" />, 
        <cfqueryparam cfsqltype="cf_sql_varchar" value="#new_teststatus#" />, 
        <cfqueryparam cfsqltype="cf_sql_varchar" value="#new_rejectnotes#" /> 
        )
    </cfquery>

<cfelse>

    <cfquery name="update" datasource="#dsn#" >
    UPDATE `tickettestusers`
    set teststatus = <cfqueryparam cfsqltype="cf_sql_varchar" value="#new_teststatus#" />
    ,rejectnotes =  <cfqueryparam cfsqltype="cf_sql_varchar" value="#new_rejectnotes#" />  
    WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#testid#" />    
    </cfquery>

</cfif>

<cfif "#changestatus#" is "Y">
        
    <cfif  "#new_teststatus#" is "Approved"> 
        
        <cfset ticketstatus = "Tested - Success" />
        <Cfset ismail = "Y">
        <cfset emailto="kevinking7135@gmail.com" />
        <cfset emailcc="jodie@jodiebentley.com,cansoff@gmail.com" />
        <cfset emailsubject="Tested - Success" />
        <Cfset emailmessage="has been approved by #finduser.recordname# and ready for release." />
        <cfset emaillink="https://#host#.theactorsoffice.com/app/admin-support-details/?recid=#new_ticketid#" />
        <cfset emaillinkname="VIEW TICKET" />
        
    <cfelse>
        
        <cfset ticketstatus = "Tested - Bug" />
        <Cfset ismail = "Y">
        <cfset emailto="kevinking7135@gmail.com" />
        <cfset emailcc="jodie@jodiebentley.com,cansoff@gmail.com" />
        <cfset emailsubject="Tested - Bug" />
        <Cfset emailmessage="has been rejected by #finduser.recordname# and the status changed to Tested - Bug.<p>Reason: #new_rejectnotes#" />
        <cfset emaillink="https://#host#.theactorsoffice.com/app/admin-support-details/?recid=#new_ticketid#" />
        <cfset emaillinkname="VIEW TICKET" />

    </cfif>
        
       <cfquery name="updateticket" datasource="#dsn#" >
        update tickets
        set ticketstatus = '#ticketstatus#'
        where ticketid = #new_ticketid#
        </cfquery>     
        
            <cfif "#old_ticketstatus#" is not "#ticketstatus#" >
     
         <cfoutput>
    <cfset new_tlogDetails = "changed STATUS from <strong>#chr(34)##old_ticketstatus##chr(34)#</strong> to <strong>#chr(34)##ticketstatus##chr(34)#</strong>." />
    <cfset new_ticketid = "#new_ticketid#" />
    <cfset new_ticketstatus = "#new_ticketStatus#" />
    </cfoutput>
     
    <cfinclude template="/include/qry/inserttlog.cfm" />
     
     
     
     </cfif>
        
        
     
<cfelse>
    
    <cfif  "#new_teststatus#" is "Approved"> 
        
        
        <Cfset ismail = "Y">
        <cfset emailto="cansoff@gmail.com" />
        <cfset emailcc="kevinking7135@gmail.com" />
        <cfset emailsubject="Beta Tester: Tested - Success" />
        <Cfset emailmessage="has been tested and approved by Beta Tester #finduser.recordname#. <p>Please review and provide final approval or rejection." />
        <cfset emaillink="https://#host#.theactorsoffice.com/app/admin-support-details/?recid=#new_ticketid#" />
        <cfset emaillinkname="VIEW TICKET" />
        
    <cfelse>
        
     
        <Cfset ismail = "Y">
        <cfset emailto="cansoff@gmail.com" />
      <cfset emailcc="kevinking7135@gmail.com" />
        <cfset emailsubject="Tested - Rejected" />
        <Cfset emailmessage="has been tested and rejected by #finduser.recordname#.<p>Reason: #new_rejectnotes# <p>Please review and provide final approval or rejection." />
        <cfset emaillink="https://#host#.theactorsoffice.com/app/admin-support-details/?recid=#new_ticketid#" />
        <cfset emaillinkname="VIEW TICKET" />

    </cfif>
    
</cfif>
        
<cfif #ismail# is "Y">
    
    <cfinclude template="ticketemail.cfm" />
    
    <cfelse>
        
        NOT<cfabort>
    
</cfif>   
            
    <cfset new_tlogDetails = "#emailmessage#" />
    <cfset new_ticketstatus = "#new_ticketStatus#" />

     
    <cfinclude template="/include/qry/inserttlog.cfm" />
    
        
        
              
              

<cfif #oldverid# is "0">
    
    <cflocation url="/app/testings/" />   
    
<Cfelse>
    
    <cflocation url="/app/version/?recid=#oldverid#" />          
    
</cfif>

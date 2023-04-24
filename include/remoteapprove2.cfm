<CFINCLUDE template="/include/remote_load.cfm" />

    	<cfquery name="finduser" datasource="#dsn#" >
    SELECT userlastname from taousers where userid = #session.userid#
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
    
    <cfif "#finduser.userlastname#" is "Ansoff">
        
 <cfif  "#new_teststatus#" is "Approved"> 
        
    <cfquery name="updateticket" datasource="#dsn#" >
    update tickets
        set ticketstatus = 'Tested - Success'
        where ticketid = #new_ticketid#
       </cfquery>
    
    <cfelse>
        
            <cfquery name="updateticket" datasource="#dsn#" >
    update tickets
        set ticketstatus = 'Tested - Bug'
        where ticketid = #new_ticketid#
       </cfquery>
        
       
        </cfif>
    </cfif>


<cflocation url="/app/version/?recid=#oldverid#" />       

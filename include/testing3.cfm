<CFINCLUDE template="/include/remote_load.cfm" />



<cfparam name="new_ticketid" default="0" />


<cfif #new_ticketid# is "">
    No Ticket ID
    <cfabort>
</cfif>

<cfquery name="finduser" datasource="#dsn#">
    SELECT * from taousers where userid = #session.userid#
</cfquery>



<cfquery name="testers" datasource="#dsn#">

    SELECT useremail,userid,userfirstname,userlastname from taousers WHERE isbetatester = 1

    and userid not in

    (

    SELECT userid FROM tickettestusers WHERE userid = #session.userid#
    and ticketid = #new_ticketid#

    )

 
</cfquery>






<cfquery name="updateticket" datasource="#dsn#">
    update tickets
    set ticketstatus =
    <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_ticketstatus#" />

    ,testingscript =
    <cfqueryparam cfsqltype="CF_SQL_LONGVARCHAR" value="#new_testingscript#" />

    where ticketid = #new_ticketid#
</cfquery>





<cfif #old_ticketstatus# is "Implemented" and #new_ticketstatus# is "Testing">




    <cfloop query="testers">



        <cfoutput>

                <Cfset ismail="Y" />
                <cfset emailto="#testers.useremail#" />
                <cfset emailcc="support@theactorsoffice.com,jodiebentley@jodiebentley.com,cansoff@gmail.com" />
                <cfset emailsubject="Ready for testing" />
                <Cfset emailmessage="Please test and approve/reject this ticket within 48 hours.  Thanks!" />
                <cfset emaillink="https://#host#.theactorsoffice.com/app/testing/?recid=#new_ticketid#" />
                <cfset emaillinkname="TEST" />
                
        </cfoutput>

                <cfif #ismail# is "Y">

                    <cfinclude template="ticketemail.cfm" />

                </cfif>

    

    </cfloop>





</cfif>



<cflocation url="/app/testings/" />

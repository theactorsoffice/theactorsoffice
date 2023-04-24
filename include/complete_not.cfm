<cfparam name="src" default="c" />

<cfset dbug="Y" />

<cfif #isdefined('session.mocktoday')#>

    <Cfset currentStartDate="#DateFormat(session.mocktoday,'yyyy-mm-dd')#" />

</cfif>

<cfif NOT #isdefined('session.mocktoday')#>

    <Cfset currentStartDate="#DateFormat(Now(),'yyyy-mm-dd')#" />

</cfif>

<cfinclude template="/include/remote_load.cfm" />

<cfinclude template="/include/qry/notsdetails.cfm" />

<cfset notstartdate=dateAdd('d', numberformat(notsdetails.actionDaysRecurring), currentStartDate) />

<cfoutput>

    <cfset contactid="#notsdetails.contactid#" />

    <cfset new_contactname="#notsdetails.new_contactname#" />

    <cfset systemid="#notsdetails.systemid#" />

    <cfset userid="#notsdetails.userid#" />

    <cfset actionid="#notsdetails.actionid#" />

    <cfset newsuid=#notsdetails.newsuid# />

    <cfset newsystemscope="#notsdetails.newsystemscope#" />

    <cfset actionDaysRecurring="#notsdetails.actionDaysRecurring#" />

    <cfset uniquename="#notsdetails.uniquename#" />

    <cfset IsUnique="#notsdetails.IsUnique#" />

    <cfif NOT #isdefined('notstatus')#>

        <Cfset notstatus="Pending" />

    </cfif>

    <cfset notEndDate="#DateFormat(Now(),'yyyy-mm-dd')#" />

</cfoutput>

<cfquery datasource="#dsn#" name="addNotification">
    Update funotifications
    Set notStatus = '#notStatus#'
    <cfif #notstatus# is "Completed" or #notstatus# is "Skipped">
        ,notenddate = '#notendDate#'
    </cfif>
    Where notid = #notid#
</cfquery>

<cfif #notstatus# is not "Pending" and #uniquename# is not "">

    <cfquery datasource="#dsn#" name="updateContact">
        Update contactdetails
        Set #uniquename# = 'Y'
        Where contactid = #contactid#
    </cfquery>

</cfif>

<Cfif #numberformat(actionDaysRecurring)# is not "0">
    
        <cfset newest_notstartdate=dateAdd('d', numberformat(actionDaysRecurring), currentStartDate) />

    <cfquery datasource="#dsn#" name="addNotification" result="result">
        INSERT INTO funotifications (actionid,userid,suID,notstartdate,notstatus)
        VALUES (#notsdetails.actionID#,#userid#,#NewSuid#,'#DateFormat(newest_notstartdate,'yyyy-mm-dd')#','Pending')
    </cfquery>

</Cfif>

<cfinclude template="/include/qry/notsnext.cfm" />


<cfset notsafter=numberformat(notsnext.recordcount) />
<cfoutput>notsafter: #notsafter#</cfoutput>
<cfif #notsafter# is "1">
    
    <cfloop query="notsnext">
    
    <cfset new_notstartdate=dateAdd('d', numberformat(notsnext.actiondaysno), currentStartDate) />
        
        <cfquery datasource="#dsn#" name="updatesystem">
        Update funotifications
        set notstatus = 'Pending'
            
            <cfif #notsnext.notstartdate# is "">
            
             ,notstartdate = '#DateFormat(new_notstartdate,'yyyy-mm-dd')#'
       </cfif>
        where notid = #notsnext.notid#
    </cfquery>
    
    </cfloop>


</cfif>

<cfif #notsafter# is "0">


    <cfquery datasource="#dsn#" name="updatesystem">
        Update fusystemusers
        set suStatus = 'Completed'
        where suid = #newsuid#
    </cfquery>

    <cfquery datasource="#dsn#" name="checkformaint" maxrows="1">
        SELECT
        fc.suID
        FROM fusystemusers fc
        INNER JOIN fusystems s ON s.systemID = fc.systemID
        WHERE fc.contactid = #contactid# and s.systemtype = 'Maintenance List' and fc.userid = #userid#
    </cfquery>

    <cfif #checkformaint.recordcount# is "0">

        <cfquery datasource="#dsn#" name="findSystem">
            Select s.systemid
            from fusystems s
            where s.systemtype = 'Maintenance List' and s.systemscope = '#newsystemscope#'
        </cfquery>

        <cfif #findsystem.recordcount# is "1">

            <cfset systemid=findsystem.systemid />

            <cfquery datasource="#dsn#" name="Insert" result="result">
                INSERT INTO `notifications`
                (`subtitle`, `userid`, `notifUrl`, `notifTitle`, `notifType`, `contactid`, `read`)

                VALUES ('Maintenance system created for #new_contactname#', #session.userid#, '/app/contact/?contactid=#contactid#&t4=1', 'Maintenance System Created!','System Added', #contactid#, 0)
            </cfquery>

            <cfset session.ftom="Y" />

            <cfinclude template="/include/add_system.cfm" />

        </cfif>

    </cfif>


</cfif>

<cfoutput>#session.zquery#</cfoutput>


<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), " \")#" />

<cfinclude template="/include/bigbrotherinclude.cfm" />

<cfif #src# is "c">

    <cflocation url="/app/contact?contactid=#contactid#&t4=1&hide_completed=#hide_completed#" />
    
</cfif>

<cfif #src# is "d">

    <cflocation url="/app/dashboard/" />
    
</cfif>
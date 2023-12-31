<cfparam name="rcontactid" default="0"/>
<cfparam name="relationships" default="0"/>
<cfparam name="eventStart" default=""/>
<cfparam name="eventEnd" default=""/>
<cfparam name="eventstarttime" default="12:00:00"/>
<cfparam name="new_eventStopTime" default=""/>

<cfparam name="eventendtime" default=""/>
<cfparam name="dow" default=""/>
<cfparam name="endRecur" default=""/>

<cfif #endrecur# is not "">
    <cfset endRecur = dateAdd('d', 1, endRecur)/>
</cfif>

<cfif #eventStart# is "">
    <cfset eventstart = dateformat(now(), 'YYYY-mm-dd')/>
</cfif>

<cfif #eventEnd# is "">
    <cfset eventEnd = dateformat(eventstart, 'YYYY-mm-dd')/>
</cfif>

<cfinclude template="/include/remote_load.cfm"/>

<cfif #eventStartTime# is not "">

    <cfinclude template="/include/qry/duration.cfm"/>

    <cfset new_durseconds = duration.durseconds/>

    <cfset new_eventStopTime = "#timeformat(DateAdd("s","#new_durseconds#","#eventStartTime#"),'HH:MM:SS')#"/>

    <cfoutput>
        new_durseconds: #new_durseconds#
        <br>new_eventStopTime: #new_eventStopTime#
        <br>
        
    </cfoutput>
</cfif>

 
<cfset cleanData = REReplace(eventDescription, "[^a-zA-Z0-9,.!? ]", "", "ALL")>
<cfset eventDescription = Left(cleanData, 5000)>
<!--- Now insert 'cleanData' into your database --->



<cfquery datasource="#dsn#" name="add" result="result">
    INSERT INTO events_tbl (
    eventTitle
    ,eventTypeName
    ,eventDescription
    ,eventLocation
    <cfif #eventStart# is not "">
        ,eventStart
    </cfif>
    <cfif #eventStartTime# is not "">
        ,eventStartTime
    </cfif>
    <cfif #new_eventStopTime# is not "">
        ,eventStopTime
    </cfif>
    <cfif #dow# is not "">
        ,dow
    </cfif>
    <cfif #endRecur# is not "" and #dow# is not "">
        ,endRecur
    </cfif>
    ,userid)
    VALUES (<cfqueryparam cfsqltype="cf_sql_varchar" value="#eventTitle#"/>
    ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#eventTypeName#"/>
    ,<cfqueryparam cfsqltype="cf_sql_longvarchar" value="#eventDescription#"/>
    ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#eventLocation#"/>
    <cfif #eventStart# is not "">
        ,
        <cfqueryparam cfsqltype="cf_sql_date" value="#eventStart#"/>
    </cfif>
    <cfif #eventStartTime# is not "">
        ,
        <cfqueryparam cfsqltype="cf_sql_time" value="#eventStartTime#"/>
    </cfif>

    <cfif #new_eventStopTime# is not "">
        ,
        <cfqueryparam cfsqltype="cf_sql_time" value="#new_eventStopTime#"/>
    </cfif>

    <cfif #dow# is not "">
        ,
        <cfqueryparam cfsqltype="cf_sql_varchar" value="#dow#"/>
    </cfif>
    <cfif #endRecur# is not "" and #dow# is not "">
        ,
        <cfqueryparam cfsqltype="cf_sql_date" value="#endRecur#"/>
    </cfif>

,<cfqueryparam cfsqltype="cf_sql_integer" value="#userid#"/>
    )
</cfquery>

<cfquery datasource="#dsn#" name="t">
    UPDATE events
    SET eventstarttime = '12:00:00'
    WHERE eventstarttime IS NULL
</cfquery>

<cfquery datasource="#dsn#" name="tt">
    UPDATE events
    SET eventstoptime = TIME((ADDTIME(TIME(eventstarttime), TIME('01:00:00')))%(TIME('24:00:00')))
    WHERE eventstarttime IS NOT NULL AND eventstoptime IS NULL
</cfquery>

<cfquery datasource="#dsn#" name="dd">
    UPDATE events SET eventstop = eventstart WHERE eventstop IS NULL AND eventstart IS NOT null;
</cfquery>

<cfset new_eventid = result.generatedkey>

<cfloop list="#relationships#" index="relationship">

    <cfif #isnumeric(relationship)# is 1>
    
        <cfquery datasource="#dsn#" name="FIND">
            Select * from contactdetails where userid = #userid# and contactid = #relationship#
        </cfquery>
    
        <cfif #find.recordcount# is "1">
        
            <cfset new_contactid = relationship/>
        
        <cfelse>
        
            <cfset new_contactid = 0/>
        </cfif>
    
    <cfelse>
    

    
        <cfquery datasource="#dsn#" name="add" result="result">
            INSERT INTO contactdetails (userid,contactFullName) VALUES (#userid#
           ,'#relationship#');
        </cfquery>
    
        <cfset currentid = result.generated_key/>
    
        <cfset contactid = result.generated_key/>
    
        <cfset new_contactid = result.generated_key/>
    
        <cfset select_userid = userid/>
    
        <cfset select_contactid = currentid/>
    
        <cfinclude template="/include/scripts/folder_setup.cfm"/>
    </cfif>

    <cfif #new_contactid# is not "0">
        <cfquery datasource="#dsn#" name="inserts">
            Insert into eventcontactsxref (eventid,contactid) values (<cfqueryparam cfsqltype="cf_sql_integer" 
                      value="#new_eventid#"/>
            ,<cfqueryparam cfsqltype="cf_sql_integer" value="#new_contactid#"/>
            )
        </cfquery>
    </cfif>

</cfloop>

<cfif #noteDetails# is not "">

    <cfquery datasource="#dsn#" name="InsertNote">
        INSERT INTO noteslog (userid,contactid,eventid,noteDetails,ispublic)
        VALUES (#userid#,0,#new_eventid#,'#trim(noteDetails)#',1)
    </cfquery>
</cfif>

<cfif #eventTypeName# is "Audition">
    <cfparam name="new_audlocid" default="0"/>
    <cfset new_audStepID = 1/>
    <cfset new_audcatid = 1/>
    <cfset new_audsubcatid = 6/>
    <cfset new_userid = session.userid/>
    <cfset new_audtypeid = "1">
    <cfset new_projname = "Unknown"/>

    <cfset new_audplatformid = 4/>
    <cfset new_audrolename = "Unknown"/>
    <cfset new_audroletypeid = 1/>
    <cfset new_contactid = 0/>
    <cfset new_eventStart = eventStart/>
    <cfset new_eventStartTime = eventStartTime/>
    <cfset new_new_eventStopTime = new_eventStopTime/>

    <cfinclude template="/include/qry/audprojects_ins.cfm"/>
    <cfinclude template="/include/qry/audroles_ins.cfm"/>
    <cfinclude template="/include/qry/auditions_ins.cfm"/>
</cfif>

<cfif "#rcontactid#" is "0">

    <cfoutput>
        <cfset return_url = "/app/#returnurl#/"/>
    </cfoutput>

<cfelse>

    <cfoutput>
        <cfset return_url = "/app/#returnurl#?contactid=#rcontactid#"/>
    </cfoutput>
</cfif>

<cfset script_name_include = "/include/#ListLast(GetCurrentTemplatePath(), " \")#"/>
<cfinclude template="/include/bigbrotherinclude.cfm"/>

<cflocation url="/app/appoint/?eventid=#new_eventid#">
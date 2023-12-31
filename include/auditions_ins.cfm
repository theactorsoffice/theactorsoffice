<cfinclude template="/include/remote_load.cfm" />

<cfparam name="new_userid" default="" />

<cfparam name="new_audRoleID" default="" />

<cfparam name="new_audTypeID" default="" />

<cfparam name="new_audLocation" default="" />

<cfparam name="new_audlocid" default="" />

<cfparam name="new_eventStart" default="" />

<cfparam name="new_eventStartTime" default="" />

<cfparam name="new_eventStopTime" default="" />

<cfparam name="new_audplatformid" default="4" />

<cfparam name="new_audStepID" default="1" />

<cfparam name="new_parkingDetails" default="" />

<cfparam name="new_workwithcoach" default="0" />

<cfparam name="new_isDeleted" default="0" />

<cfparam name="new_trackmileage" default="0" />


<cfset cleanData = REReplace(new_eventdescription, "[^a-zA-Z0-9,.!? ]", "", "ALL")>
<cfset new_eventdescription = Left(cleanData, 5000)>



<cfquery name="auditions_ins" datasource="#dsn#" result="result">


    INSERT INTO events_tbl (

        eventtitle,

        eventdescription,

    userid,

    audRoleID,

    audTypeID,

    audLocation,

    eventStart,

    eventStartTime,

    eventStopTime,

    audplatformID,

    audStepID,

    parkingDetails,

    workwithcoach,

    trackmileage,

    audlocid)


    VALUES (

        <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_eventtitle#" maxlength="500" null="#NOT len(trim(new_eventtitle))#" />,

        <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_eventdescription#" maxlength="500" null="#NOT len(trim(new_audLnew_eventdescriptionocation))#" />,

    <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_userid#" null="#NOT len(trim(new_userid))#" />,

    <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audRoleID#" null="#NOT len(trim(new_audRoleID))#" />,

    <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audTypeID#" null="#NOT len(trim(new_audTypeID))#" />,

    <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_audLocation#" maxlength="500" null="#NOT len(trim(new_audLocation))#" />,



    <cfqueryparam cfsqltype="CF_SQL_DATE" value="#new_eventStart#" null="#NOT len(trim(new_eventStart))#" />,

    <cfqueryparam cfsqltype="CF_SQL_TIME" value="#new_eventStartTime#" null="#NOT len(trim(new_eventStartTime))#" />,

    <cfqueryparam cfsqltype="CF_SQL_TIME" value="#new_eventStopTime#" null="#NOT len(trim(new_eventStopTime))#" />,

    <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audplatformid#" null="#NOT len(trim(new_audplatformid))#" />,

    <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audStepID#" null="#NOT len(trim(new_audStepID))#" />,

    <cfqueryparam cfsqltype="CF_SQL_LONGVARCHAR" value="#new_parkingDetails#" null="#NOT len(trim(new_parkingDetails))#" />,

    <cfqueryparam cfsqltype="CF_SQL_BIT" value="#new_workwithcoach#" null="#NOT len(trim(new_workwithcoach))#" />,

    <cfqueryparam cfsqltype="CF_SQL_BIT" value="#new_trackmileage#" null="#NOT len(trim(new_trackmileage))#" />,

    <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audlocid#" null="#NOT len(trim(new_audlocid))#" />

    );
</cfquery>



 


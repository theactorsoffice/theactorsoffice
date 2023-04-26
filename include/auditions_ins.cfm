<cfinclude template="/include/remote_load.cfm" />

<cfparam name="new_userid" default="" />

<cfparam name="new_audRoleID" default="" />

<cfparam name="new_audTypeID" default="" />

<cfparam name="new_audLocation" default="" />

<cfparam name="new_audlocid" default="" />

<cfparam name="new_audMtgUrl" default="" />

<cfparam name="new_audStartDate" default="" />

<cfparam name="new_audStartTime" default="" />

<cfparam name="new_audEndTime" default="" />

<cfparam name="new_audplatformid" default="4" />

<cfparam name="new_audStepID" default="1" />

<cfparam name="new_parkingDetails" default="" />

<cfparam name="new_workwithcoach" default="0" />

<cfparam name="new_isDeleted" default="0" />

<cfparam name="new_trackmileage" default="0" />



<cfquery name="auditions_ins" datasource="#dsn#" result="result">


    INSERT INTO auditions (

    userid,

    audRoleID,

    audTypeID,

    audLocation,

    audMtgUrl,

    audStartDate,

    audStartTime,

    audEndTime,

    audplatformID,

    audStepID,

    parkingDetails,

    workwithcoach,

    trackmileage,

    audlocid)


    VALUES (

    <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_userid#" null="#NOT len(trim(new_userid))#" />,

    <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audRoleID#" null="#NOT len(trim(new_audRoleID))#" />,

    <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audTypeID#" null="#NOT len(trim(new_audTypeID))#" />,

    <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_audLocation#" maxlength="500" null="#NOT len(trim(new_audLocation))#" />,

    <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_audMtgUrl#" maxlength="500" null="#NOT len(trim(new_audMtgUrl))#" />,

    <cfqueryparam cfsqltype="CF_SQL_DATE" value="#new_audStartDate#" null="#NOT len(trim(new_audStartDate))#" />,

    <cfqueryparam cfsqltype="CF_SQL_TIME" value="#new_audStartTime#" null="#NOT len(trim(new_audStartTime))#" />,

    <cfqueryparam cfsqltype="CF_SQL_TIME" value="#new_audEndTime#" null="#NOT len(trim(new_audEndTime))#" />,

    <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audplatformid#" null="#NOT len(trim(new_audplatformid))#" />,

    <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audStepID#" null="#NOT len(trim(new_audStepID))#" />,

    <cfqueryparam cfsqltype="CF_SQL_LONGVARCHAR" value="#new_parkingDetails#" null="#NOT len(trim(new_parkingDetails))#" />,

    <cfqueryparam cfsqltype="CF_SQL_BIT" value="#new_workwithcoach#" null="#NOT len(trim(new_workwithcoach))#" />,

    <cfqueryparam cfsqltype="CF_SQL_BIT" value="#new_trackmileage#" null="#NOT len(trim(new_trackmileage))#" />,

    <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audlocid#" null="#NOT len(trim(new_audlocid))#" />

    );
</cfquery>



<cfinclude template="/include/AUDintoEVENTS.cfm" />

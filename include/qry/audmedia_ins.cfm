<cfinclude template="/include/remote_load.cfm" />


<cfparam name="audprojectid" default="" />

<cfparam name="new_mediaTypeID" default="" />

<cfparam name="new_mediaURL" default="" />

<cfparam name="new_mediaName" default="" />
 
<cfparam name="new_mediaFilename" default="" />

<cfparam name="new_mediaExt" default="" />

<cfparam name="new_userid" default="" />

<cfparam name="new_mediaCreated" default="CURRENT_TIMESTAMP" />

<cfparam name="new_isDeleted" default="0" />

 <cfif #left(new_mediaURL,4)# is not "http">
<cfset new_mediaURL = "https://#new_mediaURL#" />
</cfif>




<cfquery name="audmedia_ins" datasource="#dsn#" result="result">

    INSERT INTO audmedia (

    mediaTypeID,

    mediaURL,

    mediaName,

 

    mediaFilename,

    mediaExt,

    userid,

    isDeleted,
    isshare)


    VALUES (

    <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_mediaTypeID#" null="#NOT len(trim(new_mediaTypeID))#" />,

    <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_mediaURL#" null="#NOT len(trim(new_mediaURL))#" />,

    <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_mediaName#" null="#NOT len(trim(new_mediaName))#" />,

 

    <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_mediaFilename#" maxlength="200" null="#NOT len(trim(new_mediaFilename))#" />,

    <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_mediaExt#" maxlength="5" null="#NOT len(trim(new_mediaExt))#" />,

    <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_userid#" null="#NOT len(trim(new_userid))#" />,

    <cfqueryparam cfsqltype="CF_SQL_BIT" value="#new_isDeleted#" null="#NOT len(trim(new_isDeleted))#" />,

    <cfqueryparam cfsqltype="CF_SQL_BIT" value="#new_isshare#" null="#NOT len(trim(new_isshare))#" />

    );
</cfquery>


<cfset new_mediaID=result.GENERATEDKEY />

<cfif #audprojectid# is not "">

    <cfquery name="find" datasource="#dsn#">
        select * from audmedia_auditions_xref
        where mediaid =
        <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_mediaID#" null="#NOT len(trim(new_mediaID))#" />
        and audprojectid =
        <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#audprojectid#" null="#NOT len(trim(audprojectid))#" />
    </cfquery>

    <cfif #find.recordcount# is "0">

        <cfquery name="add" datasource="#dsn#">
            INSERT into audmedia_auditions_xref (`audprojectid`,`mediaid`) values (
            <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#audprojectid#" null="#NOT len(trim(audprojectid))#" />,
            <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_mediaID#" null="#NOT len(trim(new_mediaID))#" />

            )

        </cfquery>

    </cfif>



</cfif>

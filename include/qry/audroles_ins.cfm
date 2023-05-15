<cfinclude template="/include/remote_load.cfm"/>

<cfparam name="new_audRoleName" default=""/>

<cfparam name="isdirect" default="0"/>

<cfparam name="new_audRoleTypeID" default=""/>

<cfparam name="new_charDescription" default=""/>

<cfparam name="new_holdStartDate" default=""/>

<cfparam name="new_holdEndDate" default=""/>

<cfparam name="new_audDialectID" default=""/>

<cfparam name="new_audSourceID" default=""/>

<cfparam name="new_userid" default=""/>

<cfparam name="new_isDeleted" default="0"/>

<cfparam name="iscallback" default="0"/>

<cfparam name="ispin" default="0"/>

<cfparam name="isredirect" default="0"/>



<cfquery name="audroles_ins" datasource="#dsn#" result="result">

    INSERT INTO audroles (
    audRoleName,
    audprojectID,
    audRoleTypeID,
    charDescription,
    holdStartDate,
    holdEndDate,

    <cfif #new_audDialectID# is not "">
    audDialectID,
    </cfif>

        <cfif #new_audSourceID# is not "">
    audSourceID,
    </cfif>

    userid,
    isDeleted,
    
    isBooked,
    isCallback,
    ispin,
    isredirect
    )
    VALUES (<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_audRoleName#" maxlength="500" 
              null="#NOT len(trim(new_audRoleName))#"/>
    ,<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audprojectID#" 
              null="#NOT len(trim(new_audprojectID))#"/>
    ,<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audRoleTypeID#" 
              null="#NOT len(trim(new_audRoleTypeID))#"/>
    ,<cfqueryparam cfsqltype="CF_SQL_LONGVARCHAR" value="#new_charDescription#" 
              null="#NOT len(trim(new_charDescription))#"/>
    ,<cfqueryparam cfsqltype="CF_SQL_DATE" value="#new_holdStartDate#" 
              null="#NOT len(trim(new_holdStartDate))#"/>
    ,<cfqueryparam cfsqltype="CF_SQL_DATE" value="#new_holdEndDate#" 
              null="#NOT len(trim(new_holdEndDate))#"/>
    ,
    
        <cfif #new_audDialectID# is not "">
    <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audDialectID#" 
              null="#NOT len(trim(new_audDialectID))#"/>,
              </cfif>
    
         <cfif #new_audSourceID# is not "">
    <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audSourceID#" 
              null="#NOT len(trim(new_audSourceID))#"/>,
      </cfif>
    <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_userid#" 
              null="#NOT len(trim(new_userid))#"/>,
    
    
    <cfqueryparam cfsqltype="CF_SQL_BIT" value="#new_isDeleted#" 
              null="#NOT len(trim(new_isDeleted))#"/>
    ,<cfqueryparam cfsqltype="CF_SQL_BIT" value="#isbooked#" null="#NOT len(trim(isbooked))#"/>
    ,<cfqueryparam cfsqltype="CF_SQL_BIT" value="#isCallback#" null="#NOT len(trim(isCallback))#"/>
    ,<cfqueryparam cfsqltype="CF_SQL_BIT" value="#ispin#" null="#NOT len(trim(ispin))#"/>
    ,<cfqueryparam cfsqltype="CF_SQL_BIT" value="#isredirect#" null="#NOT len(trim(isredirect))#"/>

    );
</cfquery>

<cfset new_audRoleID = result.GENERATEDKEY/>
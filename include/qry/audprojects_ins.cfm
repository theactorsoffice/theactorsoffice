<cfinclude template="/include/remote_load.cfm" />


<cfparam name="new_projName" default="" />

<cfparam name="new_projDescription" default="" />

<cfparam name="new_userid" default="" />

<cfparam name="new_audSubCatID" default="" />

<cfparam name="new_unionID" default="" />

<cfparam name="new_networkID" default="" />

<cfparam name="new_toneID" default="" />

<cfparam name="new_contractTypeID" default="" />

<cfparam name="new_isDeleted" default="0" />

<cfparam name="new_contactid" default="" />

<cfparam name="isdirect" default="0" />


<cfquery name="audprojects_ins" datasource="#dsn#" result="result" >
  
INSERT INTO audprojects  (

projName,

projDescription,

userid,

audSubCatID,

unionID,

networkID,

toneID,

contractTypeID,

isDeleted,
    
IsDirect
    
    
    
    
    
    <cfif #new_contactid# is not "">,

    contactid</cfif>)


VALUES (

<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_projName#" maxlength="500" null="#NOT len(trim(new_projName))#" />,

<cfqueryparam cfsqltype="CF_SQL_LONGVARCHAR" value="#new_projDescription#"  null="#NOT len(trim(new_projDescription))#" />,

<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_userid#"  null="#NOT len(trim(new_userid))#" />,

<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audSubCatID#"  null="#NOT len(trim(new_audSubCatID))#" />,

<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_unionID#"  null="#NOT len(trim(new_unionID))#" />,

<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_networkID#"  null="#NOT len(trim(new_networkID))#" />,

<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_toneID#"  null="#NOT len(trim(new_toneID))#" />,

<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_contractTypeID#"  null="#NOT len(trim(new_contractTypeID))#" />,
<cfqueryparam cfsqltype="CF_SQL_BIT" value="#new_isDeleted#"  null="#NOT len(trim(new_isDeleted))#" />
    
    ,
    
  <cfqueryparam cfsqltype="CF_SQL_BIT" value="#isdirect#"  null="#NOT len(trim(isdirect))#" />  
    

    <cfif #new_contactid# is not "">
    ,

<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_contactid#"  null="#NOT len(trim(new_contactid))#" />
</cfif>
);
</cfquery>


<cfset new_audprojectID = result.GENERATEDKEY />
<cfset audprojectid = new_audprojectid />
 
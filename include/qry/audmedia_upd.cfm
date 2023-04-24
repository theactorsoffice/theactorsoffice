<cfinclude template="/include/remote_load.cfm" />

<cfparam name="new_mediaTypeID" default="" />
<cfparam name="new_mediaURL" default="" />
<cfparam name="new_mediaName" default="" />
<cfparam name="new_mediaLoc" default="" />
<cfparam name="new_mediaFilename" default="" />
<cfparam name="new_mediaExt" default="" />
<cfparam name="new_userid" default="" />
<cfparam name="new_mediaCreated" default="CURRENT_TIMESTAMP" />
<cfparam name="new_isDeleted" default="0" />

<cfquery name="audmedia_ins" datasource="#dsn#" result="result" >  
UPDATE audmedia  SET 
mediaTypeID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_mediaTypeID#"  null="#NOT len(trim(new_mediaTypeID))#" /> ,
mediaURL = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_mediaURL#"  null="#NOT len(trim(new_mediaURL))#" /> ,
mediaName = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_mediaName#"  null="#NOT len(trim(new_mediaName))#" /> ,
mediaLoc = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_mediaLoc#"  null="#NOT len(trim(new_mediaLoc))#" /> ,
mediaFilename = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_mediaFilename#" maxlength="200" null="#NOT len(trim(new_mediaFilename))#" /> ,
mediaExt = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_mediaExt#" maxlength="3" null="#NOT len(trim(new_mediaExt))#" /> ,
userid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_userid#"  null="#NOT len(trim(new_userid))#" /> ,
mediaCreated = <cfqueryparam cfsqltype="CF_SQL_TIMESTAMP" value="#new_mediaCreated#"  null="#NOT len(trim(new_mediaCreated))#" /> ,
isDeleted = <cfqueryparam cfsqltype="CF_SQL_BIT" value="#new_isDeleted#"  null="#NOT len(trim(new_isDeleted))#" /> 

WHERE mediaID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_mediaID#" /> </cfquery>

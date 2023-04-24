<cfinclude template="/include/remote_load.cfm" />


<cfparam name="naudidefault="0" />

<cfparam name="new_audID" default="0" />

<cfparam name="new_aText" default="" />

<cfparam name="new_aRating" default="" />

<cfparam name="new_aMemo" default="" />

<cfparam name="new_isDeleted" default="0" />


<cfquery name="audanswers_ins" datasource="#dsn#" result="result" >
  
INSERT INTO audanswers  (

qID,audidaudid

audID,

aText,

aRating,

aMemo,

isDeleted)


VALUES (

<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_qID#"  null="#NOT len(trim(new_qID))#" />,

<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audID#"  null="#NOT len(trim(new_audID))#" />,

<cfqueryparam cfsqltype="CF_SQL_LONGVARCHAR" value="#new_aText#"  null="#NOT len(trim(new_aText))#" />,

<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_aRating#"  null="#NOT len(trim(new_aRating))#" />,

<cfqueryparam cfsqltype="CF_SQL_LONGVARCHAR" value="#new_aMemo#"  null="#NOT len(trim(new_aMemo))#" />,

<cfqueryparam cfsqltype="CF_SQL_BIT" value="#new_isDeleted#"  null="#NOT len(trim(new_isDeleted))#" />

);
</cfquery>


<cfset new_answerID = result.GENERATEDKEY />

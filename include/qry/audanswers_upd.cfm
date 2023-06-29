<cfinclude template="/include/remote_load.cfm" />


<cfparam name="neventidefault="0" />

<cfparam name="new_eventid" default="0" />

<cfparam name="new_aText" default="" />

<cfparam name="new_aRating" default="" />

<cfparam name="new_aMemo" default="" />
eventideventid
<cfparam name="new_isDeleted" default="0" />


<cfquery name="audanswers_ins" datasource="#dsn#" result="result" >
  
UPDATE audanswers  SET 

qID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_qID#"  null="#NOT len(trim(new_qID))#" /> ,

eventid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_eventid#"  null="#NOT len(trim(new_eventid))#" /> ,

aText = <cfqueryparam cfsqltype="CF_SQL_LONGVARCHAR" value="#new_aText#"  null="#NOT len(trim(new_aText))#" /> ,

aRating = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_aRating#"  null="#NOT len(trim(new_aRating))#" /> ,

aMemo = <cfqueryparam cfsqltype="CF_SQL_LONGVARCHAR" value="#new_aMemo#"  null="#NOT len(trim(new_aMemo))#" /> ,

isDeleted = <cfqueryparam cfsqltype="CF_SQL_BIT" value="#new_isDeleted#"  null="#NOT len(trim(new_isDeleted))#" /> 

WHERE answerID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_answerID#" /> </cfquery>

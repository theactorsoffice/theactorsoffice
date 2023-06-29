<CFINCLUDE template="/include/remote_load.cfm" />

<cfinclude template="/include/qry/aud_questions.cfm" />

<cfparam name="eventid" default="0" />

<cfparam name="new_eventid" default="0" />

<cfparam name="new_aText" default="" />

<cfparam name="new_aRating" default="" />

<cfparam name="new_aMemo" default="" />

<cfparam name="new_isDeleted" default="0" />


<cfloop query="questions">

<cfset new_qid = questions.qid />
    
<cfset new_answerid = questions.answerid />
    
<cfset new_qtype = questions.qtype />

<cfset new_value = "#evaluate('q#questions.qid#')#" />
    

    
    
<cfquery name="audanswers_ins" datasource="#dsn#" result="result" >
  
UPDATE audanswers  SET 

<cfif #new_qtype# is "text">
    
    aText = <cfqueryparam cfsqltype="CF_SQL_LONGVARCHAR" value="#new_value#"  null="#NOT len(trim(new_value))#" />
    
    <cfelseif #new_qtype# is "rating">
        
        aRating = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_value#"  null="#NOT len(trim(new_value))#" /> 
        
        
     <cfelseif #new_qtype# is "long">    
    
    aMemo = <cfqueryparam cfsqltype="CF_SQL_LONGVARCHAR" value="#new_value#"  null="#NOT len(trim(new_value))#" />
    </cfif>
    
    
 
WHERE answerID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_answerID#" /> 
                                                                                
</cfquery>
    
    
    
    
    

</cfloop>

<cflocation url="/app/audition/?audprojectid=#audprojectid#&eventid=#eventid#&secid=179" />

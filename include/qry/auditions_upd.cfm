<cfinclude template="/include/remote_load.cfm" />


<cfparam name="new_userid" default="" />

<cfparam name="new_audRoleID" default="" />

<cfparam name="new_audTypeID" default="" />

<cfparam name="new_audLocation" default="" />

<cfparam name="new_audMtgUrl" default="" />

<cfparam name="new_audlocid" default="" />

<cfparam name="new_audStartDate" default="" />

<cfparam name="new_audStartTime" default="" />

<cfparam name="new_audEndTime" default="" />

<cfparam name="new_audplatformid" default="" />

<cfparam name="new_audStepID" default="1" />

<cfparam name="new_parkingDetails" default="" />

<cfparam name="new_workwithcoach" default="0" />

<cfparam name="new_isDeleted" default="0" />

<cfparam name="new_trackmileage" default="0" />

<cfparam name="new_audbooktypid" default="0" />

<cfparam name="new_callbacktypid" default="" />

<cfparam name="new_audlocname" default="" />

<cfparam name="new_audlocadd1" default="" />

<cfparam name="new_audlocadd2" default="" />

<cfparam name="new_audcity" default="" />

<cfparam name="new_regionid" default="" />

<cfparam name="new_audzip" default="" />

<cfif #new_audstartTime# is not "">

    <cfinclude template="/include/qry/duration.cfm" />

 <cfset new_durseconds = duration.durseconds />
    
    
<cfset new_audendtime = "#DateAdd("s","#new_audstartTime#","#new_durseconds#")#" />

<cfoutput>
    
    new_audstarttime: #timeformat(new_audstartTime,'HH:MM:SS')#<BR>
    new_durseconds: #new_durseconds#<BR>

  statement:     SELECT ADDTIME("#timeformat('#new_audstartTime#','HH:MM:SS')#", "#new_durseconds#") as new_audEndTime <BR>  
    
    
 
    
<cfset new_audendtime="#timeformat(DateAdd("s","#new_durseconds#","#new_audstartTime#"),'HH:MM:SS')#" />
    
    new_audendtime: #new_audendtime#<BR>
    
</cfoutput>

</cfif>



<cfquery name="auditions_ins" datasource="#dsn#" result="result" >
  
UPDATE auditions_tbl  SET 

userid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_userid#"  null="#NOT len(trim(new_userid))#" /> ,

audRoleID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audRoleID#"  null="#NOT len(trim(new_audRoleID))#" /> ,

audTypeID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audTypeID#"  null="#NOT len(trim(new_audTypeID))#" /> ,
    

audBookTypeID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audBookTypeID#"  null="#NOT len(trim(new_audBookTypeID))#" /> ,
    
audLocation = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_audLocation#" maxlength="500" null="#NOT len(trim(new_audLocation))#" /> ,
    
audlocname = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_audlocname#" maxlength="500" null="#NOT len(trim(new_audlocname))#" /> ,
    
audlocadd1 = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_audlocadd1#" maxlength="500" null="#NOT len(trim(new_audlocadd1))#" /> ,

audlocadd2 = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_audlocadd2#" maxlength="500" null="#NOT len(trim(new_audlocadd2))#" /> ,
    
audcity = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_audcity#" maxlength="500" null="#NOT len(trim(new_audcity))#" /> ,
    
regionid = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_regionid#" maxlength="2" null="#NOT len(trim(new_regionid))#" /> ,
    
audzip = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_audzip#" maxlength="10" null="#NOT len(trim(new_audzip))#" /> ,

audMtgUrl = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_audMtgUrl#" maxlength="500" null="#NOT len(trim(new_audMtgUrl))#" /> ,

audStartDate = <cfqueryparam cfsqltype="CF_SQL_DATE" value="#new_audStartDate#"  null="#NOT len(trim(new_audStartDate))#" /> ,

audStartTime = <cfqueryparam cfsqltype="CF_SQL_TIME" value="#new_audStartTime#"  null="#NOT len(trim(new_audStartTime))#" /> ,

audEndTime = <cfqueryparam cfsqltype="CF_SQL_TIME" value="#new_audEndTime#"  null="#NOT len(trim(new_audEndTime))#" /> ,

audplatformID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audplatformid#"  null="#NOT len(trim(new_audplatformid))#" /> ,

audStepID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audStepID#"  null="#NOT len(trim(new_audStepID))#" /> ,

parkingDetails = <cfqueryparam cfsqltype="CF_SQL_LONGVARCHAR" value="#new_parkingDetails#"  null="#NOT len(trim(new_parkingDetails))#" /> ,

workwithcoach = <cfqueryparam cfsqltype="CF_SQL_BIT" value="#new_workwithcoach#"  null="#NOT len(trim(new_workwithcoach))#" /> ,
    
trackmileage = <cfqueryparam cfsqltype="CF_SQL_BIT" value="#new_trackmileage#"  null="#NOT len(trim(new_trackmileage))#" /> ,
    
<cfif #new_callbacktypeid# is not "">
    
    callbacktypeid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_callbacktypeid#"  null="#NOT len(trim(new_callbacktypeid))#" /> ,
    
</cfif>

isDeleted = <cfqueryparam cfsqltype="CF_SQL_BIT" value="#new_isDeleted#"  null="#NOT len(trim(new_isDeleted))#" /> 

    
WHERE audID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audID#" /> 

</cfquery>
    
        
        <cfoutput>

        <cfset eventstart="#new_audStartDate#" />

        <cfset eventStartTime="#new_audStartTime#" />

        <cfset eventStopTime="#new_audEndTime#" />

    </cfoutput>
    
    
    
 <cfquery datasource="#dsn#" name="FInd"  >
update events
     set audid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audID#" />  
     
     
     <cfif #eventStart# is not "">,eventstart =<cfqueryparam cfsqltype="cf_sql_date" value="#eventStart#" /></cfif>
             <cfif #eventStartTime# is not "">,eventStartTime = <cfqueryparam cfsqltype="cf_sql_time" value="#eventStartTime#" /></cfif>
          <cfif #eventStopTime# is not "">,eventStopTime =<cfqueryparam cfsqltype="cf_sql_time" value="#eventStopTime#" /></cfif>
     
     
     
    WHERE audID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audID#" /> 
    
</cfquery>  
    
    
    
    
    
    

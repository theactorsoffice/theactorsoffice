<CFINCLUDE template="/include/remote_load.cfm" /> 

<cfparam name="deleteaction" default="0" /> 
<cfparam name="ver" default="" />
 <cfparam name="actionDaysNo" default="0" />
 
 

<cfquery name="update" datasource="#dsn#" >
UPDATE actionusers_tbl
SET actionDaysNo = #actionDaysNo#
    <cfif #deleteaction# is "1">
    ,isdeleted = 1
    </cfif>
     <cfif #actionDaysRecurring# is not "0" and #actionDaysRecurring# is not "">  
    ,actionDaysRecurring = #actionDaysRecurring#
         <cfelse>
       ,actionDaysRecurring = NULL      
    </cfif>

WHERE id = #id#
</cfquery>

<cfquery name="k" datasource="#dsn#" >   
    SELECT 
n.notid
,a.id
,fu.systemid
,n.actionid
,n.suid

,fu.sustartdate
,a.actionDaysNo
,a.actiondaysrecurring
,n.notstartdate
,DATE_ADD(fu.sustartdate, INTERVAL a.actionDaysNo DAY) AS new_notstartdate
FROM  fusystemusers fu 
INNER JOIN funotifications n ON n.suid = fu.suid
INNER JOIN actionusers a ON a.actionid = n.actionid

where fu.userid = #session.userid# 
AND a.userid = fu.userid
AND n.userID = fu.userid
AND n.notstatus <> 'Completed'
AND n.isdeleted = 0
AND n.notstartdate <> DATE_ADD(fu.sustartdate, INTERVAL a.actionDaysNo DAY)
ORDER BY n.notid
    </cfquery>
    
    
  <cfloop query="k">
      <cfquery name="up" datasource="#dsn#" >   
 update funotifications
 set notstartdate = <cfqueryparam cfsqltype="cf_sql_date" value="#k.new_notstartdate#">
where notid = <cfqueryparam cfsqltype="cf_sql_integer" value="#k.notid#">
      </cfquery>
    
    </cfloop>  
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" /><cfinclude template="/include/bigbrotherinclude.cfm" /> 
	
	<cflocation url="/app/myaccount/?new_pgid=125&target_id_system=#target_id_system#&t7=1" />    

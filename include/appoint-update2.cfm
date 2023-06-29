<cfparam name="rcontactid" default="0" />     
<cfparam name="eventstarttime" default="" />     
<cfparam name="dow" default="" />     
    
<CFINCLUDE template="/include/remote_load.cfm" />






<cfif #eventStartTIme# is not "">

    <cfinclude template="/include/qry/duration.cfm" />

 <cfset new_durseconds = duration.durseconds />
    
    
<cfset eventStopTime = "#DateAdd("s","#eventStartTIme#","#new_durseconds#")#" />

<cfoutput>
    
    eventStartTIme: #timeformat(eventStartTime,'HH:MM:SS')#<BR>
    new_durseconds: #new_durseconds#<BR>

  statement:     SELECT ADDTIME("#timeformat('#eventStartTIme#','HH:MM:SS')#", "#new_durseconds#") as new_eventStopTime <BR>  
    
    
 
    
<cfset new_eventStopTime="#timeformat(DateAdd("s","#new_durseconds#","#eventStartTIme#"),'HH:MM:SS')#" />
    
    new_eventStopTime: #new_eventStopTime#<BR>
    
</cfoutput>

</cfif>



















<cfquery datasource="#dsn#" name="update"     >
UPDATE events
set eventTitle = <cfqueryparam cfsqltype="cf_sql_varchar" value="#eventTitle#" />
 
,eventTypeName = <cfqueryparam cfsqltype="cf_sql_varchar" value="#eventTypeName#" />
,eventDescription = <cfqueryparam cfsqltype="cf_sql_longvarchar" value="#eventDescription#" />
,eventLocation = <cfqueryparam cfsqltype="cf_sql_varchar" value="#eventLocation#" />
    <cfif #eventStart# is not "">
,eventStart = <cfqueryparam cfsqltype="cf_sql_date" value="#eventStart#" />
        ,eventStop = <cfqueryparam cfsqltype="cf_sql_date" value="#eventStart#" />
    </cfif>

<cfif #eventStartTime# is not "">
,eventStartTime = '#eventStartTime#'
                  </cfif>     
    
    <cfif #dow# is not "">
,dow = '#dow#'
        <cfelse>
            ,dow = NULL
                  </cfif> 
    
        <cfif #eventStopTime# is not "">
,eventStopTime = <cfqueryparam cfsqltype="cf_sql_time" value="#new_eventStopTime#" />
               </cfif>
    
    <cfif #endRecur# is not "" and #dow# is not "">
        
     <cfset   endRecur = dateAdd('d', 1, endRecur) />
        
        
,endRecur = <cfqueryparam cfsqltype="cf_sql_date" value="#endRecur#" />
        
        <cfelse>
            
            ,endRecur = NULL
    </cfif>
    
    
    

WHERE eventid = <cfqueryparam cfsqltype="cf_sql_integer" value="#eventid#" />
</cfquery> 


<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="d"      >
update eventcontactsxref set isdeleted = 1 where eventid = <cfqueryparam cfsqltype="cf_sql_integer" value="#eventid#" />
</cfquery>

        
        
        
        
        
        
        
<Cfloop list="#relationships#" index="relationship" >


    <cfif #isnumeric(relationship)# is "YES">
     
    
    <cfquery datasource="#dsn#" name="FIND"      >
    Select * from contactdetails where userid = #userid# and contactid = #relationship#
    </cfquery>
        
        
        <cfif #find.recordcount# is "1">
        
            <cfset new_contactid  = relationship />
            
        <cfelse>
            
            <cfset new_contactid  = 0 />
        
        </cfif>
        
    
    
    <cfelse>
    

    
<cfquery datasource="#dsn#" name="add"   result="result">
        INSERT INTO contactdetails (userid,contactFullName) VALUES (#userid#,'#relationship#');
</cfquery>
    
        <cfset currentid=result.generated_key />
       
        <cfset contactid=result.generated_key />
 
        <cfset new_contactid=result.generated_key />

<cfset select_userid = cookie.userid />
        
<cfset select_contactid = currentid />
        
        
<cfinclude template="/include/scripts/folder_setup.cfm" />


 
 
        
        
        
        
        
    
    
    </cfif> 
    
    
 
    
    
    
    <cfif #new_contactid# is not "0">
 <cfquery datasource="#dsn#" name="inserts"      >
    Insert into eventcontactsxref (eventid,contactid) values (<cfqueryparam cfsqltype="cf_sql_integer" value="#eventid#" />,
    <cfqueryparam cfsqltype="cf_sql_integer" value="#new_contactid#" />)
    </cfquery>
    
    </cfif>
            

    
    
    

</Cfloop>





        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
 <Cfif "#rcontactid#" is "0">
      <cfoutput>
     <cfset return_url = "/app/#returnurl#/?eventid=#eventid#" />
     </cfoutput>
     <Cfelse>
         
               <cfoutput>
     <cfset return_url = "/app/#returnurl#?contactid=#rcontactid#&t2=1" />
     </cfoutput>
         
         
      </Cfif>




 

<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" /><cfinclude template="/include/bigbrotherinclude.cfm" /> 
	 
	 <cflocation url="#return_url#" >

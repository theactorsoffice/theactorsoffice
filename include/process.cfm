<cfset dbug = 'N' >
    
    <CFINCLUDE template="/include/remote_load.cfm" />
<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" /><cfinclude template="/include/bigbrotherinclude.cfm" /> 

<cfif #isdefined('topsearch')#>
    
    
    
    <cfif #topsearch# contains ":"  >
    
    <cfoutput>
    <cfset new_eventstart = "#left(topsearch,10)#" />
        
    <cfset new_recordname = "#replace(topsearch,'#new_eventstart#: ','','ALL')#" />
        
       
      <cfquery datasource="#dsn#" name="FINDCC"   maxrows="1"  >
          
                 SELECT e.eventid


 FROM events e  INNER JOIN eventtypes_user t on t.eventtypename = e.eventtypename
 
 INNER JOIN eventcontactsxref x ON x.eventID = e.eventid
 INNER JOIN contactdetails c ON c.contactid = x.contactid
WHERE e.userid = #session.userid# and t.userid = #session.userid#
AND e.eventstart = <cfqueryparam cfsqltype="date" value="#new_eventstart#" /> and c.recordname = <cfqueryparam cfsqltype="varchar" value="#new_recordname#" />
        </cfquery>
        
        <cfif #findcc.recordcount# is "1">
        
 
         
            <cflocation url="/app/appoint-update/?eventid=#findcc.eventid#&returnurl=calendar-appoint&rcontactid=0" />
        
        </cfif>
    
    </cfoutput>
    
    
    <cfelse>
    

    <cfquery datasource="#dsn#" name="tags"     >   
    Select * from tags where tagname = '#topsearch#'
    </cfquery>
    
    
    <cfif #tags.recordcount# is "1">
       
        <cflocation url="/app/contacts/?bytag=#topsearch#" />
    
        <cfelse>
 
    
    
      <cfquery datasource="#dsn#" name="FINDC"     >
                SELECT CONTACTID from contacts_ss WHERE userid = #session.userid# and col1 = '#TOPSEARCH#'
            </cfquery>
            
 
    
            <cfif #findc.recordcount# is "1">
                <cflocation url="/app/contact/?contactid=#findc.contactid#" />
         
            <cfelse>
 
              <cflocation url="/app/contacts/?bylike=#topsearch#" />
                
            </cfif>
       
    </cfif>
            </cfif>
        
</cfif>



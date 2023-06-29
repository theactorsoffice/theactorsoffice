<CFINCLUDE template="/include/remote_load.cfm" />

    

            <cfquery datasource="#dsn#" name="x">
SELECT DISTINCT a.userid,a.eventid, x.contactid,p.audprojectid,e.eventid FROM audcontacts_auditions_xref X
INNER JOIN audprojects p ON p.audprojectID = x.audprojectid
INNER JOIN audroles r ON r.audprojectID = p.audprojectID
INNER JOIN events a ON a.audRoleID = r.audroleid
INNER JOIN events e ON e.eventid = a.eventid
 where x.contactid <> 0
            </cfquery>


<Cfloop query="x">
                
                
                
                
                
                     <cfquery datasource="#dsn#" name="find" maxrows="1">
                Select * from eventcontactsxref where  eventid = #x.eventid# and contactid = #x.contactid#
    </cfquery>
                
                
                
             
    
    
    <cfif #find.recordcount#  is "0">
        <cfquery datasource="#dsn#" name="f" maxrows="1">
            
            select recordname from contactdetails where contactid = #x.contactid#
        
        </cfquery>
        
        <cfoutput>
        Audition NO. #x.eventid# - #f.recordname# added<BR>
        </cfoutput>
    <cfquery datasource="#dsn#" name="inserts">
        Insert into  eventcontactsxref (eventid,contactid) values (
        <cfqueryparam cfsqltype="cf_sql_integer" value="#x.eventid#" />,
        <cfqueryparam cfsqltype="cf_sql_integer" value="#x.contactid#" />)
    </cfquery>
    
    </cfif>
    
   </Cfloop>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
            <cfquery datasource="#dsn#" name="y">
    SELECT DISTINCT x.contactid,e.eventid, e.eventid,p.audprojectid FROM eventcontactsxref_tbl X

INNER JOIN events e ON e.eventid = x.eventid
INNER JOIN events a ON a.eventid = e.eventid
INNER JOIN audroles r ON r.audRoleID = a.audroleid
INNER JOIN audprojects p ON r.audprojectid = p.audprojectid
    </cfquery>
                
                
       <Cfloop query="y">
                
                
                
                
                
                     <cfquery datasource="#dsn#" name="find" maxrows="1">
                Select * from audcontacts_auditions_xref where  audprojectid = #y.audprojectid# and contactid = #y.contactid#
    </cfquery>
                
                
                
             
    
    
    <cfif #find.recordcount#  is "99999">
        <cfquery datasource="#dsn#" name="f" maxrows="1">
            
            select recordname from contactdetails where contactid = #y.contactid#
        
        </cfquery>
        
        <cfoutput>
        EVENT NO. #y.eventid# - #f.recordname# added<BR>
        </cfoutput>
    <cfquery datasource="#dsn#" name="inserts">
        Insert into  audcontacts_auditions_xref (audprojectid,contactid) values (
        <cfqueryparam cfsqltype="cf_sql_integer" value="#y.audprojectid#" />,
        <cfqueryparam cfsqltype="cf_sql_integer" value="#y.contactid#" />)
    </cfquery>
    
    </cfif>
    
   </Cfloop>
    
    
    
    
    
    
    
             
    
    
    
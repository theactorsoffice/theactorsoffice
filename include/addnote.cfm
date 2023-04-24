<CFINCLUDE template="/include/remote_load.cfm" />

<cfif #isdefined('userid')# >

<cfif #pgtype# is "add">

<cfquery datasource="#dsn#" name="InsertNote"      >
INSERT INTO noteslog (userid,contactid,noteDetails)
VALUES (<cfqueryparam cfsqltype="cf_sql_integer" value="#userid#" />,<cfqueryparam cfsqltype="cf_sql_integer" value="#newcontactid#" />,<cfqueryparam cfsqltype="cf_sql_longvarchar" value="#LEFT(trim(newnoteDetails),2000)#" />)
</cfquery>
    <cfelseif #pgtype# is "delete">
        
    <cfquery datasource="#dsn#" name="DeleteNote"      >
DELETE FROM noteslog  
WHERE noteid = <cfqueryparam cfsqltype="cf_sql_integer" value="#noteid#" />
        </cfquery>   
      <cfelseif #pgtype# is "update" >
          
<cfquery datasource="#dsn#" name="InsertNote"      >
INSERT INTO noteslog (userid,contactid,noteDetails)
VALUES (<cfqueryparam cfsqltype="cf_sql_integer" value="#userid#" />,<cfqueryparam cfsqltype="cf_sql_integer" value="#newcontactid#" />,<cfqueryparam cfsqltype="cf_sql_longvarchar" value="#LEFT(trim(newnoteDetails),2000)#" />)
</cfquery>     

<cfquery datasource="#dsn#" name="DeleteNote"      >
DELETE FROM noteslog  
WHERE noteid = <cfqueryparam cfsqltype="cf_sql_integer" value="#updatenoteid#" />
</cfquery>
        
        
        <cfelse>
            
            Error! <cfabort>
    </cfif>



<cflocation  addtoken="false" url="/app/contact/index.cfm?contactid=#newcontactid#&t3=1" />
            
   <cfelse>
       
       No User!
            
</cfif>



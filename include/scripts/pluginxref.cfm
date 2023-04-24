 <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="del"      >
delete from pgpagespluginsxref
</cfquery>


<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="global"      >
SELECT pgid from pgpages
</cfquery>






    <cfloop query="global">
    
        <cfset pluginid = 4  />
        <cfset pgid = global.pgid />

        <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="insert"      >
        Insert into pgpagespluginsxref (pgid,pluginid)
        values (#pgid#,#pluginid#)
        </cfquery>
    global-
    </cfloop>
    
    
    
    <BR>
        
    

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        

<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="datatable"      >
SELECT pgid from pgpages where datatables_yn = 'Y'
</cfquery>






    <cfloop query="datatable">
    
        <cfoutput>
        <cfset pluginid = 1  />
        <cfset pgid = "#datatable.pgid#" />
</cfoutput>
        <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="insert"      >
        Insert into pgpagespluginsxref (pgid,pluginid)
        values (#pgid#,#pluginid#)
        </cfquery>
    datatable-
    </cfloop>
    
    
    
    <BR>
        
    

    
        
        
        
        
        
        
        
        
        
        
              
        
        
        
        
        
        
        
        
        
        

<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="calendar"      >
SELECT pgid from pgpages where fullcalendar_yn = 'Y'
</cfquery>






    <cfloop query="calendar">
    
         <cfoutput>
        <cfset pluginid = 2  />
        <cfset pgid = "#calendar.pgid#" />
</cfoutput>
        <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="insert"      >
        Insert into pgpagespluginsxref (pgid,pluginid)
        values (#pgid#,#pluginid#)
        </cfquery>
    calendar-
    </cfloop>
    
    
    
    <BR>
        
    
        
        
        
        
                
        
        
        
        
        

<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="editable"      >
SELECT pgid from pgpages where editable_yn = 'Y'
</cfquery>






    <cfloop query="editable">
    <Cfoutput>
        <cfset pluginid = 3  />
        <cfset pgid = "#editable.pgid#" />
</Cfoutput>
        <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="insert"      >
        Insert into pgpagespluginsxref (pgid,pluginid)
        values (#pgid#,#pluginid#)
        </cfquery>
    editable-
    </cfloop>
    
    
    
    <BR>
        
        
        

        
    
    <cfset currentURL = cgi.server_name />
    <cfset host = ListFirst(currentURL, ".") />
 <cfoutput>
    <cfset app_dir="c:\home\theactorsoffice.com\wwwroot\#host#-subdomain\app" />
</cfoutput>
<cfset dev_dir="c:\home\theactorsoffice.com\wwwroot\dev-subdomain\app" />


    
   <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="x"      >     
SELECT DISTINCT compdir FROM pgcomps WHERE compdir <> '' 
       AND  compdir NOT IN ('test','actionlinks','admin-support-details','admin-user-details','appoint','apoint-new','appoint-types','appoint-update','appoint-types','eventcontactsxref-Details','eventcontactsxref-Results','ftypexref-Details')
ORDER BY compdir 
    </cfquery>
       
       
       
       
   <cfloop query="x" >
       <cftry>
       
       <cfoutput>
<cfdirectory action="copy"
    directory="#app_dir#\#x.compdir#"
    destination="#dev_dir#\#x.compdir#"
    >


</cfoutput>
           
           
           
          <cfcatch type="any">
           nope!
           
           </cfcatch> 
           
           </cftry>
           
           
           </cfloop>
       
              <cfoutput>
<cfdirectory action="copy"
    directory="#app_dir#\assets"
    destination="#dev_dir#\assets"
    >


</cfoutput>
           
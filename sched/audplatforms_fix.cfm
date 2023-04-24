  <h3>Audaudplatforms</h3>
    
<cfset currentURL = cgi.server_name />

<cfset host = ListFirst(currentURL, ".") />

<cfif #host# is "app">
    <cfset dsn = "abo" />
  <cfoutput>  <cfset rev = "#rand()#" /> </cfoutput>
    <cfset suffix = "_1.5" />
    <cfset information_schema = "actorsbusinessoffice" />
    <cfelse>
  <cfset dsn = "abod" />
<cfset rev = rand() />
        <cfset suffix = "" />
        
    <cfset information_schema = "new_development" />
</cfif>
    
    
    <cfset rev = rand() />
    
    

    
     <cfquery  datasource="#dsn#"  name="u"  >
        SELECT * from taousers     
    </cfquery>

    <cfloop query="u">

         <cfquery datasource="#dsn#" name="x"  >
            SELECT audplatformid,
audplatform,
isDeleted
 FROM audplatforms
        </cfquery>

        <cfloop query="x">
            
             <cfquery datasource="#dsn#" name="find"  >
            Select * from audplatforms_user
            where audplatform = '#x.audplatform#' and userid = #u.userid#
            </cfquery>
            
            <cfif #find.recordcount# is "0">
            
                 <cfquery datasource="#dsn#" name="insert"  >
                    
                    INSERT INTO `audplatforms_user` (`audplatform`, `userid`) 
                    VALUES ('#x.audplatform#',#u.userid#);
          
                </cfquery>
                
                <cfoutput>           
                 audplatforms added: #x.audplatform# (user #u.userid#)<BR>
                </cfoutput>
            </cfif>

        </cfloop>


    </cfloop>

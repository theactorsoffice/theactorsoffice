  <h3>Style / Format</h3>
    
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
            SELECT toneid,
tone,
audcatid,
isDeleted
 FROM audtones
        </cfquery>

        <cfloop query="x">
            
             <cfquery datasource="#dsn#" name="find"  >
            Select * from audtones_user
            where tone = '#x.tone#' and userid = #u.userid#
            </cfquery>
            
            <cfif #find.recordcount# is "0">
            
                 <cfquery datasource="#dsn#" name="insert"  >
                    
                    INSERT INTO `audtones_user` (`toneid`,`tone`, `audcatid`, `userid`) 
                    VALUES (#x.toneid#,'#x.tone#','#x.audcatid#',#u.userid#);
          
                </cfquery>
                
                <cfoutput>           
                 audtones added: #x.tone# (user #u.userid#)<BR>
                </cfoutput>
            </cfif>

        </cfloop>


    </cfloop>

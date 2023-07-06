<cfparam name="dbug" default="Y" />

<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="u"  >
        SELECT * from taousers
    </cfquery>

    <cfloop query="u">

<cfquery datasource="#dsn#" name="x"  >
      SELECT * FROM tags
        </cfquery>


        <cfloop query="x">
            
     <cfquery datasource="#dsn#" name="find"  >
            Select * from tags_user 
            where tagname = '#x.tagname#' and userid = #u.userid#
            </cfquery>
            
            <cfif #find.recordcount# is "0">
            
            <cfquery datasource="#dsn#" name="insert"  >
                    
                    INSERT INTO `tags_user` (`tagname`,  `userid`, `isTeam`) 
                    VALUES ('#x.tagname#',#u.userid#,#x.isteam#);
          
                </cfquery>
                
     
            </cfif>

        </cfloop>


    </cfloop>

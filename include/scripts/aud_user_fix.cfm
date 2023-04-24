   <h3>Audtones_user</h3>
        
                 <cfquery datasource="#dsn#" name="u"  >
        SELECT * from taousers  
        </cfquery>

    <cfloop query="u">

         <cfquery datasource="#dsn#" name="x"  >
        SELECT 
        </cfquery>

        <cfloop query="x">
            
            
             <cfquery datasource="#dsn#" name="find"  >
            SELECT eventTypeName
            ,eventtypedescription
            ,eventtypecolor
             FROM eventtypes_user
            where eventTypeName = '#x.eventtypeName#' and userid = #u.userid#
            </cfquery>
            
            <cfif #find.recordcount# is "0">
            
                 <cfquery datasource="#dsn#" name="insert"  >
                    INSERT INTO `eventtypes_user` (`eventTypeName`,`eventtypedescription`,`eventtypecolor`,`userid`) 
                    VALUES ('#x.eventTypeName#', '#x.eventtypedescription#','#x.eventtypecolor#', #u.userid#);
                </cfquery>
                     
                <cfif #dbug# is "Y">
                <CFOUTPUT>       eventtypes_user: #x.eventTypeName# added</CFOUTPUT><BR>
                </cfif>
                    
                    
     
            </cfif>

        </cfloop>


    </cfloop>
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        

        
        <CFINCLUDE template="/include/remote_load.cfm" />
         
    <cfquery datasource="#dsn#" name="u"  >
        SELECT * from taousers     
    </cfquery>

    <cfloop query="u">

        <cfquery datasource="#dsn#" name="x"  >
           SELECT genderpronoun,genderpronounplural FROM genderpronouns 
        </cfquery>


        <cfloop query="x">
            
            <cfquery datasource="#dsn#" name="find"  >
            Select * from genderpronouns_users 
            where genderpronoun = '#x.genderpronoun#' and userid = #u.userid#
            </cfquery>
            
            <cfif #find.recordcount# is "0">
            
              <cfquery datasource="#dsn#" name="insert"  >
                    
                    INSERT INTO `genderpronouns_users` (`genderpronoun`, `genderpronounplural`, `userid`) 
                    VALUES ('#x.genderpronoun#','#x.genderpronounplural#',#u.userid#);
          
                </cfquery>
                
                <cfoutput>           
                  INSERT INTO `genderpronouns_users` (`genderpronoun`, `genderpronounplural`, `userid`) 
                    VALUES ('#x.genderpronoun#','#x.genderpronounplural#',#u.userid#);
                    <BR>
                    
                    </cfoutput>
            </cfif>

        </cfloop>


    </cfloop>   
        
        
        
        
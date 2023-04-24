<cfparam name="dbug" default="Y" />

<CFINCLUDE template="/include/remote_load.cfm" />

<cfquery datasource="#dsn#" name="u"  >
        SELECT * from taousers
    </cfquery>

    <cfloop query="u">

      
        <cfquery datasource="#dsn#" name="x"  >
            SELECT submitsitename,catlist FROM audsubmitsites
        </cfquery>


        <cfloop query="x">
            
 
            <cfquery datasource="#dsn#" name="find"  >
            Select * from audsubmitsites_user 
            where submitsitename = '#x.submitsitename#' and userid = #u.userid#
            </cfquery>
            
            <cfif #find.recordcount# is "0">
            
 
                <cfquery datasource="#dsn#" name="insert"  >
                    
                    INSERT INTO `audsubmitsites_user` (`submitsitename`, `catlist`, `userid`) 
                    VALUES ('#x.submitsitename#','#x.catlist#',#u.userid#);
          
                </cfquery>
                
                <cfoutput>           
                    INSERT INTO `sitetypes_user` (`submitsitename`, `catlist`, `userid`) 
                    VALUES ('#x.submitsitename#','#x.catlist#',#u.userid#);
                    
                    <BR>
                    
                    </cfoutput>
            </cfif>

        </cfloop>


    </cfloop>

<cfparam name="dbug" default="Y" />

<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="u"  >
        SELECT * from taousers
    </cfquery>

    <cfloop query="u">

        <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="x"  >
            SELECT sitetypename,sitetypedescription from sitetypes_master
        </cfquery>


        <cfloop query="x">
            
            <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="find"  >
            Select * from sitetypes_user 
            where sitetypename = '#x.sitetypename#' and userid = #u.userid#
            </cfquery>
            
            <cfif #find.recordcount# is "0">
            
                <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="insert"  >
                    
                    INSERT INTO `sitetypes_user` (`siteTypeName`, `siteTypeDescription`, `userid`) 
                    VALUES ('#x.sitetypename#','#x.sitetypedescription#',#u.userid#);
          
                </cfquery>
                
                <cfoutput>           
                    INSERT INTO `sitetypes_user` (`siteTypeName`, `siteTypeDescription`, `userid`) 
                    VALUES ('#x.sitetypename#','#x.sitetypedescription#',#u.userid#);
                    
                    <BR>
                    
                    </cfoutput>
            </cfif>

        </cfloop>


    </cfloop>

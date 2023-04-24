<cfparam name="dbug" default="Y" />

<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="u"  >
        SELECT * from taousers
    </cfquery>

    <cfloop query="u">

        <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="x"  >
      SELECT typeid,valuetype,typeicon FROM itemtypes
        </cfquery>


        <cfloop query="x">
            
            <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="find"  >
            Select * from itemtypes_user 
            where valuetype = '#x.valuetype#' and userid = #u.userid#
            </cfquery>
            
            <cfif #find.recordcount# is "0">
            
                <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="insert"  >
                    
                    INSERT INTO `itemtypes_user` (`valuetype`, `typeicon`, `userid`) 
                    VALUES ('#x.valuetype#','#x.typeicon#',#u.userid#);
          
                </cfquery>
                
     
            </cfif>

        </cfloop>


    </cfloop>

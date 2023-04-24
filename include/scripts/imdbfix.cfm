 <CFINCLUDE template="/include/remote_load.cfm" />  
<cfquery datasource="#dsn#" name="u"  >
        SELECT * from taousers 
</cfquery>

<cfset dbug = "Y" />


    <cfloop query="u">

         <cfquery datasource="#dsn#" name="x"  >
      SELECT typeid,valuetype,typeicon FROM itemtypes
        </cfquery>


        <cfloop query="x">
            
             <cfquery datasource="#dsn#" name="find"  >
            Select * from itemtypes_user 
            where valuetype = '#x.valuetype#' and userid = #u.userid#
            </cfquery>
            
            <cfif #find.recordcount# is "0">
            
                 <cfquery datasource="#dsn#" name="insert"  >
                    
                    INSERT INTO `itemtypes_user` (`valuetype`, `typeicon`, `userid`) 
                    VALUES ('#x.valuetype#','#x.typeicon#',#u.userid#);
          
                </cfquery>
                      <cfif #dbug# is "Y">
                <CFOUTPUT>#u.recordname#: #x.valuetype# added</CFOUTPUT><BR>
                </cfif>
     
            </cfif>

        </cfloop>


    </cfloop>

        
      
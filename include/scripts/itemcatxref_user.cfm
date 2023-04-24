<cfparam name="dbug" default="Y" />

<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="u"  >
        SELECT * from taousers
    </cfquery>

    <cfloop query="u">
        
        <cfset new_userid = u.userid />
        
          <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="x"  >
SELECT DISTINCT c.catid,i.valuetype
FROM itemcategory c

inner join itemcatxref x ON x.catid = c.catid

INNER JOIN itemtypes i ON i.typeid = x.typeid

ORDER BY c.catid,i.valuetype
        </cfquery>
   
        
 

        <cfloop query="x">
            
            <cfset new_catid = x.catid />
            
    
            
            <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="find"  >
            Select typeid from itemtypes_user
            where valuetype = '#x.valuetype#' and userid = #new_userid#
            </cfquery>
            
            <cfset new_typeid = find.typeid />
            
            
            
                  <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="check"  >
        select * from itemcatxref_user where userid = #new_userid# and typeid = #new_typeid# and catid = #new_catid#
            </cfquery>
            
            
            
            
            <cfif #check.recordcount# is "0">
            
                <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="insert"  >
                    
                    INSERT INTO `itemcatxref_user` (`typeid`, `catid`, `userid`) 
                    VALUES (#new_typeid#,#new_catid#,#new_userid#);
          
                </cfquery>
                
     
            </cfif>

        </cfloop>


    </cfloop>

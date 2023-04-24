<cfparam name="dbug" default="Y">
<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="u"  >
        SELECT * from taousers
    </cfquery>

    <cfloop query="u">

        <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="x"  >
            SELECT 

s.id
,s.sitename
,s.siteURL
,s.siteicon 
,s.sitetypeid
,t.sitetypename

FROM sitelinks_master s INNER JOIN sitetypes_master t ON t.sitetypeid = s.siteTypeid
            WHERE s.ID IN (122,123)
ORDER BY s.sitename
        </cfquery>


        <cfloop query="x">
            
            <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="find"  >
                Select sitetypeid from sitetypes_user 
                where sitetypename = '#x.sitetypename#' and userid = #u.userid#

            </cfquery>
            
            <cfif #find.recordcount# is "1">
                
                <cfset new_sitetypeid = find.sitetypeid />
                
                      <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="find2"  >
            Select * from sitelinks_user_tbl where sitename = '#x.sitename#' and userid = #u.userid#
                </cfquery>
                
                <cfif #find2.recordcount# is "0">
                <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="insert"  >
                    
                    INSERT INTO `sitelinks_user_tbl` (`siteName`,`siteURL`,`siteicon`,`siteTypeid`,`userid`) 
                    VALUES ('#x.sitename#','#x.siteurl#','#x.siteicon#', #new_sitetypeid#, #u.userid#);
                    
                    
                    
                </cfquery>
                
                <cfif #dbug# is "Y">
                <CFOUTPUT>       INSERT INTO `sitelinks_user_tbl` (`siteName`,`siteURL`,`siteicon`,`siteTypeid`,`userid`) 
                    VALUES ('#x.sitename#','#x.siteurl#','#x.siteicon#', #new_sitetypeid#, #u.userid#);</CFOUTPUT><BR>
                </cfif>
                </cfif>
            </cfif>

        </cfloop>


    </cfloop>

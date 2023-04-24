
                 <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="u"  >
        SELECT * from taousers  
        </cfquery>

    <cfloop query="u">

         <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="x"  >
SELECT reportid,reportname,reportorderno,reporttypeid,reportdescription,colmd,colxl,datalabel,colorid FROM reports_master
        </cfquery>

        <cfloop query="x">
            
            
             <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="find"  >
            SELECT reportid,reportname,reportorderno,reporttypeid,reportdescription,colorid
             FROM reports_user
            where reportid = '#x.reportid#' and userid = #u.userid# and reportname = '#x.reportname#'
            </cfquery>
            
            <cfif #find.recordcount# is "0">
            
                 <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="insert"  >
                    INSERT INTO `reports_user` (`reportid`,`reportname`,`reportorderno`,`reporttypeid`,`reportdescription`,`userid`,`colmd`,`colxl`,`datalabel`,`colorid`) 
                    VALUES (#x.reportid#,'#x.reportname#',#x.reportorderno#,#x.reporttypeid#,'#x.reportdescription#', #u.userid#,#x.colmd#,#colxl#,
                '#x.datalabel#',#x.colorid#);
                </cfquery>
     <cfoutput>      INSERT INTO `reports_user` (`reportid`,`reportname`,`reportorderno`,`reporttypeid`,`reportdescription`,`userid`,`colmd`,`colxl`,`datalabel`,`colorid`) 
                    VALUES (#x.reportid#,'#x.reportname#',#x.reportorderno#,#x.reporttypeid#,'#x.reportdescription#', #u.userid#,#x.colmd#,#colxl#,
                '#x.datalabel#',#x.colorid#);<BR> </cfoutput>
            </cfif>

        </cfloop>


    </cfloop>
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
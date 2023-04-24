








<CFINCLUDE template="/include/remote_load.cfm" />

<cfquery datasource="#dsn#" name="x"  >
 SELECT min(notid) as new_notid,actionid,userid,suid
                         FROM funotifications
                         
                         GROUP BY actionid,userid,suid
                         
                        HAVING COUNT(*) > 1
                        ORDER BY actionid,userid,suid
</cfquery>


<cfloop query="x">
<cfquery datasource="#dsn#" name="rr"  >
update funotifications_tbl
                         
set isdeleted = 1 where notid = #x.new_notid#

</cfquery>



</cfloop>






<cfquery datasource="#dsn#" name="de"  >
update actionusers_tbl
set isdeleted = 1
    where userid=#userid#
    and actionid IN (SELECT actionid FROM fuactions WHERE systemid = #target_id_system#)
</cfquery>

<cfquery datasource="#dsn#" name="u"  >
        SELECT * from taousers  where userid=#userid#
        </cfquery>

    <cfloop query="u">

        <cfquery datasource="#dsn#" name="xs"  >
        SELECT actionid,actiondaysno,actiondaysrecurring from fuactions where actionid IN (SELECT actionid FROM fuactions WHERE systemid = #target_id_system#)
        </cfquery>

        <cfloop query="xs">
            
            
            <cfquery datasource="#dsn#" name="find"  >
            SELECT * from actionusers where actionid = #xs.actionid# and userid = #u.userid#
            </cfquery>
            
            <cfif #find.recordcount# is "0">
            
                <cfquery datasource="#dsn#" name="insert"  >
                    INSERT INTO `actionusers_tbl` (`actionid`,`userid`,`actiondaysno`<cfif #xs.actiondaysrecurring# is not "">,`actiondaysrecurring`</cfif>,`IsDeleted`) 
                    VALUES (#xs.actionid#, #u.userid#,#xs.actiondaysno#<cfif #xs.actiondaysrecurring# is not "">,#actiondaysrecurring#</cfif>, 0);
                </cfquery>
     
            </cfif>

        </cfloop>


    </cfloop>

        
          

<cflocation url="/app/myaccount/?t7=1&target_id_system=#target_id_system#" />      
        
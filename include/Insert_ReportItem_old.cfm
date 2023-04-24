        
  <cfquery datasource="#dsn#" name="findid"> 
        SELECT r.ID as new_iD
FROM reports_user r 
WHERE r.userid = 
      #session.userid# and r.reportid = #new_reportid#
        </cfquery>
 
    <cfoutput>
        <cfset new_ID = #findid.new_id# />
        

        
        
        
    </cfoutput>


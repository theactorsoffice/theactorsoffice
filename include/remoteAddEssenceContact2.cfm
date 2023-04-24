<CFINCLUDE template="/include/remote_load.cfm" />



    <cfquery name="add_sitetype" datasource="#dsn#" result="result" >   
        
        INSERT INTO `essences` (`essenceName`, `userID`) 
        VALUES ( '#new_essenceName#', #session.userid#);
    </cfquery>
    


 

    <cflocation url="/app/myaccount/?t3=1&tab3_expand=true" /> 
 
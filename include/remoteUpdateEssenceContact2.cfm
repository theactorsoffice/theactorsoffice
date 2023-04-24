<CFINCLUDE template="/include/remote_load.cfm" />

<cfparam name="IsDeleted" default="0" />

    <cfquery name="update" datasource="#dsn#"   >   
        
        UPDATE `essences` 
        set essenceName = '#new_essenceName#'
        ,isDeleted = #isdeleted#
        where essenceid = #essenceid#

    </cfquery>
    


 

    <cflocation url="/app/myaccount/?t3=1&tab3_expand=true" /> 
 
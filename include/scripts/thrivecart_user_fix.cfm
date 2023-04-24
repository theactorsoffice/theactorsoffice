<CFINCLUDE template="/include/remote_load.cfm" />

<cfquery datasource="#dsn#" name="x">
SELECT t.id,t.userid,u.userid as new_userid,t.customerfullname,u.recordname FROM thrivecart_tbl t INNER JOIN taousers_tbl u ON t.id = u.customerid  WHERE t.userid IS null
</cfquery>

<cfloop query="x">
        <cfquery datasource="#dsn#" name="upd" >
        update thrivecart
        set userid = #x.new_userid#
        where id = #x.id#
    </cfquery>
    

</cfloop>







<cfquery datasource="#dsn#" name="x">
SELECT t.id,t.userid,u.userid as new_userid,t.customerfullname,u.recordname FROM thrivecart t INNER JOIN taousers  u ON t.customerfullname = u.recordname AND t.userid IS null  
</cfquery>

<cfloop query="x">
        <cfquery datasource="#dsn#" name="upd" >
        update thrivecart
        set userid = #x.new_userid#
        where id = #x.id#
    </cfquery>
    

</cfloop>
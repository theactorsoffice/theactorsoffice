 <cfoutput>
         INSERT INTO `ticketslog_tbl` (`tlogDetails`, `userID`,`ticketid`, `ticketstatus`) VALUES
	( #new_tlogDetails#
    , #session.userid#
    , #new_ticketid#
    , #new_ticketstatus#
    
    );

</cfoutput>

<cfquery name="inserttlog" datasource="#dsn#" >
    INSERT INTO `ticketslog_tbl` (`tlogDetails`, `userID`,`ticketid`, `ticketstatus`) VALUES
	( <cfqueryparam value="#new_tlogDetails#" cfsqltype="cf_sql_varchar" />
    , <cfqueryparam value="#session.userid#" cfsqltype="cf_sql_integer" />
    , <cfqueryparam value="#new_ticketid#" cfsqltype="cf_sql_integer" />
    , <cfqueryparam value="#new_ticketstatus#" cfsqltype="cf_sql_varchar" />
    
    );
    </cfquery>
 	



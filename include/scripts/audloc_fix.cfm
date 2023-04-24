         <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="x"  >
SELECT a.audid,l.audlocname,l.audlocadd1,l.audlocadd2,l.audcity,l.regionid,l.audzip FROM audlocations l INNER JOIN auditions a ON a.audlocid = l.audlocid
         </cfquery>

<cfloop query="x">


<cfquery datasource="#dsn#" name="update"  >
UPDATE auditions
    SET audlocname = <cfqueryparam cfsqltype="cf_sql_varchar" value="#x.audlocname#" />
    
    ,audlocadd1 = <cfqueryparam cfsqltype="cf_sql_varchar" value="#x.audlocadd1#" />
    ,audlocadd2 = <cfqueryparam cfsqltype="cf_sql_varchar" value="#x.audlocadd2#" />
    ,audcity = <cfqueryparam cfsqltype="cf_sql_varchar" value="#x.audcity#" />
    ,regionid = <cfqueryparam cfsqltype="cf_sql_varchar" value="#x.regionid#" />
    ,audzip = <cfqueryparam cfsqltype="cf_sql_varchar" value="#x.audzip#" />
    
    where audid = <cfqueryparam cfsqltype="cf_sql_integer" value="#x.audid#" />

    </cfquery>
    
 

</cfloop>

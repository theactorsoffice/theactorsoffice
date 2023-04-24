         <CFINCLUDE template="/include/remote_load.cfm" />

<cfquery datasource="#dsn#" name="x"  >
SELECT U.userID AS NEW_USERID,U.defState,X.DEFSTATE, X.REGIONID AS NEW_REGIONID, U.REGIONID FROM 

taousers U INNER JOIN DEFSTATE_XREF X ON X.defstate = U.DEFSTATE
 
         </cfquery>

<cfloop query="x">


<cfquery datasource="#dsn#" name="update"  >
UPDATE taousers
    SET def_regionid = <cfqueryparam cfsqltype="cf_sql_char" value="#x.new_regionid#" />
   
    
    where userid = <cfqueryparam cfsqltype="cf_sql_integer" value="#x.new_userid#" />

    </cfquery>
    
 

</cfloop>

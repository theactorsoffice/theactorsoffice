 

   <CFINCLUDE template="/include/remote_load.cfm" />



<cfquery name="x" datasource="abo" >
  SELECT * FROM taousers_tbl
</cfquery>

<cfloop query="x">
 

    
  <cfquery name="setHashedPassword" datasource="abod" >
    UPDATE taousers_tbl
    SET
      isDeleted = #x.Isdeleted#
    WHERE userID = <cfqueryparam cfsqltype="integer" value="#x.userID#">
  </cfquery>
</cfloop>
      
      
      
    
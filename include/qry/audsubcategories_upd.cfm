<cfinclude template="/include/remote_load.cfm" />






UPDATE audsubcategories  SET 




WHERE audSubCatId = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audSubCatId#" /> </cfquery>
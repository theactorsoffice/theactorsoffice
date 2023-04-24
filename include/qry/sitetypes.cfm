<cfquery name="sitetypes" datasource="#dsn#">
SELECT sitetypeid,sitetypename,sitetypedescription,pntitle 
from sitetypes_user 
WHERE userid = #userid#
ORDER BY sitetypename
</cfquery>
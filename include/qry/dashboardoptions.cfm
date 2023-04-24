<CFINCLUDE template="/include/remote_load.cfm" />
 
<cfquery datasource="#dsn#" name="dashboards"   >
SELECT p.pnid, p.pntitle, p.pnColXl, p.pnColMd ,p.pnFilename,  p.pnorderno as 'new_pnorderno',p.isvisible
from pgpanels_user p
    where p.userid = #userid#

ORDER BY pnOrderno


</cfquery>
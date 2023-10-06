<CFINCLUDE template="/include/remote_load.cfm" />

<cfquery name="imports"  datasource="#dsn#"  >
SELECT 

u.uploadid,
u.`timestamp`,
u.userid,
u.uploadstatus,
i.status,
COUNT(i.ID) AS total_adds

FROM auditionsimport i INNER JOIN uploads u ON u.uploadid = i.uploadid
    inner join audprojects p on p.audprojectid = i.audprojectid
WHERE u.userid = #userid# and u.isdeleted = 0
GROUP BY u.uploadid,
u.timestamp,
u.userid,
u.uploadstatus,
i.status

HAVING u.userid = #userid#


 </cfquery>    
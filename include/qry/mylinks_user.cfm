
<cfquery name="mylinks_user"  >	
SELECT 
s.id,
s.sitetypeid,
s.sitename,
s.siteurl,
s.siteicon,
s.sitetypeid,
t.sitetypename,
t.pntitle,
GROUP_CONCAT(s.siteurl ORDER BY s.siteurl ASC SEPARATOR ', ') AS siteurl_list
FROM sitelinks_user s 
INNER JOIN sitetypes_user t ON t.sitetypeid = s.siteTypeid
WHERE s.userid = #userid# AND t.pntitle = '#pntitle#'
GROUP BY s.id, s.sitetypeid, s.sitename, s.siteicon, s.sitetypeid, t.sitetypename, t.pntitle
ORDER BY s.sitename;
</cfquery>		

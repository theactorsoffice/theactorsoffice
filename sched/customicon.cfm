 

<cfquery datasource="abod" name="x">
SELECT id,sitename,siteurl,siteicon FROM sitelinks_user WHERE iscustom = 1 AND siteicon = 'unknown.png'
</cfquery>

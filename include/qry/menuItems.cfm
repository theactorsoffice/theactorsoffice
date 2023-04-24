<cfquery name="mennuItemsU" datasource="#dsn#"  >
 SELECT

c.compID
,c.compName
,c.compIcon
,c.compOwner
,c.menuYN
,c.compDir
,c.menuOrder
FROM pgcomps c
    WHERE c.menuYN = 'Y'
 and   compOwner = 'U' and c.appid <> 3
ORDER BY c.menuOrder
   
</cfquery>

<cfquery name="mennuItemsA" datasource="#dsn#"  >
 SELECT

c.compID
,c.compName
,c.compIcon
,c.compOwner
,c.menuYN
,c.compDir
,c.menuOrder
FROM pgcomps c
WHERE c.menuYN = 'Y'
    and compOwner = 'A'  and c.appid <> 3
ORDER BY c.menuOrder
   
</cfquery>

<cfquery name="mennuItemsAud" datasource="#dsn#"  >
 SELECT

c.compID
,c.compName
,c.compIcon
,c.compOwner
,c.menuYN
,c.compDir
,c.menuOrder
FROM pgcomps c
WHERE c.menuYN = 'Y'
    and compOwner = 'A' and c.appid = 3
ORDER BY c.menuOrder
   
</cfquery>
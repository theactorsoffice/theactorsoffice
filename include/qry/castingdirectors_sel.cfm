<cfparam name="dbug" default="N" />
 
<CFINCLUDE template="/include/remote_load.cfm" />

<cfquery name="castingdirectors_sel" datasource="#dsn#">
SELECT  ci.contactid AS id, 
concat(c.recordname," (",ti.tagname,")") AS name
FROM contactitems ci
INNER JOIN contactdetails c ON c.contactid = ci.contactid
INNER JOIN tags_user ti ON ti.tagname = ci.valuetext
WHERE ci.valuecategory = 'Tag' AND ti.userid = #session.userid# and c.userid = #session.userid# AND ti.IsCasting = 1
ORDER BY c.recordname
</cfquery>
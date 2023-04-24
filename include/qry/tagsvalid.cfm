<CFINCLUDE template="/include/remote_load.cfm" />
<cfquery name="tagsvalid" datasource="#dsn#"  >	
SELECT tagname from tags_user where userid = #session.userid#
    order by tagname
</cfquery>		



<cfsavecontent variable="taglist"><cfoutput query="tagsvalid">{value: "#tagsvalid.tagname#",text: "#tagsvalid.tagname#"}<cfif #tagsvalid.currentrow# is not "#tagsvalid.recordcount#">,</cfif></cfoutput> </cfsavecontent>
 
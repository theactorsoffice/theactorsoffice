

<cfset newOrder = ListToArray(FORM.order)>
<cfloop from="1" to="#ArrayLen(newOrder)#" index="i">
  <cfquery datasource="#dsn#">
    UPDATE pgpanels_user
    SET pnorderno = #i#
    WHERE pnid = #newOrder[i]#
  </cfquery>
</cfloop>


<cfif #devicetype# is "mobile">

<cfinclude template="/include/qry/contacts_all.cfm">

<Cfelse>
<cfinclude template="/include/qry/contacts.cfm">

</cfif>
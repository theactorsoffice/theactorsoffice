<cfif #devicetype# is "mobile">

<cfinclude template="/include/contacts_all.cfm">

<Cfelse>
<cfinclude template="/include/contacts.cfm">

</cfif>
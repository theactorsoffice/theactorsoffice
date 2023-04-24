<cfset dbug = "Y" />

<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="users"  >
select userid from taousers
</cfquery>

<cfloop query="users">

<cfset newuserid = users.userid />

<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="panels"  >
select pnid from pgpanels
</cfquery>

<cfloop query="panels">

<cfset newpnid = panels.pnid />
    
    <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="Find"  >
    Select * from pgpanels_user_xref where pnid = #newpnid# and userid = #newuserid#
    </cfquery>
    
    <cfif #find.recordcount# is "0">
<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="insert"  >
Insert into pgpanels_user_xref (pnid,userid) values (#newpnid#,#newuserid#)
</cfquery>
<cfif #dbug# is "Y">
   <cfoutput> PNID #newpnid# and userid #newuserid# added</cfoutput><BR>                
</cfif>
</cfif>
</cfloop>

</cfloop>
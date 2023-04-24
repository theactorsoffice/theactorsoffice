<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="users"  >
select userid from taousers
</cfquery>

<cfloop query="users">
    
    <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="delete"  >
 delete from   actinglinks_user_xref where userid = #users.userid#
    </cfquery>
    
    

<cfset newuserid = users.userid />

<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="sites"  >
select siteid from actinglinks
</cfquery>

<cfloop query="sites">

<cfset newsiteid = sites.siteid />

<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="insert"  >
Insert into actinglinks_user_xref (siteid,userid) values (#newsiteid#,#newuserid#)
</cfquery>


</cfloop>

</cfloop>
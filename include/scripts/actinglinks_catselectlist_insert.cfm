 

<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="sites"  >
select * from actinglinks
</cfquery>
<cfsavecontent variable = "newCatSelectList">
{value: "Custom",text: "Custom"}<cfloop query="sites"><cfoutput>,{value: "#sites.sitename#",text: "#sites.sitename#"}</cfoutput></cfloop>    
</cfsavecontent>
 

<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="update"  >
update itemcategory 
    set catSelectList = <cfqueryparam value="#trim(newCatSelectlist)#" cfsqltype="cf_sql_longvarchar" />
where catid = 12
</cfquery>

 
 
 
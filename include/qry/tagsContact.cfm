<CFINCLUDE template="/include/remote_load.cfm" />

<cfquery name="TagsContact"  datasource="#dsn#" >

SELECT CONCAT("<span class='badge badge-blue' style='font-size: 12px; font-weight: 500;'>",valueText,"</span>") AS valuetext 
    ,valuetext as tag
			FROM contactitems 
			WHERE valueCategory = 'Tag' 
            and itemstatus = 'Active'
			AND contactID = #ContactID#
    order by valuetext
</cfquery>		


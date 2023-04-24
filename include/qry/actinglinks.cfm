<CFINCLUDE template="/include/remote_load.cfm" />

<cfquery name="actinglinks"  datasource="#dsn#" >	
SELECT i.valuetext , i.valuetype, t.typeIcon
			FROM contactitems i
		
                INNER JOIN itemtypes t on i.valueType = t.valueType
                	WHERE i.valueCategory = 'Acting Links'
			AND i.contactID = #contactid# 
            and i.itemstatus = 'Active'
</cfquery>		



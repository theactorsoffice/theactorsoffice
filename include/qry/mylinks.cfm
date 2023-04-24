<CFINCLUDE template="/include/remote_load.cfm" />

<cfquery name="mylinks"  datasource="#dsn#" >	
SELECT i.valuetext , i.valuetype, t.typeIcon, i.valuecategory
			FROM contactitems i
		
                INNER JOIN itemtypes t on i.valueType = t.valueType
                	WHERE i.valueCategory IN ( 'Acting Links','Profile')

            and i.itemstatus = 'Active'
            AND i.contactid = #userContactID#
            ORDER BY i.valuetype
</cfquery>		

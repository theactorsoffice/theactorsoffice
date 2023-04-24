<CFINCLUDE template="/include/remote_load.cfm" />

<cfquery name="profiles" datasource="#dsn#"  >	
SELECT i.valuetext , i.valuetype, t.typeIcon
			FROM contactitems i
		
                INNER JOIN itemtypes_user t on i.valueType = t.valueType
                	WHERE i.valueCategory = 'Social Profile'
			AND i.contactID = #contactid# 
            and i.itemstatus = 'Active'
    and t.userid = #userid#
</cfquery>		
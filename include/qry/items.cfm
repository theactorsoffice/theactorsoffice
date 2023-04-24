<cfparam name="contactid" default="1" />
<CFINCLUDE template="/include/remote_load.cfm" />
<cfquery name="items"   datasource="#dsn#"   >
SELECT 
i.itemID
,i.valueType
,i.valueCategory
,i.valuetext
,i.valuecompany
,i.valuedepartment
,i.valuetitle
,i.valueStreetAddress
,i.valueExtendedAddress
,i.valueCity
,i.valueRegion
,i.itemDate
,i.itemNotes
,i.itemStatus
,i.itemCreationDate
,i.itemLastUpdated
,i.valueCountry
,c.caticon
 FROM contactitems i
 INNER JOIN itemcategory c ON c.valueCategory = i.valuecategory
where i.contactID = #contactid# and i.valuetext <> ''
    and i.itemStatus = 'Active'
</cfquery>


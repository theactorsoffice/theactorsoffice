<cfparam name="contactid" default="1" />

<cfquery name="itemsAll"     >
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
,i.valuePostalCode
,i.valueCity
,i.valueRegion
,i.itemDate
,i.itemNotes
,i.itemStatus
,i.itemCreationDate
,i.itemLastUpdated
,i.valueCountry
,c.caticon
,c.catSelectList
,c.catfieldset
 FROM contactitems i
 INNER JOIN itemcategory c ON c.valueCategory = i.valuecategory
where i.contactID = #currentid# 
and c.catArea_UCB in ('B','#catArea_UCB#')
</cfquery>



<cfquery name="itemsbycatActive"     >
SELECT 
i.itemID
,i.valueType
,i.valueCategory
,i.valuetext
,i.valueCompany
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
,c.catfieldset
,c.caticon
,i.valuepostalcode
,i.primary_yn
 FROM contactitems i
 INNER JOIN itemcategory c ON c.valueCategory = i.valuecategory
where i.contactID = #currentid# 
and c.valuecategory = '#ActiveCategories.valueCategory#'
 and i.itemstatus = 'Active'
    and i.valuecategory <> 'Tag'
    and c.catArea_UCB in ('B','#catArea_UCB#')
    Order by i.valuetext
</cfquery>
    
    
   
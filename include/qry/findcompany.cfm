 <cfquery name="findcompany"     >

SELECT 

i.valueCompany
 FROM contactitems i
 INNER JOIN itemcategory c ON c.valueCategory = i.valuecategory
where i.contactID = #currentid#
and c.valuecategory = 'Company'
 and i.itemstatus = 'Active'
 AND i.valuecompany <> ''
 AND i.valuecompany IS NOT null
    Order by i.valuetext LIMIT 1
    </cfquery>
    
    
   
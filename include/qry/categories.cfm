<CFINCLUDE template="/include/remote_load.cfm" />

<cfquery name="categories" datasource="#dsn#" >
SELECT 
i.catID
,i.valuecategory
,i.catIcon
,i.catOrder
,i.valuetypedef
,i.catSelectList
,i.catFieldSet
 FROM itemcategory i
where i.catArea_UCB in ('B','#catArea_UCB#')
 ORDER BY catOrder

</cfquery>


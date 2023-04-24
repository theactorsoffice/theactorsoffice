<CFINCLUDE template="/include/remote_load.cfm" />
    
  <cfquery name="ActiveCategories"   datasource="#dsn#"  debug >  
SELECT 'Relationship' AS valueCategory, 'fe-users' AS caticon,'text' AS catFieldSet, 0 AS catid, 0 AS finalorder
UNION
SELECT distinct 
c.valueCategory
,c.caticon
,c.catfieldset
,c.catid
,c.catOrder AS finalorder
 FROM itemcategory c
    where c.valuecategory <> 'Tag'
    Order by finalorder
 </cfquery>   
      
        <cfquery name="InactiveCategories"   datasource="#dsn#"  debug >  
SELECT 'Relationship' AS valueCategory, 'fe-users' AS caticon,'text' AS catFieldSet, 0 AS catid, 0 AS finalorder
UNION
SELECT distinct 
c.valueCategory
,c.caticon
,c.catfieldset
,c.catid
,c.catOrder AS finalorder
 FROM itemcategory c
    where c.valuecategory <> 'Tag' and c.catid = 0
    Order by finalorder
 </cfquery>   
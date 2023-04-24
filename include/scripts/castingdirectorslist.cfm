<cfset dbug = "N" /> 

<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="a"   >
     SELECT trim(title) AS title, trim(info1type) AS itemtype, trim(info1) AS itemvalue FROM scrape_castingdirectorslist_details WHERE trim(info1type) <> '' AND trim(info1)  <> '' 
UNION
SELECT trim(title) AS title, trim(info2type) AS itemtype, trim(info2) AS itemvalue FROM scrape_castingdirectorslist_details WHERE trim(info2type) <> '' AND trim(info2)  <> '' 
UNION
SELECT trim(title) AS title, trim(info3type) AS itemtype, trim(info3) AS itemvalue FROM scrape_castingdirectorslist_details WHERE trim(info3type) <> '' AND trim(info3)  <> '' 
UNION
SELECT trim(title) AS title, trim(info4type) AS itemtype, trim(info4) AS itemvalue FROM scrape_castingdirectorslist_details WHERE trim(info4type) <> '' AND trim(info4)  <> '' 
UNION
SELECT trim(title) AS title, trim(info5type) AS itemtype, trim(info5) AS itemvalue FROM scrape_castingdirectorslist_details WHERE trim(info5type) <> '' AND trim(info5)  <> '' 
UNION
SELECT trim(title) AS title, trim(info6type) AS itemtype, trim(info6) AS itemvalue FROM scrape_castingdirectorslist_details WHERE trim(info6type) <> '' AND trim(info6)  <> '' 
UNION
SELECT trim(title) AS title, trim(info7type) AS itemtype, trim(info7) AS itemvalue FROM scrape_castingdirectorslist_details WHERE trim(info7type) <> '' AND trim(info7)  <> '' 
UNION
SELECT trim(title) AS title, trim(info8type) AS itemtype, trim(info8) AS itemvalue FROM scrape_castingdirectorslist_details WHERE trim(info8type) <> '' AND trim(info8)  <> '' 
UNION
SELECT trim(title) AS title, trim(info9type) AS itemtype, trim(info9) AS itemvalue FROM scrape_castingdirectorslist_details WHERE trim(info9type) <> '' AND trim(info9)  <> '' 
UNION
SELECT trim(title) AS title, trim(info10type) AS itemtype, trim(info10) AS itemvalue FROM scrape_castingdirectorslist_details WHERE trim(info10type) <> '' AND trim(info10)  <> '' 
UNION
SELECT trim(title) AS title, trim(info11type) AS itemtype, trim(info11) AS itemvalue FROM scrape_castingdirectorslist_details WHERE trim(info11type) <> '' AND trim(info11)  <> '' 
UNION
SELECT trim(title) AS title, trim(info12type) AS itemtype, trim(info12) AS itemvalue FROM scrape_castingdirectorslist_details WHERE trim(info12type) <> '' AND trim(info12)  <> '' 
UNION
SELECT trim(title) AS title, trim(info13type) AS itemtype, trim(info13) AS itemvalue FROM scrape_castingdirectorslist_details WHERE trim(info13type) <> '' AND trim(info13)  <> '' 
UNION
SELECT trim(title) AS title, trim(info14type) AS itemtype, trim(info14) AS itemvalue FROM scrape_castingdirectorslist_details WHERE trim(info14type) <> '' AND trim(info14)  <> '' 
UNION
SELECT trim(title) AS title, trim(info15type) AS itemtype, trim(info15) AS itemvalue FROM scrape_castingdirectorslist_details WHERE trim(info15type) <> '' AND trim(info15)  <> '' 
UNION
SELECT trim(title) AS title, trim(info16type) AS itemtype, trim(info16) AS itemvalue FROM scrape_castingdirectorslist_details WHERE trim(info16type) <> '' AND trim(info16)  <> '' 
UNION
SELECT trim(title) AS title, trim(info17type) AS itemtype, trim(info17) AS itemvalue FROM scrape_castingdirectorslist_details WHERE trim(info17type) <> '' AND trim(info17)  <> '' 

ORDER BY itemtype
    
 </cfquery>


 <cfloop query="a">
    
        
<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="INSERT"   result="result">
INSERT INTO scrape_castingdirectorslist_items
    (`Title`
    ,`itemtype`
    ,`itemvalue`
   )
    
    VALUES ('#a.Title#'
    ,'#TRIM(a.itemtype)#'
    ,'#TRIM(a.itemvalue)#'
    );
</cfquery>
  

 </cfloop>

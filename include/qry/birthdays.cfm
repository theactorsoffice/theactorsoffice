<CFINCLUDE template="/include/remote_load.cfm" />
<cfquery name="birthdays"  datasource="#dsn#"  maxrows="10">	
SELECT  datediff(d.contactbirthday,curdate()) as daysuntil,   
d.contactfullname AS col1,
    d.contactid,
DATE_FORMAT(d.contactbirthday,'%m-%d') as col2
 
FROM contactdetails d

WHERE d.userid = #session.userid# and d.contactbirthday is not null and datediff(d.contactbirthday,curdate()) < 15
order by datediff(d.contactbirthday,curdate())  
</cfquery>		



    
    <cfquery name="birthdaysx" datasource="#dsn#"  maxrows="10" >
SELECT   birthday_mm
        ,birthday_dd
,recordname AS col1
,date_format(cast(CONCAT(DATE_FORMAT(NOW(), '%Y'),"-",birthday_mm,"-",birthday_dd) AS DATE), '%m-%d') as col2 
,contactid
 ,   'Name' as 'head1'
,'Birthday' as 'head2'

, 4  AS daysuntil 

FROM contactdetails  
WHERE birthday_dd <> '' AND birthdaY_mm <> '' AND userid = #session.userid#
AND cast(CONCAT(DATE_FORMAT(NOW(), '%Y'),"-",birthday_mm,"-",birthday_dd) AS DATE) >= curdate()
 ORDER BY cast(CONCAT(DATE_FORMAT(NOW(), '%Y'),"-",birthday_mm,"-",birthday_dd) AS DATE) 
</cfquery>
<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="birthdayx"    maxrows="10">	
SELECT     
d.contactfullname AS col1,
    
date_format(d.contactbirthday, '%m-%d') as col2, 
    'Name' as 'head1',
'Birthday' as 'head2',
date_format(CURDATE(), '%m-%d') as tday, 
DATE_FORMAT(d.contactbirthday, '%m-%d') - date_format(CURDATE(), '%m-%d')  tbday,
CURDATE(), d.contactbirthday,DAYOFYEAR(CURDATE()), DAYOFYEAR(d.contactbirthday),  DAYOFYEAR(d.contactbirthday) - DAYOFYEAR(CURDATE()) AS daysuntil
    ,d.contactid
FROM contactdetails d

 inner JOIN taousers u ON u.userid = d.userid
WHERE DAYOFYEAR(d.contactbirthday) - DAYOFYEAR(CURDATE()) >= 0 
AND DAYOFYEAR(d.contactbirthday) - DAYOFYEAR(CURDATE()) < 8
and u.userid = #session.userid#
                                                           
ORDER BY abs((DATE_FORMAT(d.contactbirthday, '%m-%d') - date_format(CURDATE(), '%m-%d')))
</cfquery>		
    
    <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="birthdays"   maxrows="10" >
SELECT cast(CONCAT(DATE_FORMAT(NOW(), '%Y'),"-",birthday_mm,"-",birthday_dd) AS DATE) AS col2 , birthday_mm,birthday_dd
,recordname AS col1
,contactid
 ,   'Name' as 'head1'
,'Birthday' as 'head2'

, cast(cast(CONCAT(DATE_FORMAT(NOW(), '%Y'),"-",birthday_mm,"-",birthday_dd) AS DATE) - CURDATE() AS INT)   AS daysuntil 

FROM contactdetails  

WHERE birthday_dd <> '' AND birthdaY_mm <> '' AND userid = 1
AND cast(CONCAT(DATE_FORMAT(NOW(), '%Y'),"-",birthday_mm,"-",birthday_dd) AS DATE) >= curdate()
 ORDER BY cast(CONCAT(DATE_FORMAT(NOW(), '%Y'),"-",birthday_mm,"-",birthday_dd) AS DATE) 
    </cfquery>
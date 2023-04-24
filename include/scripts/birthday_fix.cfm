 

<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="x"  >
SELECT 
DATE_FORMAT(`contactbirthday`,'%m') AS new_month
,DATE_FORMAT(`contactbirthday`,'%d') AS new_day
,contactid,contactbirthday FROM contactdetails WHERE contactbirthday IS NOT null
</cfquery>
 
 <cfloop query="x">
<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="update"  >
update contactdetails 
    set birthday_dd = <cfqueryparam value="#x.new_day#" cfsqltype="cf_sql_char" />
    ,birthday_mm = <cfqueryparam value="#x.new_month#" cfsqltype="cf_sql_char" />
where contactid = #x.contactid#
</cfquery>
</cfloop>
 
 
 
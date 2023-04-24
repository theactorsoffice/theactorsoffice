<cfquery name="timezones"  datasource="#dsn#"   >	
SELECT tzid,gmt,tzname,utchouroffset FROM timezones
ORDER BY utcHourOffset
</cfquery>		
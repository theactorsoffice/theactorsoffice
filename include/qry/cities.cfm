<CFINCLUDE template="/include/remote_load.cfm" />

<cfquery name="cities"  datasource="#dsn#" >
SELECT id, countryid, regionid, cityname FROM cities ORDER BY cityname
</cfquery>
         <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="x"  >
SELECT * FROM CITIES

 
         </cfquery>

<cfloop query="x">

<CFSET NEW_ID = X.ID />
<cfquery datasource="#dsn#" name="update"  >
UPDATE CITIES SET CITY_ID = #NEW_ID# WHERE ID = #NEW_ID#

    </cfquery>
    
 

</cfloop>
         <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="Y"  >
SELECT * FROM COUNTRIES

 
         </cfquery>

<cFSET I = 0 />

<cfloop query="Y">
    
    <CFOUTPUT><CFSET i = #I# + 1 /></CFOUTPUT>
    
<CFSET NEW_COUNTRYID = Y.COUNTRYID />
    
<CFSET NEW_ID = I />
    
<cfquery datasource="#dsn#" name="update"  >
UPDATE COUNTRIES 
    SET COUNTRY_ID = #NEW_ID#
    WHERE COUNTRYID = '#NEW_COUNTRY_ID#'
    </cfquery>
    
 

</cfloop>

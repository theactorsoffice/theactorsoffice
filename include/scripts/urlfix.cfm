         <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="x"  >
    SELECT itemid,valuetext FROM contactitems 

WHERE valuetext not LIKE 'http%' AND  valuetext NOT LIKE '@%' and
valuecategory  IN ('profile','url','Acting links','Social Profile')

ORDER BY valuetext
         </cfquery>

<cfloop query="x">


<cfquery datasource="#dsn#" name="update"  >
UPDATE CONTACTITEMS
    SET VALUETEXT = <cfqueryparam cfsqltype="cf_sql_varchar" value="http://#x.valuetext#" />
    
    where itemid = <cfqueryparam cfsqltype="cf_sql_integer" value="#x.itemid#" />

    </cfquery>
    
    <cfoutput>
    #x.itemid# change from "#x.valuetext#" to "http://#x.valuetext#" <BR>
    
    </cfoutput>


</cfloop>

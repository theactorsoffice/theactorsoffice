<cfparam name="dbug" default="N" />
<cfparam name="new_audcatid" default="0" />
<cfparam name="new_countryid" default="US" />
 
<CFINCLUDE template="/include/remote_load.cfm" />

<cfquery name="audunions_sel" datasource="#dsn#">
SELECT 
u.unionid AS ID
,u.unionName AS NAME
,c.countryid
,u.audcatid
from audunions u
    inner join countries c on c.countryid = u.countryid
WHERE u.isDeleted is false

<cfif #new_countryid# is not "">
    and c.countryid = <cfqueryparam value="#new_countryid#" cfsqltype="cf_sql_varchar" />
</cfif>
    
        <cfif #new_audcatid# is not "0">
        and u.audcatid = <cfqueryparam value="#new_audcatid#" cfsqltype="cf_sql_integer" />
    </cfif>
    
    
ORDER BY u.unionname
</cfquery>

<cfif #dbug# is "Y">

    
    
        <h3>
        <cfoutput>#new_countryid# - Audunions_sel</cfoutput>
 
    </h3>

    <cftable query="audunions_sel" colheaders=true border="true" htmltable>
        <cfcol header="ID" text="#ID#" />
        <cfcol header="NAME" text="#NAME#" />
    </cftable>
    
    
    
    

</cfif>
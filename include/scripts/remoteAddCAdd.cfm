 <cfparam name="deleteitem" default="0" /> 
 <cfparam name="valuetext" default="" /> 
 <cfparam name="itemdate" default="" /> 
  <cfparam name="customtype" default="" /> 

<cfif #valuetype# is "Custom" and #customtype# is not "">
<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="insert"   result="typeresult" >
insert into itemtypes_user (valuetype,userid)
values ('#customtype#',#session.userid#)
    </cfquery>
    <cfset new_typeid = typeresult.generatedkey />
    <cfoutput>
     <cfset valuetype = "#customtype#" />
    </cfoutput>
             <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="insertx"  >
                    
                    INSERT INTO `itemcatxref_user` (`typeid`, `catid`, `userid`,`IsCustom`) 
                    VALUES (#new_typeid#,#catid#,#session.userid#,1);
          
                </cfquery>
                
    
    
    
    
</cfif>



<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="add"   result="result" >
INSERT INTO contactitems (contactid,valuetype,itemStatus,valueCategory)
VALUES (<cfqueryparam cfsqltype="cf_sql_integer" value="#contactid#" /> ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(valuetype)#" />,<cfqueryparam cfsqltype="cf_sql_varchar" value="Active" /> 
,<cfqueryparam cfsqltype="cf_sql_varchar" value="#valueCategory#" />    
    )
</cfquery>

<cfset itemid = result.generatedkey />









<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="update"   result="result" >
UPDATE contactitems
SET valuetext = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(valuetext)#" />
          
<cfif #catid# is "9">
    ,valueCompany = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(valuecompany)#" />
    ,valueDepartment = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(valueDepartment)#" />
    ,valueTitle = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(valueTitle)#" /> 
</cfif>
    
<cfif #catid# is "2">
     ,valueStreetAddress = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(valueStreetAddress)#" />   
    ,valueExtendedAddress = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(valueExtendedAddress)#" />    
  ,valueCity = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(valueCity)#" /> 
 ,valueRegion = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(new_regionname)#" /> 
 ,valueCountry = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(new_countryname)#" /> 
 ,valuePostalCode = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(valuePostalCode)#" /> 
    </cfif>
    
    <cfif #itemdate# is not "">
        ,itemdate = <cfqueryparam cfsqltype="cf_sql_date" value="#itemdate#" /> 
    </cfif>
        
WHERE itemid = #itemid#
</cfquery>

<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" /><cfinclude template="/include/bigbrotherinclude.cfm" /> 


<cflocation url="/app/contact/?contactid=#contactid#" />       



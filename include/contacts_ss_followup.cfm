<cfsetting showDebugOutput="no" />
<cfcontent reset="true">
<cfset listColumns = "`col1`,`col2`,`col3`,`col4`,`col5`" />
<cfset sIndexColumn = "contactid" />
<cfparam name="draw" default="1" type="integer" />
<cfparam name="start" default="0" type="integer" />
<cfparam name="length" default="10" type="integer" />
<cfparam name="search" default="" type="string" />
 
<cfif len(form["search[value]"]) gt 0>
    <cfset search=form["search[value]"]>
</cfif>
 
 
    
<!--- Data set after filtering --->
 <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="qFiltered_maint" >
SELECT contactid,contactcheck,col1,col2,col2b,col3,col4,col5,userid, hlink 
    from contacts_ss_followup
    

    
    
	WHERE userid = <Cfqueryparam value="#userid#" cfsqltype="CF_SQL_INTEGER" />	
    

    
    <cfif #isdefined('bytag')#>
    <cfif #bytag# is not "">
    and contactid in (SELECT contactid from contactitems  WHERE valuetype = 'tags' AND itemstatus = 'active' AND valuetext='#bytag#' )
    </cfif>
    </cfif>
    
    <cfif #isdefined('bylike')#>
    
    and col1 like '%#bylike#%'
    </cfif>
<cfif len(trim(search))>
AND
    (
    <cfloop list="#listColumns#" index="thisColumn">
    <cfif thisColumn neq listFirst(listColumns)>
    OR
    </cfif>
    #thisColumn# LIKE <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="%#trim(search)#%" />   
    </cfloop>
    )
</cfif>
<cfif form["order[0][column]"] gt 0>
    ORDER BY
    
        <cfif form["order[0][column]"] eq '1'>
    contactcheck <cfif form["order[0][dir]"] eq 'desc'>desc</cfif>
    </cfif>
    
    <cfif form["order[0][column]"] eq '2'>
    col1 <cfif form["order[0][dir]"] eq 'desc'>desc</cfif>
    </cfif>
    
    <cfif form["order[0][column]"] eq '3'>
    col2b <cfif form["order[0][dir]"] eq 'desc'>desc</cfif>
    </cfif>
    
    <cfif form["order[0][column]"] eq '4'>
    col3 <cfif form["order[0][dir]"] eq 'desc'>desc</cfif>
    </cfif>   
    
       <cfif form["order[0][column]"] eq '5'>
    col4 <cfif form["order[0][dir]"] eq 'desc'>desc</cfif>
    </cfif>   
    
           <cfif form["order[0][column]"] eq '6'>
    col5 <cfif form["order[0][dir]"] eq 'desc'>desc</cfif>
    </cfif>   
</cfif>
</cfquery>
 
<!--- Total data set length --->
<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" dbtype="query" name="qCount">
SELECT COUNT(#sIndexColumn#) as total
FROM   qFiltered_maint
</cfquery>
 
<cfif qFiltered_maint.recordcount gt 0>
    <cfset recordsTotal=#qCount.total#>
<cfelse>
    <cfset recordsTotal=0>
</cfif>
 
<!---
Output
--->
 
{"draw": <cfoutput>#val(draw)#</cfoutput>,
"recordsTotal": <cfoutput>#recordsTotal#</cfoutput>,
"recordsFiltered": <cfoutput>#qFiltered_maint.recordCount#</cfoutput>,
"data":
<cfif qFiltered_maint.recordcount gt 0>
[
<cfoutput query="qFiltered_maint" startrow="#val(start+1)#" maxrows="#val(length)#">
    <cfif currentRow gt (start+1)>,</cfif>
    {
        "contactcheck":#SerializeJSON(qFiltered_maint.contactcheck)#,
        "id":#SerializeJSON(qFiltered_maint.contactid)#,
  
       "hlink":#SerializeJSON(qFiltered_maint.hlink)#,
        "col1":#SerializeJSON(qFiltered_maint.col1)#,
        "col2":#SerializeJSON(qFiltered_maint.col2b)#,
     "col3":#SerializeJSON(qFiltered_maint.col3)#,
     "col4":#SerializeJSON(qFiltered_maint.col4)#,
     "col5":#SerializeJSON(qFiltered_maint.col5)#
    
   
    }
</cfoutput> ]
<cfelse>
    ""
</cfif>
 }

<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" /><cfinclude template="/include/bigbrotherinclude.cfm" /> 

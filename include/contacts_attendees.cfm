<cfparam name="event_id" default="0" />
 



<cfcontent reset="true">
<cfset listColumns = "`contactid`,`col1`,`col2`,`col3`,`col4`,`col5`" />
<cfset sIndexColumn = "contactid" />
<cfparam name="draw" default="1" type="integer" />
<cfparam name="start" default="0" type="integer" />
<cfparam name="length" default="10" type="integer" />
<cfparam name="search" default="" type="string" />
 <cfparam name="BYTAG" default="" type="string" />
<cfif len(form["search[value]"]) gt 0>
    <cfset search=form["search[value]"]>
</cfif>
  
 
    
<!--- Data set after filtering --->
 <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="qFiltered" >
SELECT contactid,col1,col2,col3,col4,col5,userid, hlink 
    from #contacts_table#
 


    
    
	WHERE userid = <Cfqueryparam value="#userid#" cfsqltype="CF_SQL_INTEGER" />	
 
 AND contactid IN (SELECT contactid FROM eventcontactsxref WHERE eventid = #eventid#)
  
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
    col1 <cfif form["order[0][dir]"] eq 'desc'>desc</cfif>
    </cfif>
    
    <cfif form["order[0][column]"] eq '2'>
    col1 <cfif form["order[0][dir]"] eq 'desc'>desc</cfif>
    </cfif>
    
    <cfif form["order[0][column]"] eq '3'>
    col2 <cfif form["order[0][dir]"] eq 'desc'>desc</cfif>
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
FROM   qFiltered
</cfquery>
 
<cfif qFiltered.recordcount gt 0>
    <cfset recordsTotal=#qCount.total#>
<cfelse>
    <cfset recordsTotal=0>
</cfif>
 
<!---
Output
--->
 
{"draw": <cfoutput>#val(draw)#</cfoutput>,
"recordsTotal": <cfoutput>#recordsTotal#</cfoutput>,
"recordsFiltered": <cfoutput>#qFiltered.recordCount#</cfoutput>,
"data":
<cfif qFiltered.recordcount gt 0>
[
<cfoutput query="qFiltered" startrow="#val(start+1)#" maxrows="#val(length)#">
    <cfif currentRow gt (start+1)>,</cfif>
    [
    

    "#SerializeJSON(qFiltered.contactid)#",
    #SerializeJSON(qFiltered.hlink)#,
     #SerializeJSON(qFiltered.col2)#,
     #SerializeJSON(qFiltered.col5)#,
     #SerializeJSON(qFiltered.col3)#,
        #SerializeJSON(qFiltered.col4)#
    ]
</cfoutput> ]
<cfelse>
    ""
</cfif>
 }
    
<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" /><cfinclude template="/include/bigbrotherinclude.cfm" /> 

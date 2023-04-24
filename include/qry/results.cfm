<cfset dbug = "n" />
<cfset fieldset = valuelist(FindFields.fname) />
<cfparam name="filter" default="" />
<cfparam name="dbug" default="N" />
<CFINCLUDE template="/include/remote_load.cfm" />
<cfif #pgid# is "29">

<cfset filter =   "#filter#  ORDER BY  t.catOrder" />
</cfif>

<cfif #pgid# is "25">

<cfset filter =   "#filter#  ORDER BY  t.actionNo" />
</cfif>


<cfquery name="FindKey" datasource="#dsn#"  >
SELECT * FROM pgfields WHERE pgid=#pgid# AND updatename = 'ID'
</cfquery>

<cfset sql_start = "SELECT t.#findkey.fname# as recid" />

<cfquery name="FindResults"  datasource="#dsn#" >
SELECT      
    
    f.fname
     
    ,f.fieldid
    ,f.pgid
    ,f.ftype
    ,f.ftypefull
    ,f.update_yn
    ,f.updatename
    ,f.updatetype
    ,f.fkey
    ,c2.comptable as comptableb
    ,c.comptable
     ,concat('t',f.fieldid) as talias
    FROM pgpages p
    INNER JOIN pgcomps c ON c.compID = p.compID
    INNER JOIN pgapps a ON a.appID = c.appid
    INNER join pgfields f on f.pgid = p.pgid
    LEFT join pgfields f2 on f.fkey = f2.fieldid
    LEFT join pgpages p2 on p2.pgid = f2.pgid
    LEFT join pgcomps c2 on c2.compid = p2.compid
    WHERE p.pgid = #pgid# AND f.results_yn = 'Y'
    ORDER BY f.displayOrder
    
    
</cfquery>
<cfquery name="FindJoins"  >

    SELECT      
    
    f.fname
   ,f2.fname AS fnameb
   
    ,c2.comptable as comptableb
    ,c.comptable
    ,f2.fieldid
    ,f2.fkey
    ,concat('t',f.fieldid) as talias
    FROM pgpages p
    INNER JOIN pgcomps c ON c.compID = p.compID
    INNER JOIN pgapps a ON a.appID = c.appid
    INNER join pgfields f on f.pgid = p.pgid
    LEFT join pgfields f2 on f.fkey = f2.fieldid
    LEFT join pgpages p2 on p2.pgid = f2.pgid
    LEFT join pgcomps c2 on c2.compid = p2.compid
    WHERE p.pgid = #pgid# 
    AND f.results_yn = 'Y' 
    AND f.fkey <> ''

</cfquery>
    

<cfsavecontent variable="resultsQuery"><cfoutput>
#sql_start#
    
    <cfloop query="findresults">
        <cfif #comptableb# is  "">
        ,t.#fname# as col#currentrow#, '#findresults.updatetype#' as updatetype#currentrow#, '#findresults.fname#' as fname#currentrow#
        <cfelse>
            ,#Findresults.talias#.recordname as col#currentrow#, 'recordname' as updatetype#currentrow#,  'recordname' as fname#currentrow#
        </cfif>
        , '#updatename#' as head#currentrow# 
    </cfloop>
    from #comptable# t
        
       <cfloop query="findjoins">
 
                   <cfset talias = findjoins.talias />
        INNER JOIN #comptableb#  #talias# on #talias#.#fnameb# = t.#fname#
        </cfloop> 
        
        
        </cfoutput>
</cfsavecontent>

<cfquery name="results"  >
#preservesinglequotes(resultsQuery)#
WHERE T.isdeleted is false
    #filter#
</cfquery>


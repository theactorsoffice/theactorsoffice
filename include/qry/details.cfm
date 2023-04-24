<cfset fieldset = valuelist(FindFields.fname) />

<cfset hh = 4 />
<cfquery name="FindKey"  >
SELECT * FROM pgfields WHERE pgid=#pgid# AND updatename = 'ID'
</cfquery>
<cfoutput>
<cfset pg_comptable = "#comptable#" />
</cfoutput>
<cfif #isdefined('dbug')#>
<cfoutput>
SELECT * FROM pgfields WHERE pgid=#pgid# AND updatename = 'ID'<BR>
SELECT recordname,#comptable#.#findkey.fname# as recid<BR>
    sql_start = "SELECT recordname,#comptable#.#findkey.fname# as recid"<BR>
    FIND RESULTS:    SELECT      
    
    f.fname
     
    ,f.fieldid
    ,f.pgid
    ,f.ftype
    ,f.ftypefull
    ,f.update_yn
    ,f.updatename
    ,f.updatetype
    ,f.fkey
    ,f.det_cols
    ,c2.comptable as comptableb
    ,c.comptable
    FROM pgpages p
    INNER JOIN pgcomps c ON c.compID = p.compID
    INNER JOIN pgapps a ON a.appID = c.appid
    INNER join pgfields f on f.pgid = p.pgid
    LEFT join pgfields f2 on f.fkey = f2.fieldid
    LEFT join pgpages p2 on p2.pgid = f2.pgid
    LEFT join pgcomps c2 on c2.compid = p2.compid
    WHERE p.pgid = #pgid# AND f.details_yn = 'Y'
    ORDER BY f.displayOrder<BR>
</cfoutput>
 <cfabort>
</cfif>
<cfset sql_start = "SELECT t.recordname,t.#findkey.fname# as recid" />

<cfquery name="FindResults"  >
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
    ,f.det_cols
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
    WHERE p.pgid = #pgid# AND f.details_yn = 'Y'
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
    WHERE p.pgid = #pgid# AND f.details_yn = 'Y' AND f.fkey <> ''

</cfquery>
    

<cfsavecontent variable="resultsQuery"><cfoutput>
#sql_start#
    
    <cfloop query="findresults">
        <cfset ftype = "#findresults.ftype#" />
    <cfif #comptableb# is  "">
        ,t.#fname# as col#currentrow#
        <cfelse>
            ,#Findresults.talias#.recordname as col#currentrow#
        </cfif>
        , '#updatename#' as head#currentrow# 
        , #FindResults.det_cols# as pgcol#currentrow#
    </cfloop>
    from #comptable# t
        
       <cfloop query="findjoins">
           <cfset talias = findjoins.talias />
        INNER JOIN #comptableb#  #talias# on #talias#.#fnameb# = t.#fname#
        
        </cfloop> 
        
        
        </cfoutput>
</cfsavecontent>

    <cfif #ftype# is "text" >
    
    <cfset where = "where t.#FindKey.fname# = '#recid#'" />
        
        <cfelse>
             <cfset where = "where t.#FindKey.fname# = #recid#" />
    </cfif>

<cfquery name="details"  >
#preservesinglequotes(resultsQuery)#
    
#preservesinglequotes(where)#
</cfquery>

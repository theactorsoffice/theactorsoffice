
<CFINCLUDE template="/include/remote_load.cfm" />
<cfquery datasource="#dsn#" name="x"      >
SELECT * from pgfields p where updatetype like 'select%' and  p.pgid = 148
</cfquery>

<cfloop query="x">
        
    
    <cfquery datasource="#dsn#" name="a"      >
    SELECT f.fieldid, c.comptable FROM pgfields f inner join pgpages p ON p.pgid = f.pgid inner join pgcomps c ON c.compid = p.compid 
        WHERE f.fname = '#x.fname#' AND p.pgid <> #x.pgid# AND f.updatename = 'ID' LIMIT 1
    </cfquery>
        
        
        <cfif #a.recordcount# is "1">
        
        <cfquery datasource="#dsn#" name="update"      >
update pgfields
set fkey = #a.fieldid#   
,tableselect = '#a.comptable#'
where fieldid = #x.fieldid#
</cfquery>
        
        <cfoutput>
            <h2>#x.currentrow#</h2>
        Field ID: #x.fieldid#<BR/>
        fkey: #a.fieldid#<BR/>
        tableselect: #a.comptable#<BR/>
        </cfoutput>
        
    
    
    

            
            <cfelse>
                
                <cfoutput>
                <h2>ERROR (#x.fieldid#)</h2><BR/>
                
                </cfoutput>
                </cfif>
            </cfloop>
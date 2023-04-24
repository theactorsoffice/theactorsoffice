<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="Finddetails"   >
SELECT pgdir from pgpages
    WHERE pgid = #pgid# 
</cfquery>   


<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="FindResults"   >
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
    WHERE p.pgid = #rpgid# AND f.results_yn = 'Y'
    ORDER BY f.displayOrder
</cfquery>   
<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="FindKey"   >
SELECT fname FROM pgfields WHERE pgid=#rpgid# AND updatename = 'ID'
</cfquery>

<cfset primary_key = findkey.fname />
<cfset comptable = FindResults.comptable />


<cfoutput>
<cfset pg_loc = "/app/#Finddetails.pgdir#/?recid=#parent_id#" />
pg_loc: #pg_loc#<BR>
mode: #mode#<BR>
pgid: #pgid#<BR>
parent recid : #parent_id#<BR>
Child pgid: #rpgid#<BR>
Child rec: #recid#<BR>
current_val: #current_val#<BR>
Table: #FindResults.comptable#><br>
Primary key: #primary_key#<BR>
<cfif #mode# is "up">
<Cfset desired_val = current_val -1>
    <cfelse>
 <Cfset desired_val = current_val +1>       
    
</cfif>
Desired val: #desired_val#<BR>
Fieldname: #fname#<BR>
        find query: select #primary_key# from #comptable# where #fname# = #desired_val# limit 1 <BR>
  SQL1: update #comptable# set #fname# = #desired_val# where #primary_key# = #recid#<BR>
     
</cfoutput>   
        
<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="find"   >        
select #primary_key# as primary_key from #comptable# where #fname# = #desired_val# limit 1      
        </cfquery> 
        
    
        <cfset desired_recid = find.primary_key />
        
        <cfoutput>
        
        desired_recid: #desired_recid#<BR>
  SQL2: update #comptable# set #fname# = #current_val# where #primary_key# = #desired_recid#<BR>          
        </cfoutput>
        

            
            <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="sql1"   >        
update #comptable# set #fname# = #desired_val# where #primary_key# = #recid#
        </cfquery> 
            
            <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="sq2"   >        
update #comptable# set #fname# = #current_val# where #primary_key# = #desired_recid#     
        </cfquery> 
            
            
       

<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" /><cfinclude template="/include/bigbrotherinclude.cfm" /> 
			
			     <cflocation url="#pg_loc#" />

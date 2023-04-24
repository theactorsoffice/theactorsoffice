<CFINCLUDE template="/include/projdate_fix_user.cfm" />
<cfparam name="sel_audcatid" default="x" />
<cfparam name="SEL_AUDSTEPID" default="0" />

<CFINCLUDE template="/include/remote_load.cfm" />

<cfparam name="audsearch" default="" />

<cfparam name="sel_audstepid" default="x" />

<cfparam name="sel_audtype" default="x" />

<cfparam name="auddate" default="x" />
<cfoutput>
<cfset cur_date = "#dateformat('#now()#','YYYY-MM-dd')#" />


</cfoutput>
    
 
<cfquery name="results"  datasource="#dsn#"  >
    SELECT 
p.audprojectid AS recid
    ,p.audprojectid
,r.audroleid
,st.audstep
,st.stepcss
,r.iscallback
,r.isredirect
,ca.audcatname   
,r.ispin
,r.isbooked
,st.stepcss
,'Date' AS head1
,'Project' AS head2
,'Category' as head3
,'Role' AS head4
,'Source' as head5
,'Status' as head6
,p.projdate AS col1
,p.audprojectdate as col1b
,p.projname AS col2
,ca.audcatname as col3
,r.audrolename as col4
,s.audsource AS col5
,c2.recordname as contactname
,sc.audsubcatname

,CONCAT_WS(p.projname,"|",rt.audroletype,"|",c.recordname,"|",st.audstep,"|",rt.audroletype,"|",s.audsource,"|",p.projdescription) AS search_query
    ,GROUP_CONCAT(c3.recordname) AS contacts_list
 
 FROM audprojects p
    
    INNER join audroles r on p.audprojectID = r.audprojectID

  
 LEFT JOIN auditions a ON r.audroleid = a.audroleid 
 
 LEFT JOIN audsources s ON s.audSourceID = r.audSourceID
 LEFT JOIN contactdetails c ON c.contactID = p.contactid
 LEFT JOIN contactdetails c2 ON c2.contactID = r.contactid
 LEFT JOIN audroletypes rt ON rt.audroletypeid = r.audroletypeid
 LEFT JOIN audsteps st ON st.audstepid = a.audstepid
LEFT join audsubcategories sc on sc.audsubcatid = p.audsubcatid
    LEFT join audcategories ca on ca.audcatid = sc.audcatid
 
    LEFT JOIN audcontacts_auditions_xref x on x.audprojectid = p.audprojectid
    
    left join contactdetails c3 on c3.contactid = x.contactid

  WHERE r.isdeleted IS FALSE AND p.isDeleted IS false

 AND p.userid = #userid#
    
    <cfif  #sel_audcatid# is not "x">
    
    and sc.audcatid = #sel_audcatid#
    
    </cfif>

<cfif #sel_audstepid# is not "x">

    <cfif #sel_audstepid# is "2">
    
    and r.iscallback = 1
    </cfif>
    
        <cfif #sel_audstepid# is "3">
    
    and r.isredirect = 1 
    </cfif>
  
    
        <cfif #sel_audstepid# is "4">
    
    and r.ispin = 1 
    </cfif>
  
    
        <cfif #sel_audstepid# is "5">
    
    and r.isbooked = 1
    </cfif>
    
      <cfif #sel_audstepid# is "1">
    

       and p.isDirect = 0
 
    </cfif>
    
    
          <cfif #sel_audstepid# is "999">
    
   
    and p.isDirect = 1
    </cfif>
  
    
</cfif>
    
<cfif #sel_audtype# is not "x">

    and t.audtype = '#sel_audtype#'
    
</cfif>
    
    <cfif #auddate# is "future">
  and   p.projdate >=  <cfqueryparam value="#cur_date#" cfsqltype="cf_sql_date">
    
    </cfif>
        
            <cfif #auddate# is "past">
  and   p.projdate <= <cfqueryparam value="#cur_date#" cfsqltype="cf_sql_date">
    
    </cfif>
        
        

        
        
        
GROUP BY r.audroleid, p.projname,s.audsource,rt.audroletype,r.iscallback,r.isredirect,r.ispin,r.isbooked            
    <cfif #audsearch# is not "">
        
       HAVING 
(
        
        
(search_query like '%#audsearch#%' )

OR

(contacts_list LIKE '%#audsearch#%')

)
        
</cfif>    
 
 ORDER BY p.projdate desc
 </cfquery>   
    
<cfset projectlist = valuelist(results.audprojectid) />    
    
   
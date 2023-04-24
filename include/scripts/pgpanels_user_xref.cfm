


<CFINCLUDE template="/include/remote_load.cfm" />

<cfquery datasource="#dsn#" name="d"  >
   update pgpanels_user_xref set isdeleted = 1
</cfquery>
<cfquery datasource="#dsn#" name="x"  >
SELECT distinct p.pnid, u.userid
 from pgpanels_user_xref x INNER JOIN taousers u ON u.userid = x.userid INNER JOIN pgpanels p ON p.pnID = x.pnid 

 WHERE  p.pnfilename= 'dash_rr.cfm'
    
    
    
    UNION
SELECT distinct  p.pnid, u.userid

 from pgpanels_user_xref x INNER JOIN taousers u 
    ON u.userid = x.userid INNER JOIN pgpanels p ON p.pnID = x.pnid 
 INNER JOIN sitetypes_user su ON su.userid = u.userid  
 WHERE  p.pnFilename = 'mylinks_user.cfm'
AND su.userid = u.userid AND su.userid = x.userid
AND p.pntitle = concat(su.sitetypename,' Links')
    and  p.pnfilename <> 'dash_rr.cfm'
UNION
SELECT  distinct p.pnid, u.userid

 from pgpanels_user_xref x INNER JOIN taousers u ON u.userid = x.userid INNER JOIN pgpanels p ON p.pnID = x.pnid 

 WHERE p.pnFilename <> 'mylinks_user.cfm'
    and  p.pnfilename <> 'dash_rr.cfm'
 
</cfquery>

    
    <cfloop query="x">
        
        
    <cfquery datasource="#dsn#" name="ins"  >
update pgpanels_user_xref set isdeleted = 0 where pnid = #x.pnid# and userid = #x.userid#
  
        </cfquery> 
        
        
    </cfloop>

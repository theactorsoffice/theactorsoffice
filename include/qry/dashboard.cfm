
<cfquery name="dashboards"  result="dash" >
   SELECT p.pnid, p.pntitle, p.pnColXl, p.pnColMd , p.pnFilename, p.pnorderno as 'new_pnorderno'
   
   FROM pgpanels_user p WHERE p.userid = #userid# and p.isvisible is true
order by p.pnorderno

</cfquery>
    
    

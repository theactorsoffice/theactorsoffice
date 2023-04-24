         <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="x"  >
SELECT * FROM audunions WHERE audcatid = 1
         </cfquery>

<cfloop query="x">


<cfquery datasource="#dsn#" name="update"  >
Insert into audunions (unionname,countryid,audcatid)
    
    values('#x.unionname#','#x.countryid#',7)

    </cfquery>
    
 

</cfloop>

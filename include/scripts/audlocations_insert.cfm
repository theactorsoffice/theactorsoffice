 
<cfquery datasource="abo" name="z">
    SELECT DISTINCT valuestreetAddress,valueextendedaddress,valuecity,valueregion,valuepostalcode FROM contactitems WHERE valuestreetaddress IS NOT NULL AND valuestreetAddress <> ''

</cfquery>
    
    
    
    

<cfloop query="z">
    
    
    
    <cfquery datasource="abod" name="U">
        SELECT userid from taousers
    </cfquery>


    <cfloop query="u">

        <cfquery datasource="abod" name="a">

            INSERT INTO `audlocations` ( `eventLocation`, `audlocadd1`, `audlocadd2`, `audcity`, `stateid`, `audzip`, `userid` ) VALUES
            ( '#z.valuestreetAddress#', '#z.valuestreetAddress#', '#z.valueextendedaddress#', '#z.valuecity#', 5, '90046', #u.userid# );
        </cfquery>



    </cfloop>




</cfloop>

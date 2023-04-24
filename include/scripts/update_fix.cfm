<cfquery datasource="abo" name="x"      >
SELECT * FROM ftypexref  

</cfquery>
    <cfloop query="x">
     
     <cfquery datasource="abod" name="a"      >
           update ftypexref

set  updatetype = '#x.updatetype#'
                      
                   
                      
                      where ftypefull = '#x.ftypefull#'
            
            </cfquery>
            
            </cfloop>
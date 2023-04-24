<CFINCLUDE template="/include/remote_load.cfm" />

<cfquery datasource="#dsn#" name="ParentFolder">
select * from pgdirs order by length(id) ASC
</cfquery>
   

<cfloop query="ParentFolder">
    
    <cfquery datasource="#dsn#" name="Files">
    select * from pgfiles where parentid = '#ParentFolder.id#' 
    </cfquery>
    
        <cfquery datasource="#dsn#" name="SubDir">
    select * from pgdirs where id = '#ParentFolder.id#'
    </cfquery>
    
    

    
    
    
 <cfoutput>
    
     <h2>[x-id:#ParentFolder.id#] Parent Folder: </h2></cfoutput>

    <Cfloop query="Files">
        <cfoutput>
     Files:#Files.id#<BR>
        

</cfoutput>

     </Cfloop>

    
    <cfloop query="SubDir">
        
        
            <cfquery datasource="#dsn#" name="aa">
    select * from pgfiles where parentid = '#SubDir.id#' 
    </cfquery>
        
        
        
                <cfoutput>
        <h3>SubDir:#SubDir.dirname# (SubDir recordcount):#SubDir.recordcount#)</h3>
                    
                    <p>    select * from pgdirs where parentid = '#ParentFolder.id#'<BR></p>
    </cfoutput>
    
        
     </cfloop>
    
    
    
   
    </cfloop>
                
         

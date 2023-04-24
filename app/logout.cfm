<cfif #isdefined('session.userid')# > 
    
 <cfset StructDelete(Session, "userid")>
     
    </cfif>   
   
     <cflocation url="/loginform.cfm" />
     
     
 

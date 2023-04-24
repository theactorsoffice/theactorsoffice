    <cfcookie name="status_active" expires="#now()#">
        
    <cfcookie name="status_completed" expires="#now()#">
        
    <cfcookie name="status_future" expires="#now()#">


<cfif NOT isdefined('status_active')>

<cfset status_active = "N" />
    
</cfif>

<cfif NOT isdefined('status_completed')>

<cfset status_completed = "N" />
    
</cfif>


<cfif NOT isdefined('status_future')>

<cfset status_future = "N" />
    
</cfif>

<cfif  status_active is "">
        
 <cfset status_active = "N" />
    
</cfif>
        
    <cfif  status_completed is "">
        
 <cfset status_completed = "N" />
    
</cfif>
    
     <cfif  status_future is "">
        
 <cfset status_future = "N" />
    
</cfif>
           
    
    <cfset cookie.status_active = status_active />
    
     <cfset cookie.status_completed = status_completed />
    
     <cfset cookie.status_future = status_future />
		
		<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" /><cfinclude template="/include/bigbrotherinclude.cfm" /> 
        
 
<cflocation url="/app/contact/?contactid=#contactid#&t4=1&status_active=#status_active#&status_completed=#status_completed#&status_future=#status_future#" />



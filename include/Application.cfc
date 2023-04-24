<cfcomponent>
    <cfparam name="j_username" default="" />
    <cfparam name="j_password" default="" />
    <cfset currentURL=cgi.server_name />
    <cfset host=ListFirst(currentURL, "." ) />

    <cfif #host# is "app">
        <cfset This.name="ABO">
            <cfset This.datasource="ABO">
                <cfelseif #host# is "uat">
                    <cfset This.datasource="ABOD">
                        <cfset This.name="ABOUAT">
                    <cfelse>
                    <cfset This.name="ABOD">
                        <cfset This.datasource="ABOD">
    </cfif>

    <cfset This.ApplicationTimeout=CreateTimeSpan( 1, 0, 1, 0 ) />
    <cfset This.timezone="America/Los_Angeles" />
    <cfset This.loginStorage="session" />
    <cfset This.SessionManagement="true" />
    <cfset This.LogPath=expandPath("error.log")>
    <cfset This.ErrorTemplateNotFound="404.cfm">
    <cfset This.ErrorTemplate="500.cfm">
        
        
        
        
        
        
<cffunction name="onMissingTemplate" returnType="boolean">
    <cfargument type="string" name="targetPage" required=true/>

<cftry>
   
    <cfheader 
       statusCode = "404"
       statusText = "Page Not Found"
    >
   
    <!--- Retrieving 404 ErrorHandler from Application scope --->
    <cflock timeout="5" scope="application">
        <cfset ErrorTemplateNotFound = This.ErrorTemplateNotFound>
    </cflock>
    
    <!--- Include custom 404 page --->
    <cfinclude template = "#ErrorTemplateNotFound#">
   
    <!--- return true to prevent the default ColdFusion error handler from running --->
    <cfreturn true />
   
    <cfcatch>
    <!--- If an error occurs within the error handler routine, allow ColdFusion's default error handler to run --->
        <cfreturn false />
    </cfcatch>
</cftry>

</cffunction>
        
       
        
        
        
     
        
        
        
        
        
        
        

                <cffunction name="OnRequestStart">
                  <cfif  isdefined('xid')>
                       
                       <cfset session.userid = xid />
                       
                    </cfif>
                    
                    <cfif NOT isdefined('session.userid')>

<cfif NOT isdefined('pwpass')>

                                <cflocation url="/loginform.cfm" addtoken="no" >
                    </cfif>          


                        </cfif>





             
     
                </cffunction>





                <cffunction name="OnRequestEnd">


                </cffunction>



</cfcomponent>

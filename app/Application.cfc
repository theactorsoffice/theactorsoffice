<cfcomponent>
    <cfparam name="j_username" default="" />
    <cfparam name="j_password" default="" />
    <cfset currentURL=cgi.server_name />
    <cfset host=ListFirst(currentURL, "." ) />

    <cfif #host# is "app">
        <cfset This.name="ABO">
        <cfset This.datasource="ABO">
            <cfset This.suffix="_1.4">    
                
    <cfelseif #host# is "uat">
                    
        <cfset This.datasource="ABOD">
        <cfset This.name="ABOUAT">
             <cfset This.suffix="">         
            
        <cfelse>
            
            <cfset This.name="ABOD">
            <cfset This.datasource="ABOD">
                <cfset This.suffix="">  
                
                
    </cfif>

    <cfset This.ApplicationTimeout=CreateTimeSpan( 1, 0, 1, 0 ) />
    <cfset This.timezone="America/Los_Angeles" />
    <cfset This.loginStorage="session" />
    <cfset This.SessionManagement="true" />
    <cfset This.LogPath=expandPath("error.log")>
        <cfset This.ErrorTemplateNotFound="cferror.cfm">
            <cfset This.ErrorTemplate="cferror.cfm">

                <cffunction name="OnRequestStart">
                  <cfif  isdefined('u')>
                       
                       <cfset session.userid = u />
                       
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

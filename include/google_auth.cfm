 <CFINCLUDE template="/include/remote_load.cfm" />

<cfoauth 
    type="google" 
    clientid="764716537559-ncfiag8dl4p05v7c9kcoltss0ou3heki.apps.googleusercontent.com" 
    secretkey="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" 
    redirecturi="https://dev.theactorsoffice.com/include/google_auth.cfm" 
    result="authResult" 
    access_type="offline"
    scope="https://www.googleapis.com/auth/calendar">
</cfoauth>

<!--- Save the access token and refresh token in the database --->


<cfquery name="updateUserToken"  datasource="#dsn#" >
    UPDATE taousers
    SET access_token = <cfqueryparam value="#authResult.access_token#" cfsqltype="CF_SQL_VARCHAR">,
        refresh_token = <cfqueryparam value="#authResult.refresh_token#" cfsqltype="CF_SQL_VARCHAR">
    WHERE userid = <cfqueryparam value="#session.userid#" cfsqltype="CF_SQL_INTEGER">
</cfquery>

<!--- Redirect to a success page or continue with your application's flow --->
<cflocation url="/app/contacts/" addtoken="no">

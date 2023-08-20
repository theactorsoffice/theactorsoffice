<!--- Get the authorization code from the query parameters --->
<cfset authorizationCode = URL.code>

<!--- Set up the parameters for the token request --->
<cfset clientId = "764716537559-ncfiag8dl4p05v7c9kcoltss0ou3heki.apps.googleusercontent.com">
<cfset clientSecret = "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"> <!--- Replace with your client secret --->
<cfset redirectUri = "https://dev.theactorsoffice.com/include/oauth_callback.cfm">
<cfset tokenUrl = "https://www.googleapis.com/oauth2/v4/token">

<!--- Construct the POST data for the token request --->
<cfset postData = "code=#authorizationCode#&client_id=#clientId#&client_secret=#clientSecret#&redirect_uri=#redirectUri#&grant_type=authorization_code">

<!--- Make the POST request to exchange the authorization code for an access token --->
<cfhttp url="#tokenUrl#" method="post" result="tokenData">
    <cfhttpparam type="header" name="Content-Type" value="application/x-www-form-urlencoded">
    <cfhttpparam type="body" value="#postData#">
</cfhttp>

<CFINCLUDE template="/include/remote_load.cfm" />

<!--- Check if refresh_token is available --->
<cfif StructKeyExists(tokenData, "refresh_token")>
    <cfset refreshToken = tokenData.refresh_token>

    <!--- Update both access_token and refresh_token --->
    <cfquery name="updateUserToken" datasource="#dsn#">
        UPDATE taousers
        SET access_token = <cfqueryparam value="#tokenData.accessToken#" cfsqltype="CF_SQL_VARCHAR">,
            refresh_token = <cfqueryparam value="#tokenData.refreshToken#" cfsqltype="CF_SQL_VARCHAR">
        WHERE userid = <cfqueryparam value="#session.userid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
<cfelse>
    <!--- Update only access_token --->
    <cfquery name="updateUserToken" datasource="#dsn#">
        UPDATE taousers
        SET access_token = <cfqueryparam value="#tokenData.accessToken#" cfsqltype="CF_SQL_VARCHAR">
        WHERE userid = <cfqueryparam value="#session.userid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
</cfif>
<!--- Redirect the user to a success page or continue with your application's flow --->
<cflocation url="/app/contacts/" addtoken="no">

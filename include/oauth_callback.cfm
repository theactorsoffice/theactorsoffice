<!--- Get the authorization code from the query parameters --->
<cfset authorizationCode = URL.code>

<!--- Set up the parameters for the token request --->
<cfset clientId = "TAO">
<cfset clientSecret = "YOUR_CLIENT_SECRET"> <!--- Replace with your client secret --->
<cfset redirectUri = "https://app.theactorsoffice.com/oauth_callback.cfm">
<cfset tokenUrl = "https://www.googleapis.com/oauth2/v4/token">

<!--- Construct the POST data for the token request --->
<cfset postData = "code=#authorizationCode#&client_id=#clientId#&client_secret=#clientSecret#&redirect_uri=#redirectUri#&grant_type=authorization_code">

<!--- Make the POST request to exchange the authorization code for an access token --->
<cfhttp url="#tokenUrl#" method="post" result="tokenResponse">
    <cfhttpparam type="header" name="Content-Type" value="application/x-www-form-urlencoded">
    <cfhttpparam type="body" value="#postData#">
</cfhttp>

<!--- Parse the JSON response to get the access token and refresh token --->
<cfset tokenData = DeserializeJSON(tokenResponse.FileContent)>
<cfset accessToken = tokenData.access_token>
<cfset refreshToken = tokenData.refresh_token>

<!--- Save the access token and refresh token in the database for the current user --->
<cfquery name="updateUserToken" datasource="yourDSN">
    UPDATE taousers
    SET access_token = <cfqueryparam value="#accessToken#" cfsqltype="CF_SQL_VARCHAR">,
        refresh_token = <cfqueryparam value="#refreshToken#" cfsqltype="CF_SQL_VARCHAR">
    WHERE userid = <cfqueryparam value="#currentUser.userid#" cfsqltype="CF_SQL_INTEGER"> <!--- Replace with the current user's ID --->
</cfquery>

<!--- Redirect the user to a success page or continue with your application's flow --->
<cflocation url="/success.cfm" addtoken="no">

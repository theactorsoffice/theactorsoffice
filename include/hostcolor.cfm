<cfset currentURL = cgi.server_name />
<cfset host = ListFirst(currentURL, ".") />
<cfif #host# is "app">
    <cfset hostcolor = "##406E8E" />
</cfif>
<cfif #host# is "dev">
    <cfset hostcolor = "##406E8E" />
</cfif>
<cfif #host# is "uat">
    <cfset hostcolor = "purple" />
</cfif>
<style>
body.authentication-bg {
    background-color: <cfoutput>#hostcolor#</cfoutput>;
	background-size: cover;
	background-position: center
}
</style>
<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" /><cfinclude template="/include/bigbrotherinclude.cfm" /> 
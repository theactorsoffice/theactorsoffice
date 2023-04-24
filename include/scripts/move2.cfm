     <cfset currentURL = cgi.server_name />
    <cfset host = ListFirst(currentURL, ".") />
<cfoutput>
    <cfset app_dir="c:\home\theactorsoffice.com\wwwroot\#host#-subdomain\app" />
</cfoutput>
<cfset dev_dir="c:\home\theactorsoffice.com\wwwroot\dev-subdomain\app" />


<script>
directoryCopy(app_dir,dev_dir,true)

</script>
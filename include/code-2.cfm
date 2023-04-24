<cfinclude template="code-1.cfm" />

<!--- Search entire directory. --->
<cfset arrMatchingPaths = SearchFiles(
	Path = ExpandPath( "./" ),
	Criteria = "cfm"
	) />
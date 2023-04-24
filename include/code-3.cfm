

<!--- Create an array of file paths to search. --->
<cfset arrPaths = ArrayNew( 1 ) />

<!--- Add paths to the array. --->
<cfset ArrayAppend(
	arrPaths,
	ExpandPath( "./file_search_data.htm" )
	) />

<cfset ArrayAppend(
	arrPaths,
	ExpandPath( "./file_search_data.html" )
	) />

<cfset ArrayAppend(
	arrPaths,
	ExpandPath( "./file_search_data.txt" )
	) />


<!--- Search given files for the regular expression match. --->
<cfset arrMatchingPaths = SearchFiles(
	Path = arrPaths,
	Criteria = "she (pondered|licked|kissed)",
	Filter = "txt",
	IsRegex = true
	) />
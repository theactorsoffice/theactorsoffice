<cfquery name="reportcolors"  datasource="#dsn#"   >	
SELECT colorid,colorname,colorscheme FROM reportcolors ORDER BY colorname
</cfquery>		
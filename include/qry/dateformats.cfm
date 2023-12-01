<cfparam name="dbug" default="N" />

 
<cfquery datasource="#dsn#" name="dateformats" >
SELECT id,formatexample,formatnotes FROM dateformats
</cfquery>
<cfparam name="dbug" default="N" />

 
<cfquery datasource="#dsn#" name="ranges" >
SELECT rangeid,rangename FROM 
audageranges 
WHERE isdeleted IS FALSE
ORDER BY rangeid
</cfquery>
<CFINCLUDE template="/include/remote_load.cfm" />

<cfquery name="details" datasource="#dsn#"  >       
SELECT * from noteslog where noteid=#noteid#
</cfquery>   

<cfoutput>#details.notedetailshtml#</cfoutput>
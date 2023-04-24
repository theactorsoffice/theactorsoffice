 <CFINCLUDE template="/include/remote_load.cfm" />

<cfquery name="x" datasource="#dsn#">
SELECT * FROM audsubcategories
</cfquery>


<cfloop query="x">
    
    <cfoutput>

        <cfset new_audsubcatid = #x.audsubcatid# />
    <cfif #x.audsubcatname# is "Other" >
        
        <cfset new_audsubcatnamesort = "ZZZ" />
    
    <cfelse>
        
        <cfset new_audsubcatnamesort = "#x.audsubcatname#" />
        
    </cfif>

    </cfoutput>
        
        
        
<cfquery name="f" datasource="#dsn#"  >
UPDATE AUDSUBCATEGORIES set audsubcatnamesort = '#new_audsubcatnamesort#' where audsubcatid = #new_audsubcatid#
</cfquery>
 

</cfloop>
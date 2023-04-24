<cfabort>
<cfset dbug = "Y">
<cfif #dbug# is "Y"><cfoutput>#now()#<BR></cfoutput></cfif>    
<CFINCLUDE template="/include/remote_load.cfm" />
 
<cfquery datasource="#dsn#" name="x"  >
SELECT * FROM audgenres WHERE audcatid = 2;
         </cfquery>
<cfif #dbug# is "Y"><cfoutput>#x.recordcount#<BR></cfoutput></cfif>
<cfloop query="x">
<cfquery datasource="#dsn#" name="Insert"  >
INSERT INTO `audgenres` (`audgenre`, `audCatid`) 
    
    VALUES ( '#x.audgenre#', 7);
    </cfquery>
 <cfoutput>
    
    INSERT INTO `audgenres` (`audgenre`, `audCatid`) 
    
    VALUES ( '#x.audgenre#', 7);<BR>
    </cfoutput>

</cfloop>

<cfif #dbug# is "Y"><cfoutput>#now()#<BR></cfoutput></cfif>    



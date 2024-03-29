<cfset dbug = "Y">

<CFINCLUDE template="/include/remote_load.cfm" />
<cfif #dbug# is "Y"><cfoutput>#now()#<BR></cfoutput></cfif>
<cfquery datasource="#dsn#" name="del"  >
    UPDATE audprojects 
    set projdate = NULL
    where isdeleted  <> 1 and userid = #userid#
</cfquery>

<cfquery datasource="#dsn#" name="x"  >
SELECT p.audprojectID,min(a.eventStart) AS new_projDate 
FROM events a 

INNER JOIN audroles r ON r.audroleid = a.audroleid
    
INNER JOIN audprojects p on p.audprojectid = r.audprojectid

WHERE r.isDeleted  <> 1
    
    AND a.isdeleted  <> 1 
    AND a.eventStart IS NOT NULL 
    and r.isdeleted  <> 1
    and p.isdeleted  <> 1
    AND a.eventStart >= CURDATE()
	 AND p.projdate IS null and p.userid = #userid#
GROUP BY p.audprojectID 
         </cfquery>
<cfif #dbug# is "Y"><cfoutput>#x.recordcount#<BR></cfoutput></cfif>
<cfloop query="x">


<cfquery datasource="#dsn#" name="update"  >
UPDATE audprojects
    SET projdate = <cfqueryparam cfsqltype="cf_sql_date" value="#x.new_projdate#" />
    
    
    where audprojectid = <cfqueryparam cfsqltype="cf_sql_integer" value="#x.audprojectID#" />

    </cfquery>
    
 

</cfloop>

<cfquery datasource="#dsn#" name="y"  >
SELECT p.audprojectID,max(a.eventStart) AS new_projDate 
FROM events a 

INNER JOIN audroles r ON r.audroleid = a.audroleid
    
INNER JOIN audprojects p on p.audprojectid = r.audprojectid

WHERE r.isDeleted  <> 1
    
    AND a.isdeleted  <> 1
    AND a.eventStart IS NOT NULL 
    and r.isdeleted  <> 1
    and p.isdeleted  <> 1
	 AND p.projdate IS null and p.userid = #userid#
GROUP BY p.audprojectID 
</cfquery>
<cfif #dbug# is "Y"><cfoutput>#y.recordcount#<BR></cfoutput></cfif>

<cfloop query="y">


<cfquery datasource="#dsn#" name="update"  >
UPDATE audprojects
    SET projdate = <cfqueryparam cfsqltype="cf_sql_date" value="#y.new_projdate#" />
    
    
    where audprojectid = <cfqueryparam cfsqltype="cf_sql_integer" value="#y.audprojectID#" />

    </cfquery>
    
 

</cfloop>



<cfquery datasource="#dsn#" name="z"  >
SELECT p.audprojectID,CAST(p.audprojectdate AS DATE) AS new_projDate 
FROM audprojects p 

WHERE p.isdeleted <> 1
AND p.projdate IS null  and p.userid = #userid#

</cfquery>

<cfif #dbug# is "Y"><cfoutput>#z.recordcount#<BR></cfoutput></cfif>
<cfloop query="z">


<cfquery datasource="#dsn#" name="update"  >
UPDATE audprojects
    SET projdate = <cfqueryparam cfsqltype="cf_sql_date" value="#z.new_projdate#" />
    
    
    where audprojectid = <cfqueryparam cfsqltype="cf_sql_integer" value="#z.audprojectID#" />

    </cfquery>
    
 

</cfloop>

    <cfif #dbug# is "Y"><cfoutput>#now()#<BR></cfoutput></cfif>



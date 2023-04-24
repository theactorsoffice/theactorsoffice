<CFINCLUDE template="/include/remote_load.cfm" />

<cfparam name="hide_completed" default="N" />


<cfquery datasource="#dsn#" name="sysActive">
    SELECT
    fc.suID
    ,fc.contactid
    ,fc.userid
    ,fc.suStartDate
    ,fc.suenddate
    ,fc.suStatus
    ,s.systemName
    ,s.systemdescript
    ,s.systemtype
    ,s.systemscope
    ,s.systemid
    ,s.recordname

    FROM fusystemusers fc
    INNER JOIN fusystems s ON s.systemID = fc.systemID
    WHERE fc.contactID = #currentid#
    AND fc.userID = #session.userid#

<cfif #hide_completed# is "Y">
    
    AND fc.suStatus <> 'Completed'
    
    </cfif>

    ORDER BY fc.suStatus
</cfquery>
        
      
   <cfparam name="idlist" default="0" /> 


    <CFINCLUDE template="/include/remote_load.cfm" />

    <cfquery name="FindUser" datasource="#dsn#">
        SELECT
        u.userid
        ,u.recordname
        ,u.userFirstName
        ,u.userLastName
        ,u.userEmail
        ,u.contactid
        ,u.userRole
        ,u.calstarttime
        ,u.calendtime
        ,u.avatarname
        ,u.IsBetaTester
        ,u.defRows
        
        
        ,u.contactid AS userContactID
        ,u.tzid
        FROM taousers u
        WHERE u.userid = '#session.userid#'
    </cfquery>
  <cfquery name="update" datasource="#dsn#">
      Update contactdetails_tbl
      set isdeleted = 1
      where contactid in (#idlist#)
</cfquery>

<cflocation url="/app/contacts/" addtoken="no" />
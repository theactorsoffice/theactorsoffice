<CFINCLUDE template="/include/remote_load.cfm" />
<cfquery datasource="#dsn#" name="reldetails">
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
    WHERE fc.suid = #suid#
</cfquery>
<cfoutput>
<cfset old_systemscope="#reldetails.systemscope#" />
</cfoutput>
<cfquery datasource="#dsn#" name="findscope_old">
    SELECT * FROM contactitems WHERE valuecategory = 'Tag' AND valuetext = 'Casting Director' AND contactid = #contactid# AND itemstatus = 'Active'
</cfquery>
<cfquery datasource="#dsn#" name="findscope" maxrows="1">
    SELECT *

    FROM contactitems

    WHERE valuecategory = 'Tag' AND contactid = #contactid# AND itemstatus = 'Active' and valuetext in (
    SELECT tagname AS valuetext from tags_user WHERE userid = #userid# and tagtype = 'C')
</cfquery>

<cfif #findscope.recordcount# is "1">

    <cfset new_systemscope="Casting Director" />

    <cfelse>
        <cfset new_systemscope="Industry" />

</cfif>
<cfif #suid# is not "0">
    <CFOUTPUT>
        <CFSET OLD_SYSTEMTYPE="#RELDETAILS.SYSTEMTYPE#" />
    </CFOUTPUT>
    <cfelse>
        <CFSET OLD_SYSTEMTYPE="None" />

</cfif>
<CFOUTPUT>OLD: #OLD_SYSTEMTYPE#<br>NEW: #NEW_SYSTEMTYPE# </CFOUTPUT>



<cfif "#OLD_SYSTEMTYPE#" is not "#new_systemtype#">


    <!-- Close existing system -->


    <cfif #OLD_SYSTEMTYPE# is not "None">


        <cfquery datasource="#dsn#" name="close">
            update fusystemusers
            set isdeleted = 1
            where suid = #suid#
        </cfquery>

        <cfquery datasource="#dsn#" name="close2">
            update funotifications
            set isdeleted = 1
            where suid = #suid#
        </cfquery>
    </cfif>


    <cfif #new_systemtype# is not "None">


        <cfquery datasource="#dsn#" name="FindSystem">

            Select * from fusystems where systemtype =
            <cfqueryparam cfsqltype="cf_sql_varchar" value="#new_systemtype#" /> and systemscope =
            <cfqueryparam cfsqltype="cf_sql_varchar" value="#new_systemscope#" />
        </cfquery>
        
        
              <cfquery datasource="#dsn#" name="FindSystemOld">
                Select * from fusystems where systemtype =
            <cfqueryparam cfsqltype="cf_sql_varchar" value="#old_systemtype#" /> and systemscope =
            <cfqueryparam cfsqltype="cf_sql_varchar" value="#old_systemscope#" />
        </cfquery>
        
        <cfoutput>
        findsystem.systemid: #findsystem.systemid#<BR>
        findsystemold.systemid: #findsystemold.systemid#<BR>
        
        </cfoutput>
 
        <cfif #findsystem.recordcount# is "1">

            <cfset systemid=findsystem.systemid />
<cfset systemid_old =findsystemold.systemid />
            
            <CFIF #SYSTEMID# IS "">
            <CFSET SYSTEMID = 0 />
            </CFIF>
            
                <CFIF #SYSTEMID_old# IS "">
            <CFSET SYSTEMID_old = 0 />
            </CFIF>
            
            
              <cfoutput>
      systemid: #systemid#<BR>
        systemid_old: #systemid_old#<BR>
   
        </cfoutput>
                     <cfif #systemid# is "3" and #systemid_old# is not "3">
            
                
<cfquery datasource="#dsn#" name="InsertNote"  >
INSERT INTO noteslog (userid,contactid,noteDetails,isPublic,eventid)
VALUES (<cfqueryparam cfsqltype="cf_sql_integer" value="#userid#" />
    ,<cfqueryparam cfsqltype="cf_sql_integer" value="#contactid#" />
    ,<cfqueryparam cfsqltype="cf_sql_longvarchar" value="Moved to Maintenance Track." />
    ,<cfqueryparam cfsqltype="cf_sql_integer" value="1" />
    ,<cfqueryparam cfsqltype="cf_sql_integer" value="0" />)
</cfquery>
                note Added!
            
            </cfif>
                  
                  
            <cfinclude template="/include/add_system.cfm" />

         


        </cfif>








    </cfif>






</cfif>


<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), " \")#" />
<cfinclude template="/include/bigbrotherinclude.cfm" />

<cflocation url="/app/contact/?contactid=#contactid#" />
 

<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="RPG"  >
    SELECT
    a.appname
    ,a.appAuthor
    ,c.compname
    ,p.pgname
    ,a.appId
    ,a.appDescription
    ,a.appLogoName
    ,a.colorTopBar
    ,a.colorLeftSideBar
    ,c.compid
    ,c.compDir
    ,c.compTable
    ,c.compowner
    ,c.compIcon
    ,c.menuYN
    ,c.menuOrder
    ,c.compInner
    ,c.compRecordName
    ,c.compActive
    ,p.pgid
    ,p.pgDir
    ,p.pgTitle
    ,p.pgHeading
    ,p.pgFilename
    ,p.datatables_YN
    ,p.fullcalendar_YN
    ,p.editable_YN
    ,p.newdatatables_YN
    ,p.pk
    ,p.update_type
    FROM pgpages p
    INNER JOIN pgcomps c ON c.compID = p.compID
    INNER JOIN pgapps a ON a.appID = c.appid
    WHERE p.pgid = '#rpgid#'
</cfquery>

<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="RPGFields"  >
    SELECT
    a.appname
    ,c.compname
    ,p.pgname
    ,f.fname
    ,f.num_min
    ,f.num_max
    ,f.required_yn
    ,a.appId
    ,a.appName
    ,a.appDescription
    ,a.appLogoName
    ,a.colorTopBar
    ,a.colorLeftSideBar
    ,c.compid
    ,c.compDir
    ,c.compTable
    ,c.compowner
    ,c.compIcon
    ,c.menuYN
    ,c.menuOrder
    ,c.compInner
    ,c.compRecordName
    ,c.compActive
    ,p.pgid
    ,p.pgDir
    ,p.pgTitle
    ,p.pgHeading
    ,p.pgFilename
    ,p.datatables_YN
    ,p.fullcalendar_YN
    ,p.editable_YN
    ,p.newdatatables_YN
    ,p.pk
    ,f.fieldid
    ,f.pgid
    ,f.tableSelect
    ,f.ftype
    ,f.ftypefull
    ,f.update_yn
    ,f.updatename
    ,f.updatetype
    ,f.fkey
    ,p.update_type
    FROM pgpages p
    INNER JOIN pgcomps c ON c.compID = p.compID
    INNER JOIN pgapps a ON a.appID = c.appid
    left join pgfields f on f.pgid = p.pgid
    WHERE p.pgid = '#rpgid#' and f.update_yn = 'y'
</cfquery>

<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="RPGResults"  >
    SELECT
    a.appname
    ,c.compname
    ,p.pgname
    ,f.fname
    ,f.required_yn
        ,f.num_min
    ,f.num_max
    ,a.appId
    ,a.appName
    ,a.appDescription
    ,a.appLogoName
    ,a.colorTopBar
    ,a.colorLeftSideBar
    ,c.compid
    ,c.compDir
    ,c.compTable
    ,c.compowner
    ,c.compIcon
    ,c.menuYN
    ,c.menuOrder
    ,c.compInner
    ,c.compRecordName
    ,c.compActive
    ,p.pgid
    ,p.pgDir
    ,p.pgTitle
    ,p.pgHeading
    ,p.pgFilename
    ,p.datatables_YN
    ,p.fullcalendar_YN
    ,p.editable_YN
    ,p.newdatatables_YN
    ,p.pk
    ,f.fieldid
    ,f.pgid
    ,f.tableSelect
    ,f.ftype
    ,f.ftypefull
    ,f.update_yn
    ,f.updatename
    ,f.updatetype
    ,f.fkey
    ,p.update_type
    FROM pgpages p
    INNER JOIN pgcomps c ON c.compID = p.compID
    INNER JOIN pgapps a ON a.appID = c.appid
    left join pgfields f on f.pgid = p.pgid
    WHERE p.pgid = '#rpgid#' and f.results_yn = 'y'
</cfquery>

<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="RPGkey"  >
    SELECT
  f.fname, f.ftype
    FROM pgpages p
    INNER JOIN pgcomps c ON c.compID = p.compID
    INNER JOIN pgapps a ON a.appID = c.appid
    left join pgfields f on f.pgid = p.pgid
    WHERE p.pgid = '#rpgid#' AND f.updatename = 'ID'
</cfquery>

<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="RPGAdd"  >
    SELECT
    a.appname
    ,c.compname
    ,p.pgname
    ,f.fname
    ,f.required_yn
    ,f.num_min
    ,f.num_max
    ,a.appId
    ,a.appName
    ,a.appDescription
    ,a.appLogoName
    ,a.colorTopBar
    ,a.colorLeftSideBar
    ,c.compid
    ,c.compDir
    ,c.compTable
    ,c.compowner
    ,c.compIcon
    ,c.menuYN
    ,c.menuOrder
    ,c.compInner
    ,c.compRecordName
    ,c.compActive
    ,p.pgid
    ,p.pgDir
    ,p.pgTitle
    ,p.pgHeading
    ,p.pgFilename
    ,p.datatables_YN
    ,p.fullcalendar_YN
    ,p.editable_YN
    ,p.newdatatables_YN
    ,p.pk
    ,f.fieldid
    ,f.pgid
    ,f.tableSelect
    ,f.ftype
    ,f.ftypefull
    ,f.update_yn
    ,f.add_yn
    ,f.updatename
    ,f.updatetype
    ,f.fkey
    ,p.update_type
    FROM pgpages p
    INNER JOIN pgcomps c ON c.compID = p.compID
    INNER JOIN pgapps a ON a.appID = c.appid
    left join pgfields f on f.pgid = p.pgid
    WHERE p.pgid = '#rpgid#' and f.add_yn = 'y'
</cfquery>

<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="RPGUpdate"  >
    SELECT
    a.appname
    ,c.compname
    ,p.pgname
    ,f.fname
        ,f.num_min
    ,f.num_max
    ,f.required_yn
    ,a.appId
    ,a.appName
    ,a.appDescription
    ,a.appLogoName
    ,a.colorTopBar
    ,a.colorLeftSideBar
    ,c.compid
    ,c.compDir
    ,c.compTable
    ,c.compowner
    ,c.compIcon
    ,c.menuYN
    ,c.menuOrder
    ,c.compInner
    ,c.compRecordName
    ,c.compActive
    ,p.pgid
    ,p.pgDir
    ,p.pgTitle
    ,p.pgHeading
    ,p.pgFilename
    ,p.datatables_YN
    ,p.fullcalendar_YN
    ,p.editable_YN
    ,p.newdatatables_YN
    ,p.pk
    ,f.fieldid
    ,f.pgid
    ,f.tableSelect
    ,f.ftype
    ,f.ftypefull
    ,f.update_yn
    ,f.add_yn
    ,f.updatename
    ,f.updatetype
    ,f.fkey
    ,p.update_type
    FROM pgpages p
    INNER JOIN pgcomps c ON c.compID = p.compID
    INNER JOIN pgapps a ON a.appID = c.appid
    left join pgfields f on f.pgid = p.pgid
    WHERE p.pgid = '#rpgid#' and f.update_yn = 'y'
</cfquery>



<cfset fid = RPGKey.fname />

<cfset fidtype = RPGKey.ftype />

        <cfif #fidtype# is "integer">
            
            <cfset fidsqltype = "CF_SQL_INTEGER" />
        
        <cfelseif #fidtype# is "text">
            
            <cfset fidsqltype = "CF_SQL_VARCHAR" />
            
        <cfelseif #fidtype# is "date">
            
            <cfset fidsqltype = "CF_SQL_DATE" />
            
        <cfelseif #fidtype# is "datetime">
            
            <cfset fidsqltype = "CF_SQL_TIMESTAMP" />
            
        <cfelseif #fidtype# is "time">
            
            <cfset fidsqltype = "CF_SQL_TIME" />
            
        </cfif>

<cfif #RPG.RecordCount# is "1">
    
    
        
        
    
  
    
    <cfset rpg_compid = RPG.compid />
    <cfset rpg_compname = RPG.compname /> 
    <cfset rpg_compDir = RPG.compDir />c
    <cfset rpg_compTable = RPG.compTable />
    <cfset rpg_compowner = RPG.compowner />
    
    <!--- Page variables --->    
    
    <cfset rpg_pgid = RPG.pgid />
    <cfset rpg_pgname = RPG.pgname />    
    <cfset rpg_pgDir = RPG.pgDir />
    <cfset rpg_pgTitle = RPG.pgTitle />
    <cfset rpg_pgHeading = RPG.pgHeading />
    <cfset rpg_pgFilename = RPG.pgFilename />


    <cfoutput>
  
    <cfset rpgTitle = "#rpg_pgTitle#" />
    </cfoutput>
</cfif>
 

<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" /><cfinclude template="/include/bigbrotherinclude.cfm" /> 

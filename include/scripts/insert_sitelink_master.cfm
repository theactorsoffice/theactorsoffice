<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="x"  >
SELECT sitename,siteurl,typeicon AS siteicon, 1 AS sitetypeid FROM actinglinks WHERE siteid NOT IN (2,3,8)
</cfquery>

<cfloop query="x">
    

<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="insert"  >
Insert into sitelinks_master (sitename,siteurl,siteicon,sitetypeid) values ('#x.sitename#','#x.siteurl#','#x.siteicon#',#x.sitetypeid#)
</cfquery>


</cfloop>

<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="y"  >
SELECT sitename,siteurl,typeicon AS siteicon, 2 AS sitetypeid FROM actinglinks WHERE siteid  IN (2,3,8)
</cfquery>

<cfloop query="y">
    

<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="insert"  >
Insert into sitelinks_master (sitename,siteurl,siteicon,sitetypeid) values ('#y.sitename#','#y.siteurl#','#y.siteicon#',#y.sitetypeid#)
</cfquery>


</cfloop>
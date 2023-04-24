<cfparam name="dbug" default="N" />
 
<CFINCLUDE template="/include/remote_load.cfm" />
<cfquery name="audtypes_sel" datasource="#dsn#">
SELECT audtypeid as id,audtype as name,audcategories FROM audtypes WHERE   isdeleted = 0 ORDER BY audtype
</cfquery>
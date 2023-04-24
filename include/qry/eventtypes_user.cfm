<cfparam name="userid" default="0" />

<cfif #isdefined('session.userid')#>

<cfset userid = session.userid />
    
</cfif>
<CFINCLUDE template="/include/remote_load.cfm" />
<cfquery name="eventtypes_user"  datasource="#dsn#"    >
SELECT id,eventtypename,eventtypedescription,recordname,iscustom, eventtypecolor 
    FROM eventtypes_user 
    WHERE userid = #userid#
    ORDER BY eventtypename
    
 
</cfquery>

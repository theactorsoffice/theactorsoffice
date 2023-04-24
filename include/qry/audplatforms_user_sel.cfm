<cfparam name="dbug" default="N" />

<cfset tname="audplatforms_user" />
<cfset fid="audplatformid" />
<cfset fname="audplatform" />
<cfset orderby="audplatform" />
<cfset new_userid = cookie.userid />

<cfquery name="Audplatforms_user_sel" datasource="#dsn#">
    SELECT audplatformid as ID, audplatform as NAME
    FROM audplatforms_user 
    WHERE 0=0
    
 
    and userid = <cfqueryparam value="#new_userid#" cfsqltype="cf_sql_integer" />
 
    ORDER BY audplatform
</cfquery>


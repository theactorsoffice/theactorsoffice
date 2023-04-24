<cfparam name="dbug" default="N" />
<cfset new_userid = userid />
<cfset tname="audtones_user" />
<cfset fid="toneid" />
<cfset fname="tone" />
<cfset orderby="tone" />

<cfinclude template="/include/qry/select_cat_user_query.cfm" />


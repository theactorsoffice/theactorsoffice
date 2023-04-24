<cfparam name="dbug" default="N" />

<cfset tname="audnetworks_user" />
<cfset fid="networkid" />
<cfset fname="network" />
<cfset orderby="network" />
<cfset new_userid = cookie.userid />

<cfinclude template="/include/qry/select_cat_user_query.cfm" />


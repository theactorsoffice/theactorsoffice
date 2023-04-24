<cfparam name="newpnids" default="" />

<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="del"   >
DELETE from pgpanels_user_xref where userid = #session.userid#
</cfquery>

<cfset newuserid = session.userid />


<cfif  #newpnids# is not "">
<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="pgpanels"  >
select pnid from pgpanels where pnid in (#newpnids#)
</cfquery>

<cfloop query="pgpanels">

<cfset newpnid = pgpanels.pnid />

<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="insert"  >
Insert into pgpanels_user_xref (pnid,userid) values (#newpnid#,#newuserid#)
</cfquery>


</cfloop>



</cfif>






    


<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" /><cfinclude template="/include/bigbrotherinclude.cfm" /> 

<cflocation url="/app/myaccount/?t4=1" />   

<cfparam name="newpnids" default="" />

<CFINCLUDE template="/include/remote_load.cfm" />




<cfquery datasource="#dsn#" name="x"   >
update pgpanels_user
    set isvisible = 0
    WHERE userid = #userid#  

</cfquery>


<cfquery datasource="#dsn#" name="pgpanels"  >
update pgpanels_user 
set isvisible = 1
where userid = #userid# and pnid in (#new_isvisible#)
</cfquery>





<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" /><cfinclude template="/include/bigbrotherinclude.cfm" /> 

<cflocation url="/app/myaccount/?t1=1" />   

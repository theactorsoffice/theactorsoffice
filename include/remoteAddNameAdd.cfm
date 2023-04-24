<CFINCLUDE template="/include/remote_load.cfm" />
<cfquery datasource="#dsn#" name="add"   result="result">
        INSERT INTO contactdetails (userid,contactfirst,contactlast) VALUES (#session.userid#,'#contactFirst#','#contactLast#');
</cfquery>

<cfset currentid=result.generated_key />

<cfset contactid=result.generated_key />

<cfset select_userid = session.userid />
<cfset select_contactid = currentid />
<cfinclude template="/include/scripts/folder_setup.cfm" />



<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" /><cfinclude template="/include/bigbrotherinclude.cfm" /> 

 
<cflocation url="/app/contact/?contactid=#contactid#&ctaction=view" />
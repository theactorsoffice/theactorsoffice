<CFINCLUDE template="/include/remote_load.cfm" />

<cfparam name="ver" default="" />

<cfquery name="find" datasource="#dsn#" >
Select * from sitelinks_user where userid = #userid# and sitename = '#new_sitename#'
</cfquery>

<cfif #find.recordcount# is not "0">
<cfset ver = find.recordcount />

</cfif>


<cfset preurl = "https://" />
<cfif #left(new_siteurl,4)# is "http">

<cfelse>

    <cfoutput>
    <cfset new_siteurl = "#preurl##new_siteurl#" /> 
    </cfoutput>
    
</cfif>
 
<cfquery name="add" datasource="#dsn#" result="queryResult">
    INSERT INTO sitelinks_user (sitename, siteurl, userid, sitetypeid, IsCustom<cfif #ver# is not "">, ver</cfif>)
    VALUES ('#new_sitename#', '#new_siteurl#', #userid#, #new_sitetypeid#, 1<cfif #ver# is not "">, #ver#</cfif>)
</cfquery>

<!-- Get the ID of the last inserted record -->
<cfset new_id = queryResult.GENERATED_KEY>

<!-- Now, lastInsertedId contains the ID of the newly inserted record -->

<cfinclude template="/include/customicon_finder.cfm" />



<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" /><cfinclude template="/include/bigbrotherinclude.cfm" /> 

<cflocation url="/app/myaccount/?t1=1&target_id=#target_id#" />   

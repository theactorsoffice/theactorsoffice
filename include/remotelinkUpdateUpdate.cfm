<CFINCLUDE template="/include/remote_load.cfm" />

<cfparam name="deletelink" default="0" /> 
<cfparam name="ver" default="" />
 
<cfquery name="find" datasource="#dsn#" >
Select * from sitelinks_user where userid = #userid# and sitename = '#new_sitename#' and id <> #id#
</cfquery>

<cfif #find.recordcount# is not "0">
<cfset ver = find.recordcount />
     <cfelse>
       <cfquery name="update" datasource="#dsn#" >
UPDATE sitelinks_user_tbl
SET ver = NULL
 
WHERE id = #id#
         </cfquery>
         
</cfif>
 
    <cfif #left(new_siteurl,8)# is "https://" >
    
        <cfset corrected_new_siteurl =  new_siteurl />
        
    <cfelseif #left(new_siteurl,7)# is "http://">
        
         <cfset corrected_new_siteurl =  new_siteurl />
        
    <cfelse>
    
        <cfset corrected_new_siteurl =  'https://' & new_siteurl />
        
        
    </cfif>
 

<cfquery name="update" datasource="#dsn#" >
UPDATE sitelinks_user_tbl
SET siteurl = '#corrected_new_siteurl#'
    <cfif #deletelink# is "1">
    ,isdeleted = 1
    </cfif>
     <cfif #new_iscustom# is "1">  
    ,sitename = '#new_sitename#'
    </cfif>
    <cfif #ver# is not "">
    ,ver = #ver#
    </cfif>
WHERE id = #id#
</cfquery>

   


<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" /><cfinclude template="/include/bigbrotherinclude.cfm" /> 
	
	<cflocation url="/app/myaccount/?t1=1&target_id=#target_id#" />    

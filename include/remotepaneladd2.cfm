<CFINCLUDE template="/include/remote_load.cfm" />

<cfparam name="new_siteypename" default="" />


<cftransaction>
<cfquery name="find" datasource="#dsn#" >
SELECT * FROM sitetypes_user WHERE userid = #userid# and sitetypename = '#new_sitetypename#'
</cfquery>

<cfif #find.recordcount# is  "0">
    
    

    <cfset new_pnTitle = new_sitetypename />

    <cfquery name="add_sitetype" datasource="#dsn#" result="result" >    
    INSERT INTO `sitetypes_user_tbl` (`siteTypeName`, `siteTypeDescription`, `userid`, `IsDeleted`) 
    VALUES ('#new_siteTypeName#', '', #userid# , 0);
    </cfquery>
    
    <cfset new_sitetypeid = result.generated_key />
    
    <cfquery name="findit" datasource="#dsn#" maxrows="1" >
SELECT * FROM sitetypes_user WHERE sitetypeid = #new_sitetypeid#
</cfquery>
    
    <Cfset new_pntitle = findit.pntitle />

    <cfquery name="Findtotal" datasource="#dsn#"  maxrows="1">  
     Select p.pnOrderno + 1 as new_pnOrderNo
        
        from pgpanels_user p 
 
        where p.userid = #userid#
        order by p.pnOrderno desc
    </cfquery> 
    

    <cfquery name="add" datasource="#dsn#"  result="PN">    
    INSERT INTO pgpanels_user (pnTitle,pnFilename,pnorderno,pncolxl,pncolMd,pnDescription,IsDeleted,IsVisible,userid)
    VALUES ('#new_pnTitle#','mylinks_user.cfm',#Findtotal.new_pnOrderNo#,3,3,'',0,1,#userid#)
    </cfquery>    

    <cfset new_pnid = PN.generated_key />
      <cfquery name="add" datasource="#dsn#"> 
    update sitetypes_user
    set pnid = #new_pnid# where sitetypeid = #new_sitetypeid#
               </cfquery>
 
</cfif>

<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" />

<cfinclude template="/include/bigbrotherinclude.cfm" /> 
    
    </cftransaction>

<cfif #pgrtn# is "P">
 
<cflocation url="/app/myaccount/?t1=1&target_id=#new_sitetypeid#" /> 
    
    
</cfif>

<cfif #pgrtn# is "D">
 

    <cflocation url="/app/myaccount/?t1=1&target_id=#new_sitetypeid#" /> 
    
</cfif>
<cfif #pgrtn# is "z">

<cflocation url="/app/dashboard_new/" /> 
    
</cfif>

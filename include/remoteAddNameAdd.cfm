<CFINCLUDE template="/include/remote_load.cfm" />

<cfparam name="refer_contact_id" default="" />

<cfquery datasource="#dsn#" name="add"   result="result">
        INSERT INTO contactdetails (userid
        
        
        ,contactfullname

        <cfif #contactbirthday# is not "">
,contactbirthday

        </cfif>
        
        <cfif #refer_contact_id# is not "">
,refer_contact_id

        </cfif>
        
              <cfif #contactmeetingdate# is not "">
,contactmeetingdate

        </cfif>
        
        ,contactmeetingloc
        ,contactPronoun
        ) 
        
        
        
        VALUES (#session.userid#,'#contactFullName#'
        
        
           <cfif #contactbirthday# is not "">

           ,<cfqueryparam cfsqltype="CF_SQL_DATE"  value="#contactbirthday#" />


        </cfif>

 <cfif #refer_contact_id# is not "">
,<cfqueryparam cfsqltype="CF_SQL_INTEGER"  value="#refer_contact_id#" />
</cfif>
             <cfif #contactmeetingdate# is not "">

           ,<cfqueryparam cfsqltype="CF_SQL_DATE"  value="#contactmeetingdate#" />


        </cfif> 

          ,<cfqueryparam cfsqltype="CF_SQL_VARCHAR"  value="#contactmeetingloc#" />
              ,<cfqueryparam cfsqltype="CF_SQL_VARCHAR"  value="#contactPronoun#" />
        
        );
</cfquery>

<cfset currentid=result.generated_key />

<cfset contactid=result.generated_key />

<cfset select_userid = session.userid />
<cfset select_contactid = currentid />
<cfinclude template="/include/scripts/folder_setup.cfm" />



<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" /><cfinclude template="/include/bigbrotherinclude.cfm" /> 

 
<cflocation url="/app/contact/?contactid=#contactid#&ctaction=view" />
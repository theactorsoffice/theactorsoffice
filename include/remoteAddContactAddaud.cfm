<CFINCLUDE template="/include/remote_load.cfm" />

<cfparam name="deleteitem" default="0" /> 
 <cfparam name="valuetext" default="" /> 
 <cfparam name="contactsuffix" default="" /> 
 <cfparam name="src" default="" /> 
 <cfparam name="birthday_DD" default="" /> 
 <cfparam name="birthday_MM" default="" /> 
 <cfparam name="contactPronoun" default="" /> 
 <cfparam name="contactmeetingdate" default="" />
 <cfparam name="contactmeetingloc" default="" />
 <cfparam name="new_systemtype" default="None" /> 
 <cfparam name="company" default="" />
 <cfparam name="company_new" default="" />

	<cfquery name="add" datasource="#dsn#" result="result">
        INSERT INTO contactdetails_tbl (userid,contactfirst,contactlast) VALUES (#session.userid#,'#TRIM(contactfirst)#','#trim(contactlast)#')
</cfquery>
    <cfset currentid=result.generated_key />
       <cfset contactid=result.generated_key />







 <cfif #new_tag# is not "">

            <cfloop list="#new_tag#" index="tag">
              <cfquery name="insert" datasource="#dsn#">
        INSERT INTO CONTACTITEMS (CONTACTID,VALUETYPE,VALUECATEGORY,VALUETEXT,ITEMSTATUS)
        VALUES (#CONTACTID#,'Tags','Tag','#tag#','Active')
            </cfquery>
            
</cfloop>
            </cfif>

 <cfif #workemail# is not "">
                <cfquery name="insert" datasource="#dsn#">
        INSERT INTO CONTACTITEMS (CONTACTID,VALUETYPE,VALUECATEGORY,VALUETEXT,ITEMSTATUS)
        VALUES (#CONTACTID#,'Business','Email','#workemail#','Active')
            </cfquery> 
       
     
</cfif>

 <cfif #workphone# is not "">
             <cfquery name="insert" datasource="#dsn#">
        INSERT INTO CONTACTITEMS (CONTACTID,VALUETYPE,VALUECATEGORY,VALUETEXT,ITEMSTATUS)
        VALUES (#CONTACTID#,'Work','Phone','#Workphone#','Active')
            </cfquery> 
     
</cfif>

 <cfif #company# is not "" and #company# is not "Custom">
             <cfquery name="insert" datasource="#dsn#">
        INSERT INTO CONTACTITEMS (CONTACTID,VALUETYPE,VALUECATEGORY,valuecompany,ITEMSTATUS)
        VALUES (#CONTACTID#,'Company','Company','#Company#','Active')
            </cfquery> 
     


</cfif>
 <cfif #company_new# is not "">
     <cfquery name="insert" datasource="#dsn#">
        INSERT INTO CONTACTITEMS (CONTACTID,VALUETYPE,VALUECATEGORY,valuecompany,ITEMSTATUS)
        VALUES (#CONTACTID#,'Company','Company','#Company_new#','Active')
            </cfquery> 
</cfif>


<cfset select_contactid = contactid />
<cfset select_userid = session.userid />
<cfinclude template="/include/contactfolder_setup.cfm" >

        <cfquery name="add_cd" datasource="#dsn#">
    INSERT IGNORE INTO `audcontacts_auditions_xref`
SET `audprojectid` = #audprojectid#,
`contactid` = #CONTACTID#;
    </cfquery>


<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" /><cfinclude template="/include/bigbrotherinclude.cfm" /> 
	
 
            
         <cflocation url="/app/audition/?audprojectid=#audprojectid#&secid=175" />    
          
	

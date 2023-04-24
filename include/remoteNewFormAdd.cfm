<CFINCLUDE template="/include/remote_load.cfm" />

<cfinclude template="rpg_load.cfm" />

<cfparam name="dbug" default="Y" />

<cfparam name="t1" default="0" />

<cfparam name="t2" default="0" />

<cfparam name="t3" default="0" />

<cfparam name="t4" default="0" />

<cfparam name="contactid" default="0" />


<cfscript>
new_tablename = rpg.comptable
newformfields = valuelist(RPGAdd.fname)
</cfscript>
<cfoutput>
new_tablename: #new_tablename#<BR>
newformfields: #valuelist(RPGAdd.fname)#
/app/#pgDir#/?contactid=#contactid#&t1=#t1#&t2=#t2#&t3=#t3#&t4=#t4# 
</cfoutput>
    

    
<CFINSERT DATASOURCE="#dsn#"
    TABLENAME="#new_tablename#" formfields="#newformfields#"
   >
    
  <cfif #rpgid# is "8">
     <cfquery name="find" datasource="#dsn#" maxrows="1">
         Select userid from taousers order by userid desc limit 1
      </cfquery>
      
      <cfset select_userid = find.userid />
      
      <cfinclude template="/include/user_setup.cfm" />
      
    </cfif>
    
    

<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" /><cfinclude template="/include/bigbrotherinclude.cfm" /> 
	
	<cflocation url="/app/#pgDir#/?contactid=#contactid#&t1=#t1#&t2=#t2#&t3=#t3#&t4=#t4#" />

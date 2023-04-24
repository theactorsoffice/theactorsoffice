<CFINCLUDE template="/include/remote_load.cfm" />

<cfinclude template="rpg_load.cfm" />

<cfparam name="OldValue" default="" />

<cfparam name="Recordname" default="" />

<cfparam name="NewValue" default="" />

<cfparam name="updatename" default="" />

<cfparam name="recid" default="0" />

<cfparam name="updatedetails" default="" />

<cfparam name="loginname" default="" />

 

<cfparam name="t1" default="0" />

<cfparam name="t2" default="0" />

<cfparam name="t3" default="0" />

<cfparam name="t4" default="0" />

<cfparam name="contactid" default="0" />






<cfoutput>
    


    <cfparam name="userid" default="#userid#" />

    <cfparam name="compid" default="#rpg_compid#" />

    <cfparam name="compTable" default="#rpg_comptable#" />

    <cfparam name="recname" default="#fid#" />

    <cfparam name="compName" default = "#rpg_compname#" />
    
    


</cfoutput>


    <cfquery name="delete" datasource="#dsn#">
#trim(dqry)#
    </cfquery>
    
    
<cfif #rpgid# is "40">
  <cfquery name="del" datasource="#dsn#" >  
update funotifications_tbl 
SET isdeleted = 1 
where isdeleted = 0  and suid NOT IN (SELECT suid FROM fusystemusers)
</cfquery>



</cfif>
    
    
<cfoutput>
 
<cfset returnpage = "/app/#rpg_compDir#/" />
 
 </cfoutput>
         
      

 


 


<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" />
<cfinclude template="/include/bigbrotherinclude.cfm" /> 

      <cflocation url="/app/#pgDir#/?contactid=#contactid#&t1=#t1#&t2=#t2#&t3=#t3#&t4=#t4#" />

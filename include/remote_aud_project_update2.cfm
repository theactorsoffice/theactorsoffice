<CFINCLUDE template="/include/remote_load.cfm" />

<cfif  #new_toneid# is "Custom">

    <cfif #Custom# is not ""> 
  <cfquery name="insert" datasource="#dsn#" result="result">
INSERT INTO audtones_user (tone,audcatid,userid)
VALUES ('#Custom#',#audcatid#,#userid#)
    </cfquery>
    
        <cfset new_toneid = result.generatedkey>
            <Cfelse><cfset  new_tone_id = old_toneid />
</cfif>
</cfif>  
        
        
        
        
        <cfif  #new_networkid# is "CustomNetwork">

    <cfif #CustomNetwork# is not "">  
  <cfquery name="insert" datasource="#dsn#" result="resultz">
INSERT INTO audnetworks_user_tbl (network,audcatid,userid)
VALUES ('#CustomNetwork#',#audcatid#,#userid#)
    </cfquery>
    
        <cfset new_networkid = resultz.generatedkey>
            <Cfelse><cfset  new_networkid = old_networkid />
</cfif>
</cfif>  


 <cfset new_audprojectid = audprojectid />
  <cfquery name="find_new" datasource="#dsn#" >
select * from audcontacts_auditions_xref where audprojectid = #audprojectid# and contactid = #new_contactid#
    </cfquery>

    

    <cfif #find_new.recordcount# is "0">
<cfinclude template="/include/qry/audcontacts_auditions_xref_ins.cfm" />


    </cfif>

<cfif old_contactid neq new_contactid >




  <cfquery name="del" datasource="#dsn#" >
delete from audcontacts_auditions_xref where audprojectid = #audprojectid# and contactid = #old_contactid#
    </cfquery>

 
</cfif>
        

<cfinclude template="/include/qry/audprojects_upd.cfm" />



 
 
  <cfoutput>
     <cfset returnurl = "/app/audition/?audprojectid=#audprojectid#&secid=#secid#" />
     </cfoutput>
 
	 <cflocation url="#returnurl#" >

 


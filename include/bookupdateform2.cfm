<cfinclude template="/include/remote_load.cfm" />

 

<cfquery name="audlocations_ins" datasource="#dsn#"   >
 UPDATE audroles 
    SET audroleid = #new_audroleid#
    
    <cfif #new_incometypeid# is not "">,incometypeid = #new_incometypeid#</cfif> 
    <cfif #new_payrate# is not "">,payrate = #new_payrate#</cfif>  
    <cfif #new_netincome# is not "">,netincome = #new_netincome#</cfif> 
    <cfif #new_buyout# is not "">,buyout = #new_buyout#</cfif> 
        <cfif #new_paycycleid# is not "">,paycycleid = #new_paycycleid#</cfif> 
    where audroleid = #new_audroleid#;
    </cfquery> 

 
     <cfoutput>
     <cfset returnurl = "/app/audition/?audprojectid=#audprojectid#&eventid=#eventid#&secid=181&focusid=#focusid#" />
     </cfoutput>
 
 
	 
	 <cflocation url="#returnurl#" >

 

<CFINCLUDE template="/include/remote_load.cfm" />
<cfparam name="isvisible" default="0" />


    <cfquery name="add" datasource="#dsn#"  result="PN">    
    update  sitetypes_user
   set sitetypename = <cfqueryparam cfsqltype="cf_sql_varchar" value="#new_sitetypename#" />
        where sitetypeid = <cfqueryparam cfsqltype="cf_sql_integer" value="#new_sitetypeid#" />
    </cfquery>    

  <cfquery name="updatep" datasource="#dsn#" >
      Update pgpanels_user
      set isvisible = #isvisible#
      where pnid = #pnid#
</cfquery>
      
      

 <cfquery name="x" datasource="#dsn#">
  SELECT p.pnid, p.pntitle,s.pnTitle AS correct_title
   FROM pgpanels_user p
	
	LEFT JOIN sitetypes_user s ON s.pnid = p.pnid
	 WHERE p.userid = s.userid AND p.pntitle <> s.pntitle
</cfquery>
     
     <cfloop query="x">
    <cfquery name="update" datasource="#dsn#" >
    Update pgpanels_user
        set pntitle = <cfqueryparam cfsqltype="cf_sql_varchar" value="#x.correct_title#" />
        where pnid = <cfqueryparam cfsqltype="cf_sql_integer" value="#x.pnid#" />
    </cfquery> 
     
     </cfloop>




<cfif #pgrtn# is "P">
 
<cflocation url="/app/myaccount/?t1=1&target_id=#new_sitetypeid#" /> 
    
    
</cfif>

<cfif #pgrtn# is "D">
 

    <cflocation url="/app/myaccount/?t1=1&target_id=#new_sitetypeid#" /> 
    
</cfif>
<cfif #pgrtn# is "z">

<cflocation url="/app/dashboard_new/" /> 
    
</cfif>

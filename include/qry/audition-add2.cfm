<cfoutput>
<cfset new_userid = #cookie.userid# />
</cfoutput>

     <CFINCLUDE template="/include/remote_load.cfm" />





<cfif #new_contactid# is "0" and #cdfullname# is not "">
    
    <cfquery datasource="#dsn#" name="add" result="result">
    INSERT INTO contactdetails (userid,contactfullname) 
    VALUES (#userid#,'#cdfullname#');
    </cfquery>

    <cfset new_contactid = result.generatedkey />
    
    c
    <cfquery datasource="#dsn#" name="insert"  >
        INSERT INTO CONTACTITEMS (CONTACTID,VALUETYPE,VALUECATEGORY,VALUETEXT,ITEMSTATUS)
        VALUES (#new_contactid#,'Tags','Tag','#cdtype#','Active')
    </cfquery>

</cfif>

<cfinclude template="/include/qry/audprojects_ins.cfm" />
<cfinclude template="/include/qry/audroles_ins.cfm" />
 
<cfif #isdirect# is "0">
<cfinclude template="/include/qry/auditions_ins.cfm" />



<cfquery datasource="#dsn#" name="update"  >
Update auditions set 
audlocname = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_audlocname#" maxlength="500" null="#NOT len(trim(new_audlocname))#" /> ,
audlocadd1 = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_audlocadd1#" maxlength="500" null="#NOT len(trim(new_audlocadd1))#" /> ,
audlocadd2 = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_audlocadd2#" maxlength="500" null="#NOT len(trim(new_audlocadd2))#" /> ,
audcity = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_audcity#" maxlength="500" null="#NOT len(trim(new_audlocname))#" /> , 
regionid = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_regionid#" maxlength="2" null="#NOT len(trim(new_regionid))#" /> ,
audzip = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_audzip#" maxlength="10" null="#NOT len(trim(new_audzip))#" />    
where audid = #new_audid#
</cfquery>
        
     </cfif>
<cflocation url="/app/audition/?audprojectid=#new_audprojectid#" />

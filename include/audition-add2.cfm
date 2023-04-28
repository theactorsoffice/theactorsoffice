<cfparam name="modalAnswer" default="No" />



<cfif isdefined('form.modalAnswer')>

<cfset modalAnswer = form.modalAnswer>
</cfif>


    
 
    
<cfoutput>
<cfset new_userid = #cookie.userid# />
</cfoutput>
<cfparam name="isdirect" default="0" />
     <CFINCLUDE template="/include/remote_load.cfm" />





<cfif #new_contactid# is "0" and #cdfirstname# is not "">
    
    <cfquery datasource="#dsn#" name="add" result="result">
    INSERT INTO contactdetails (userid,contactFullName) 
    VALUES (#userid#,'#cdfullname#');
    </cfquery>

    <cfset new_contactid = result.generatedkey />
    
                  <cfset select_userid=userid />

                <cfset select_contactid=new_contactid />


                <cfinclude template="/include/scripts/folder_setup.cfm" />
    
    
    <cfquery datasource="#dsn#" name="insert"  >
        INSERT INTO CONTACTITEMS (CONTACTID,VALUETYPE,VALUECATEGORY,VALUETEXT,ITEMSTATUS)
        VALUES (#new_contactid#,'Tags','Tag','#cdtype#','Active')
    </cfquery>

</cfif>
    
    
    
    
<cfif #modalAnswer# is "Yes">
    
               <cfset new_contactid=new_contactid />
           <cfset new_userid=userid />
           <cfset new_systemid=1 />
            <cfset new_suStartDate = new_audstartdate />
    

    <cfinclude template="modalansweryes.cfm" />
    
    
</cfif>    

<cfinclude template="/include/qry/audprojects_ins.cfm" />
<cfinclude template="/include/qry/audroles_ins.cfm" />

<cfif #isdirect# is not "1">
 
<cfinclude template="/include/qry/auditions_ins.cfm" />

</cfif>


        
     
<cflocation url="/app/audition/?audprojectid=#new_audprojectid#" />

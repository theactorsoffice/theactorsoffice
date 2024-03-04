<cfparam name="modalAnswer" default="No" />
<cfparam name="CustomPlatform" default="" />

<cfparam name="cdco" default="" />

<cfif isdefined('form.modalAnswer')>

<cfset modalAnswer = form.modalAnswer>
</cfif>


<cfoutput>

#cdco#<BR>
<cfset new_userid = #cookie.userid# />
</cfoutput>
<cfparam name="isdirect" default="0" />
<cfparam name="isbooked" default="0" />
     <CFINCLUDE template="/include/remote_load.cfm" />


<cfif #new_contactid# is "">
<cfset new_contactid = 0 />
</cfif>


<cfif #new_contactid# is "0" and #cdfullname# is not "">

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

        <cfif #cdco# is not "">
       <cfquery datasource="#dsn#" name="insert"  >
        INSERT INTO CONTACTITEMS (CONTACTID,VALUETYPE,VALUECATEGORY,ValueCompany,ITEMSTATUS)
        VALUES (#new_contactid#,'Company','Company','#cdco#','Active')
    </cfquery>


    </cfif>

</cfif>
    
    
    
    
<cfif #modalAnswer# is "Yes">
    
               <cfset new_contactid=new_contactid />
           <cfset new_userid=userid />
           <cfset new_systemid=1 />
            <cfset new_suStartDate = new_eventStart />
    

    <cfinclude template="modalansweryes.cfm" />
    
    
</cfif>    


 <cfoutput>#new_contactid# is "0" and #cdfullname# is not ""</cfoutput><cfabort>

<cfif #new_contactid# is "0" and #cdfullname# is not "">
    <cfoutput>#new_contactid# is "0" and #cdfullname# is not ""</cfoutput><cfabort>
    <cfquery datasource="#dsn#" name="add" result="result">
    INSERT INTO contactdetails (userid,contactfullname) 
    VALUES (#userid#,'#cdfullname#');
    </cfquery>

    <cfset new_contactid = result.generatedkey />
    
   
    <cfquery datasource="#dsn#" name="insert"  >
        INSERT INTO CONTACTITEMS (CONTACTID,VALUETYPE,VALUECATEGORY,VALUETEXT,ITEMSTATUS)
        VALUES (#new_contactid#,'Tags','Tag','#cdtype#','Active')
    </cfquery>

    <cfif #cdco# is not "">
       <cfquery datasource="#dsn#" name="insert"  >
        INSERT INTO CONTACTITEMS (CONTACTID,VALUETYPE,VALUECATEGORY,ValueCompany,ITEMSTATUS)
        VALUES (#new_contactid#,'Company','Company','#cdco#','Active')
    </cfquery>


    </cfif>

</cfif>


<cfif #new_contactid# is "0" and #cdco# is not "">

    <cfquery datasource="#dsn#" name="add" result="result">
    INSERT INTO contactdetails (userid,contactfullname) 
    VALUES (#userid#,'#cdco#');
    </cfquery>

    
    <cfset new_contactid = result.generatedkey />
    
   
    <cfquery datasource="#dsn#" name="insert"  >
        INSERT INTO CONTACTITEMS (CONTACTID,VALUETYPE,VALUECATEGORY,VALUETEXT,ITEMSTATUS)
        VALUES (#new_contactid#,'Tags','Tag','#cdtype#','Active')
    </cfquery>

        <cfquery datasource="#dsn#" name="insert"  >
        INSERT INTO CONTACTITEMS (CONTACTID,VALUETYPE,VALUECATEGORY,ValueCompany,ITEMSTATUS)
        VALUES (#new_contactid#,'Company','Company','#cdco#','Active')
    </cfquery>

</cfif>



    <cfquery name="FIND" datasource="#dsn#" maxrows="1">
        Select audplatformid from audPlatforms_user_tbl where userid = #userid# and audplatform = '#CustomPlatform#'
    </cfquery>

<cfif #new_audPlatformid# is "CustomPlatform" and #CustomPlatform# is not "" and #find.recordcount# is "0">

    <cfquery name="insert" datasource="#dsn#" result="resultx">
        INSERT INTO audPlatforms_user_tbl (audPlatform,userid)
        VALUES ('#CustomPlatform#',#userid#)
    </cfquery>

    <cfset new_audPlatformid=resultx.generatedkey>

<Cfelseif #new_audplatformid# is "CustomPlatform" and #CustomPlatform# is not "" and #find.recordcount# is "1">

    <cfset new_audPlatformid=find.audplatformid />

<Cfelseif #new_audplatformid# is "CustomPlatform" and #CustomPlatform# is "">

    <cfset new_audPlatformid=old_audplatformid />

</cfif>
      



<cfinclude template="/include/qry/audprojects_ins.cfm" />
<cfinclude template="/include/qry/audroles_ins.cfm" />

<cfif #isdirect# is not "1">
 
<cfinclude template="/include/qry/auditions_ins.cfm" />

</cfif>
<cfif #new_contactid# is not "0">

                 <cfquery name="add_cd" datasource="#dsn#">
    INSERT IGNORE INTO `audcontacts_auditions_xref`
SET `audprojectid` = #audprojectid#,
        xrefNotes = 'audition-add2.cfm',
`contactid` = #new_contactid#;
    </cfquery>
</cfif>

     
<cflocation url="/app/audition/?audprojectid=#new_audprojectid#&isnew=1" />

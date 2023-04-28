<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="FindUser"  >
    SELECT
    u.userid
    ,u.userFirstName
    ,u.recordname
    ,u.userLastName
    ,u.userEmail
    ,u.contactid
    ,u.userRole
    ,u.contactid AS userContactID
    FROM taousers u
    WHERE u.userid = #userid#
</cfquery>


<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="INSERT"   result="result">
    INSERT INTO `uploads` (userid)
    values (#userid#)
</cfquery>
  

    <cfset new_uploadid = result.generatedkey>
        
        
<cfoutput><cfset cUploadFolder = "d:\home\theactorsoffice.com\media-#host#\users\#FindUser.Recordname#" /></cfoutput>

	<CFIF not DirectoryExists("#cUploadFolder#")>

        <CFDIRECTORY directory="#cUploadFolder#" action="create">

    </CFIF>
        
        
<cffile action="upload" filefield="form.file" destination="#cUploadFolder#\#new_uploadid#.csv" nameconflict="MAKEUNIQUE" />
        
<cffile action="read" file="#cUploadFolder#\#new_uploadid#.csv" variable="csvfile">
    
    <cfset n = 0>
    <cfloop index="index" list="#csvfile#" delimiters="#chr(10)##chr(13)#"> 
        <cfoutput>
        <cfset n = #n# + 1 >
            </cfoutput>
            
    <cfif #n# is not "1">
    <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="importcsv"   > 
         INSERT INTO contactsimport (fname,mname,lname,tag,email_1_type,email_1,email_2_type,email_2,phone_1_type,phone_1,phone_2_type,phone_2,address_type,street,streetExtend,city,state,zip,country,target_YN,uploadid) 
         VALUES 
                 
            (
        
             <CFTRY>
                <cfqueryparam cfsqltype="cf_sql_varchar" value="#listgetAt('#index#',1, ',' ,'true')#" />,
             <CFCATCH TYPE="any" >
    'NULL', 
        </CFCATCH> 
            
        </CFTRY>
                 
             <CFTRY>
                <cfqueryparam cfsqltype="cf_sql_varchar" value="#listgetAt('#index#',2, ',' ,'true')#" />,
               <CFCATCH TYPE="any" >
    'NULL', 
        </CFCATCH> 
            
        </CFTRY>   
            
             <CFTRY>
                <cfqueryparam cfsqltype="cf_sql_varchar" value="#listgetAt('#index#',3, ',' ,'true')#" />,
                <CFCATCH TYPE="any" >
    'NULL', 
        </CFCATCH> 
            
        </CFTRY>  
              <CFTRY>                
                <cfqueryparam cfsqltype="cf_sql_varchar" value="#listgetAt('#index#',4, ',' ,'true')#" />,
                 <CFCATCH TYPE="any" >
    'NULL', 
        </CFCATCH> 
            
        </CFTRY> 
                <CFTRY>              
                <cfqueryparam cfsqltype="cf_sql_varchar" value="#listgetAt('#index#',5, ',' ,'true')#" />,
                  <CFCATCH TYPE="any" >
    'NULL', 
        </CFCATCH> 
            
        </CFTRY>
             <CFTRY>                 
                <cfqueryparam cfsqltype="cf_sql_varchar" value="#listgetAt('#index#',6, ',' ,'true')#" />,
                 <CFCATCH TYPE="any" >
    'NULL', 
        </CFCATCH> 
            
        </CFTRY> 
             <CFTRY>                 
                <cfqueryparam cfsqltype="cf_sql_varchar" value="#listgetAt('#index#',7, ',' ,'true')#" />,
                 <CFCATCH TYPE="any" >
    'NULL', 
        </CFCATCH> 
            
        </CFTRY> 
             <CFTRY>                 
                <cfqueryparam cfsqltype="cf_sql_varchar" value="#listgetAt('#index#',8, ',' ,'true')#" />,
                  <CFCATCH TYPE="any" >
    'NULL', 
        </CFCATCH> 
            
        </CFTRY>
             <CFTRY>                 
                <cfqueryparam cfsqltype="cf_sql_varchar" value="#listgetAt('#index#',9, ',' ,'true')#" />,
                  <CFCATCH TYPE="any" >
    'NULL', 
        </CFCATCH> 
            
        </CFTRY>
             <CFTRY>                 
                <cfqueryparam cfsqltype="cf_sql_varchar" value="#listgetAt('#index#',10, ',' ,'true')#" />,
                  <CFCATCH TYPE="any" >
    'NULL', 
        </CFCATCH> 
            
        </CFTRY>
             <CFTRY>                 
                <cfqueryparam cfsqltype="cf_sql_varchar" value="#listgetAt('#index#',11, ',' ,'true')#" />,
           <CFCATCH TYPE="any" >
    'NULL', 
        </CFCATCH> 
            
        </CFTRY>       
             <CFTRY>                 
                <cfqueryparam cfsqltype="cf_sql_varchar" value="#listgetAt('#index#',12, ',' ,'true')#" />,
               <CFCATCH TYPE="any" >
    'NULL', 
        </CFCATCH> 
            
        </CFTRY>   
             <CFTRY>                 
                <cfqueryparam cfsqltype="cf_sql_varchar" value="#listgetAt('#index#',13, ',' ,'true')#" />,
                <CFCATCH TYPE="any" >
    'NULL', 
        </CFCATCH> 
            
        </CFTRY>  
             <CFTRY>                 
                <cfqueryparam cfsqltype="cf_sql_varchar" value="#listgetAt('#index#',14, ',' ,'true')#" />,
          <CFCATCH TYPE="any" >
    'NULL', 
        </CFCATCH> 
            
        </CFTRY>        
             <CFTRY>                 
                <cfqueryparam cfsqltype="cf_sql_varchar" value="#listgetAt('#index#',15, ',' ,'true')#" />,
           <CFCATCH TYPE="any" >
    'NULL', 
        </CFCATCH> 
            
        </CFTRY>       
             <CFTRY>                 
                <cfqueryparam cfsqltype="cf_sql_varchar" value="#listgetAt('#index#',16, ',' ,'true')#" />,
      <CFCATCH TYPE="any" >
    'NULL', 
        </CFCATCH> 
            
        </CFTRY>            
             <CFTRY>                 
                <cfqueryparam cfsqltype="cf_sql_varchar" value="#listgetAt('#index#',17, ',' ,'true')#" />,
       <CFCATCH TYPE="any" >
    'NULL', 
        </CFCATCH> 
            
        </CFTRY>           
             <CFTRY>                 
                <cfqueryparam cfsqltype="cf_sql_varchar" value="#listgetAt('#index#',18, ',' ,'true')#" />,
        <CFCATCH TYPE="any" >
    'NULL', 
        </CFCATCH> 
            
        </CFTRY>          
             <CFTRY>                 
                <cfqueryparam cfsqltype="cf_sql_varchar" value="#listgetAt('#index#',19, ',' ,'true')#" />,
  <CFCATCH TYPE="any" >
    'NULL', 
        </CFCATCH> 
            
        </CFTRY>                
             <CFTRY>                 
                <cfqueryparam cfsqltype="cf_sql_varchar" value="#listgetAt('#index#',20, ',' ,'true')#" />,  
                 
        <CFCATCH TYPE="any" >
    'NULL', 
        </CFCATCH> 
            
        </CFTRY>          
                 
        
        
        '#new_uploadid#') 
   </cfquery> 
        </cfif>
</cfloop>    
        
 <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="x"   > 
     Select *
     from contactsimport
     where uploadid = #new_uploadid#
        </cfquery>
        
        <cfoutput>x: #x.recordcount#<BR></cfoutput>
        
<cfloop query="x"  >
    	<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="find"   maxrows="1">
    select * from contactdetails where contactfullname = '#x.fname# #x.lname#'
    </cfquery> 
    
       <cfoutput>find: #find.recordcount#<BR></cfoutput>
<cfif #find.recordcount# is "1">
                
          <cfset new_status = "Duplicate" />
            <cfset new_contactid = find.contactid />
    
       <cfoutput>result:duplicate - #find.contactid#<BR></cfoutput>
    <cfelse>
    
 	<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="add"   result="result">
        INSERT INTO contactdetails_tbl (contactFullname,userid) 
        VALUES ('#x.fname# #x.lname#',#userid#);
</cfquery>   
    
     <cfset new_status = "Added" />
        <cfset new_contactid = result.generatedkey>
    	
            <cfoutput>result: added - #new_contactid#<BR></cfoutput>
             </cfif>
            
            
            
            <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="update_contact"   >
            Update contactsimport
                set status='#new_status#',
                contactid = #new_contactid#
                where id = #x.id#
            </cfquery>
    
         
    
    
    
    
        </cfloop>    
    
    
    
     <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="tag"   > 
     Select *
     from contactsimport
     where uploadid = #new_uploadid# 
         and status = 'Added' 
         and tag <> '' and tag is not null
        </cfquery>
         
         
    <cfloop  query="tag">
      <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="tag_insert"   > 
          Insert into contactitems (contactid,valueType,valueCategory,valueText,itemstatus)
         Values (#tag.contactid#,'Tags','tag','#tag.tag#','Active')
        </cfquery>
        
        </cfloop>     
    
    
    

        
        <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="email_1"   > 
     Select *
     from contactsimport
     where uploadid = #new_uploadid# 
         and status = 'Added' 
         and tag <> '' and tag is not null
        </cfquery>
         
         
    <cfloop  query="email_1">
      <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="email_1_insert"   > 
          Insert into contactitems (contactid,valueType,valueCategory,valueText,itemstatus)
         Values (#email_1.contactid#,'#email_1.email_1_type#','Email','#email_1.email_1#','Active')
        </cfquery>
        
        </cfloop>       
            
            
            
            
            
            
            
            
            
            
            
            
            
                

        
        <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="email_2"   > 
     Select *
     from contactsimport
     where uploadid = #new_uploadid# 
         and status = 'Added' 
         and email_2 <> '' and email_2 is not null
        </cfquery>
         
         
    <cfloop  query="email_2">
      <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="email_2_insert"   > 
          Insert into contactitems (contactid,valueType,valueCategory,valueText,itemstatus)
         Values (#email_2.contactid#,'#email_2.email_2_type#','Email','#email_2.email_2#','Active')
        </cfquery>
        
        </cfloop>   
            
            
            
            
            
            
            
            
                
        <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="phone_1"   > 
     Select *
     from contactsimport
     where uploadid = #new_uploadid# 
         and status = 'Added' 
         and phone_1 <> '' and phone_1 is not null
        </cfquery>
         
         
    <cfloop  query="phone_1">
      <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="phone_1_insert"   > 
          Insert into contactitems (contactid,valueType,valueCategory,valueText,itemstatus)
         Values (#phone_1.contactid#,'#phone_1.phone_1_type#','Phone','#phone_1.phone_1#','Active')
        </cfquery>
    </cfloop>     
            
            
            
                        
            
            
                
    <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="phone_2"   > 
     Select *
     from contactsimport
     where uploadid = #new_uploadid# 
         and status = 'Added' 
         and phone_2 <> '' and phone_2 is not null
    </cfquery>
         
         
    <cfloop  query="phone_2">
    <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="phone_2_insert"   > 
    Insert into contactitems (contactid,valueType,valueCategory,valueText,itemstatus)
    Values (#phone_2.contactid#,'#phone_2.phone_2_type#','Phone','#phone_2.phone_2#','Active')
    </cfquery>
        
        </cfloop>
            
       
        
        
        
        
                        
    <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="address"   > 
     Select *
     from contactsimport
     where uploadid = #new_uploadid# 
         and status = 'Added' 
         and phone_2 <> '' and phone_2 is not null
    </cfquery>
         
         
    <cfloop  query="address">
    <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="address_insert"   > 
    Insert into contactitems (contactid,valueType,valueCategory,valueText,itemstatus)
    Values (#address.contactid#,'#address.address_type#','Address','#address.phone_2#','Active')
    </cfquery>
        
        </cfloop>
        
        
        
        
            
                
        
            
          <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="targets"   > 
     Select *
     from contactsimport
     where uploadid = #new_uploadid# 
         and target_yn = 'Y'
  
        and contactid is not null
    </cfquery>
        
        
        <Cfloop query="targets" >
        <cfset contactid = targets.contactid />
        
        <cfif #targets.tag# is "Casting Director" >
            
            <cfset systemid = 5 />
                
        <cfelse>
        
            <cfset systemid = 6 />    
            
        </cfif>
        
        
         <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="findsystem"   maxrows="1" > 
             Select * from fusystemusers where contactid = #contactid# and systemid = #systemid#
            </cfquery>
    
        <cfif #findsystem.recordcount# is "0">
            
            <cfoutput>

            <Cfset suStartDate = "#DateFormat(Now(),'yyyy-mm-dd')#"/>
            <Cfset currentStartDate = "#DateFormat(Now(),'yyyy-mm-dd')#" />
            </cfoutput>   

            <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="addSystem"    result="result">
            INSERT INTO fuSystemUsers (systemID,contactID,userID,suStartDate)
            VALUES (#systemID#,#contactID#,#userid#,'#suStartDate#')
            </cfquery> 

                <cfset NewSUID = result.generatedkey>
                    
                    
            <!-- Select all of the actions of that system  -->
        
<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="addDaysNo"   >
SELECT
 s.systemID
,s.systemName
,s.SystemType
,s.SystemScope
,s.SystemDescript
,s.SystemTriggerNote
,a.actionID
,a.actionNo
,a.actionDetails
,a.actionTitle
,a.navToURL
,au.actionDaysNo
,au.actionDaysRecurring
,a.actionNotes
,a.actionInfo
,a.IsUnique
FROM fusystems s
INNER JOIN fuactions a ON s.systemid = a.systemid
    NNER JOIN actionusers au on au.actionid = a.actionid
WHERE a.systemID = #systemID#
    and au.actionDaysNo is NOT null
    
 and au.userid = #session.userid#
ORDER BY a.actionNo
</cfquery>
    
<cfloop query="addDaysNo" >
            
            <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="checkUnique"   >
            SELECT a.actionID       
                
            FROM funotifications n

                    INNER JOIN fusystemusers f ON f.suID = n.suID

                    INNER JOIN fusystems s ON s.systemID = f.systemID

                    INNER JOIN fuactions a ON a.actionID = n.actionID
                
                    INNER JOIN fuActionLinks l on l.actionlinkid = a.actionlinkid
        
            WHERE f.contactID = #contactid# 
                AND a.IsUnique = 1 
                AND a.ActionTitle = '#addDaysNo.actionTitle#'
                AND a.isUnique = #adddaysNo.IsUnique#
                
            LIMIT 1
            </cfquery>
        
        <cfif #checkunique.recordcount# is "0" >
 
            <!-- for every action, calculate the start date based on the actionDaysNo field and the current date -->
            
            <cfset notstartdate = dateAdd('d', actionDaysNo, currentstartdate)   />
            
            <cfif notstartdate lte currentstartdate >
            
                <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="addNotification"    result="result">
                    INSERT INTO funotifications (actionid,userid,suID,notstartdate)
                    VALUES (#addDaysNo.actionID#,#userid#,#NewSuid#,'#DateFormat(notstartdate,'yyyy-mm-dd')#')
                </cfquery>  
                
            <cfelse>
          
                <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="addNotification"    result="result">
                    INSERT INTO funotifications (actionid,userid,suID,notstartdate,notstatus)
                    VALUES (#addDaysNo.actionID#,#userid#,#NewSuid#,'#DateFormat(notstartdate,'yyyy-mm-dd')#','Pending')
                </cfquery> 
            
            </cfif>
                
        </cfif>
           
        </cfloop>
    
            
    </cfif>
    
        
</Cfloop>
        
        <cfinclude template="/include/scripts/primary_fix.cfm" />
            <cflocation url="/app/contacts-import/?uploadid=#new_uploadid#"   >
            
            
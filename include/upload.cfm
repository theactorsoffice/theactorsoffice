<cfset userid = session.userid />
<CFINCLUDE template="/include/remote_load.cfm" />

    <cfset currentURL = cgi.server_name />
    <cfset host = ListFirst(currentURL, ".") />
    


 <cfquery datasource="#dsn#" name="FindUser"  >
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
    WHERE u.userid = #session.userid#
</cfquery>


 <cfquery datasource="#dsn#" name="INSERT"   result="result">
    INSERT INTO `uploads` (userid)
    values (#userid#)
</cfquery>


<cfset new_uploadid=result.generatedkey>


    <cfoutput>

        <cfset cUploadFolder="C:\home\theactorsoffice.com\wwwroot\#host#-subdomain\media-#host#\users\#finduser.userid#" />
    </cfoutput>

    <CFIF not DirectoryExists("#cUploadFolder#")>

        <CFDIRECTORY directory="#cUploadFolder#" action="create">

    </CFIF>

    <cffile action="upload" filefield="form.file" destination="#cUploadFolder#\" nameconflict="MAKEUNIQUE" />

 
        
 


    <!--- read the spreadsheet data into a query object --->
    <cfspreadsheet action="read" sheetname="TAO Import Template" src="#cUploadFolder#\#cffile.serverfile#" query="importdata" columnnames="FirstName,LastName,Tag1,Tag2,Tag3,BusinessEmail,PersonalEmail,WorkPhone,MobilePhone,HomePhone,Company,Address,Address2,City,State,Zip,Country,contactMeetingDate,contactMeetingLocation,Birthday,website,Notes" headerrow="1" />

    <!--- create a variable to store the codes of products that could not be imported --->
    <cfset failedimports="" />

    <!--- loop through the query starting with the first row containing data (row 2) --->
    <cfloop query="importdata" startrow="2">
        <!--- check row contains valid data (all fields must contain a value and price must be numeric) --->

        <Cfif LEN(importdata.FirstName) gt 0>



              <cfquery datasource="#dsn#" name="find">
                INSERT INTO `contactsimport` (`uploadid`,`fname`, `lname`, `tag1`, `tag2`,`tag3`,`business_email`, `personal_email`, `work_phone`, `mobile_phone`, `home_phone`, `company`, `address`, `address_second`, `city`, `state`, `zip`, `country`


       
                <cfif #importdata.contactMeetingDate# is not ""> , `contactMeetingDate`</cfif>
                <cfif #importdata.contactMeetingLocation# is not ""> ,`contactMeetingLoc`</cfif>
                <cfif #importdata.birthday# is not ""> , `birthday`</cfif>

                , `website`
                , `status`
                 , `notes`
                )

                VALUES
                ( 
                
     
             <cfqueryparam cfsqltype="cf_sql_integer" value="#new_uploadid#" />
                
                ,<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="100" value="#TRIM(importdata.FirstName)#" />
                
                ,<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="100"  value="#TRIM(importdata.LastName)#" />
                
                ,<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="100"  value="#TRIM(importdata.Tag1)#" />
            
                ,<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="100"  value="#TRIM(importdata.Tag2)#" />
            
                ,<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="100"  value="#TRIM(importdata.Tag3)#" />
                
                ,<cfqueryparam cfsqltype="cf_sql_varchar"  maxlength="100" value="#TRIM(importdata.BusinessEmail)#" />
                
                ,<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="100"  value="#TRIM(importdata.PersonalEmail)#" />

                ,<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="100"  value="#TRIM(importdata.WorkPhone)#" />

                ,<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="100"  value="#TRIM(importdata.MobilePhone)#" />
 
                ,<cfqueryparam cfsqltype="cf_sql_varchar"  maxlength="100" value="#TRIM(importdata.HomePhone)#" />
  
                ,<cfqueryparam cfsqltype="cf_sql_varchar"  maxlength="200" value="#TRIM(importdata.Company)#" />

                ,<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="200"  value="#TRIM(importdata.Address)#" />
                
                ,<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="100"  value="#TRIM(importdata.Address2)#" />
                
                ,<cfqueryparam cfsqltype="cf_sql_varchar"  maxlength="100" value="#TRIM(importdata.City)#" />
                
                ,<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="100"     value="#TRIM(importdata.State)#" />
                
                ,<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="100"  value="#TRIM(importdata.Zip)#" />
                
                ,<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="100"  value="#TRIM(importdata.Country)#" />
                
                <cfif #importdata.contactMeetingDate# is not "">

                    ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#dateformat(importdata.contactMeetingDate,"yyyy-mm-dd")#" />
                    
                </cfif>
                
                <cfif #importdata.contactMeetingLocation# is not "">

                    ,<cfqueryparam cfsqltype="cf_sql_varchar"  maxlength="200" value="#TRIM(importdata.contactMeetingLocation)#" />
                    
                </cfif>
                
                <cfif #importdata.birthday# is not "">

                    ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#dateformat(importdata.birthday,"yyyy-mm-dd")#" />
                    
                </cfif>

                ,<cfqueryparam cfsqltype="cf_sql_varchar"  maxlength="200" value="#TRIM(importdata.website)#" />

                ,<cfqueryparam cfsqltype="cf_sql_varchar" value="Pending" />
                  
                   ,<cfqueryparam cfsqltype="cf_sql_longvarchar"   value="#TRIM(importdata.Notes)#" />
                
                )
            </cfquery>

            
            
            


        </Cfif>

    </cfloop>








     <cfquery datasource="#dsn#" name="x"  >
        Select *
        from contactsimport
        where uploadid = #new_uploadid#
    </cfquery>

    <cfoutput>x: #x.recordcount#<BR></cfoutput>

    <cfloop query="x">
         <cfquery datasource="#dsn#" name="find"   maxrows="1">
            select * from contactdetails 
            where contactfullname = '#x.fname# #x.lname#' 
            and userid = #session.userid#
        </cfquery>

        <cfoutput>find: #find.recordcount#<BR></cfoutput>
        <cfif #find.recordcount# is "1">

            <cfset new_status="Duplicate" />
            <cfset new_contactid=find.contactid />

            <cfoutput>result:duplicate - #find.contactid#<BR></cfoutput>
             <cfquery datasource="#dsn#" name="update"  >
                UPDATE CONTACTSIMPORT
                SET status = '#new_status#'
                ,contactid = #new_contactid#
                where id = #x.id#
            </cfquery>


            <cfelse>

                 <cfquery datasource="#dsn#" name="add"   result="result">
                    INSERT INTO contactdetails_tbl (contactfullname,userid
                    <cfif #x.contactmeetingDate# is not "">,contactMeetingDate</cfif>
                    <cfif #x.contactMeetingLoc# is not "">,contactMeetingLoc</cfif>
                    <cfif #x.birthday# is not "">,contactBirthday</cfif>
                    )
                    VALUES ('#x.fname# #x.lname#',#session.userid#
                    <cfif #x.contactmeetingDate# is not "">,<cfqueryparam cfsqltype="cf_sql_date" value="#x.contactmeetingDate#">
                    </cfif>
                    <cfif #x.contactMeetingLoc# is not "">,'#x.contactMeetingLoc#'</cfif>
                    <cfif #x.birthday# is not "">,<cfqueryparam cfsqltype="cf_sql_date" value="#x.birthday#">
                    </cfif>


                    );
                </cfquery>

                <cfset new_status="Added" />
                <cfset new_contactid=result.generatedkey>
                <cfset contactid=result.generatedkey>    
                    <cfinclude template="/include/birthday_fix.cfm" />
                    
                    
                    
                    

                    <cfoutput>result: added - #new_contactid#<BR></cfoutput>










                    <cfset select_userid=session.userid />
                    <cfset select_contactid=new_contactid />
                    <cfinclude template="/include/scripts/folder_setup.cfm" />





        </cfif>
                    
                    <cfif #x.notes# is not ""> 
                        
                                <cfset select_userid=session.userid />
                    <cfset select_contactid=new_contactid />
                        
                        
                        <cfquery datasource="#dsn#" name="find_note"  >
                    SELECT * FROM noteslog WHERE userid =#select_userid# AND contactid = #select_contactid# AND noteDetails LIKE '#left(x.notes,8)#'
                        </cfquery>
              
                    <cfif #find_Note.recordcount# is "0">
                        
                           <cfquery datasource="#dsn#" name="InsertNote">
            INSERT INTO noteslog (userid,contactid,noteDetails,ispublic)
            VALUES (#select_userid#,#select_contactid#,'#trim(x.Notes)#',1)
        </cfquery>
                        
                        
                        </cfif> 
                    

</cfif>

         <cfquery datasource="#dsn#" name="update_contact"  >
            Update contactsimport
            set status='#new_status#',
            contactid = #new_contactid#
            where id = #x.id#
        </cfquery>






    </cfloop>



   
                    
                    
                    
    <cfquery datasource="#dsn#" name="tag"  >
        Select *
        from contactsimport
        where uploadid = #new_uploadid#
        and status = 'Added'
        and tag1 <> '' and tag1 is not null
    </cfquery>


    <cfloop query="tag">

	<cfset new_tag1 = tag.tag1 />

      <cfquery datasource="#dsn#" name="tag_insert"  >
       Insert into contactitems 	(contactid,valueType,valueCategory,valueText,itemstatus)

         Values (#tag.contactid#,'Tags','tag','#new_tag1#','Active')
        </cfquery>

    </cfloop>
        
        
        
        
        
        
        
        
        
            <cfquery datasource="#dsn#" name="tag"  >
        Select *
        from contactsimport
        where uploadid = #new_uploadid#
        and status = 'Added'
        and tag2 <> '' and tag2 is not null
    </cfquery>


    <cfloop query="tag">

	<cfset new_tag2 = tag.tag2 />

      <cfquery datasource="#dsn#" name="tag_insert"  >
       Insert into contactitems 	(contactid,valueType,valueCategory,valueText,itemstatus)

         Values (#tag.contactid#,'Tags','tag','#new_tag2#','Active')
        </cfquery>

    </cfloop>
                
                
                
                
        <cfquery datasource="#dsn#" name="tag"  >
        Select *
        from contactsimport
        where uploadid = #new_uploadid#
        and status = 'Added'
        and tag3 <> '' and tag3 is not null
    </cfquery>


    <cfloop query="tag">

	<cfset new_tag3 = tag.tag3 />

      <cfquery datasource="#dsn#" name="tag_insert"  >
       Insert into contactitems 	(contactid,valueType,valueCategory,valueText,itemstatus)

         Values (#tag.contactid#,'Tags','tag','#new_tag3#','Active')
        </cfquery>

    </cfloop>            
                
                
                
                





     <cfquery datasource="#dsn#" name="e"  >
        Select *
        from contactsimport
        where uploadid = #new_uploadid#
        and status = 'Added'
        and business_email <> '' and business_email is not null
    </cfquery>


    <cfloop query="e">
         <cfquery datasource="#dsn#" name="e_insert"  >
            Insert into contactitems (contactid,valueType,valueCategory,valueText,itemstatus)
            Values (#e.contactid#,'Business','Email','#e.business_email#','Active')
        </cfquery>

    </cfloop>



     <cfquery datasource="#dsn#" name="f"  >
        Select *
        from contactsimport
        where uploadid = #new_uploadid#
        and status = 'Added'
        and personal_email <> '' and personal_email is not null
    </cfquery>


    <cfloop query="f">
         <cfquery datasource="#dsn#" name="f_insert"  >
            Insert into contactitems (contactid,valueType,valueCategory,valueText,itemstatus)
            Values (#f.contactid#,'Personal','Email','#f.personal_email#','Active')
        </cfquery>

    </cfloop>




     <cfquery datasource="#dsn#" name="g"  >
        Select *
        from contactsimport
        where uploadid = #new_uploadid#
        and status = 'Added'
        and work_phone <> '' and work_phone is not null
    </cfquery>
    <cfloop query="g">
         <cfquery datasource="#dsn#" name="g_insert"  >
            Insert into contactitems (contactid,valueType,valueCategory,valueText,itemstatus)
            Values (#g.contactid#,'Work','Phone','#g.work_phone#','Active')
        </cfquery>

    </cfloop>


     <cfquery datasource="#dsn#" name="h"  >
        Select *
        from contactsimport
        where uploadid = #new_uploadid#
        and status = 'Added'
        and mobile_phone <> '' and mobile_phone is not null
    </cfquery>

    <cfloop query="h">
         <cfquery datasource="#dsn#" name="h_insert"  >
            Insert into contactitems (contactid,valueType,valueCategory,valueText,itemstatus)
            Values (#h.contactid#,'Mobile','Phone','#h.mobile_phone#','Active')
        </cfquery>

    </cfloop>

     <cfquery datasource="#dsn#" name="i"  >
        Select *
        from contactsimport
        where uploadid = #new_uploadid#
        and status = 'Added'
        and home_phone <> '' and home_phone is not null
    </cfquery>

    <cfloop query="i">
         <cfquery datasource="#dsn#" name="i_insert"  >
            Insert into contactitems (contactid,valueType,valueCategory,valueText,itemstatus)
            Values (#i.contactid#,'Home','Phone','#i.home_phone#','Active')
        </cfquery>

    </cfloop>


     <cfquery datasource="#dsn#" name="j"  >
        Select *
        from contactsimport
        where uploadid = #new_uploadid#
        and status = 'Added'
        and Company <> '' and Company is not null
    </cfquery>




    <cfloop query="j">
         <cfquery datasource="#dsn#" name="j_insert"  >
            Insert into contactitems (contactid,valueType,valueCategory,valuecompany,itemstatus)
            Values (#j.contactid#,'Company','Company','#j.company#','Active')
        </cfquery>

    </cfloop>



     <cfquery datasource="#dsn#" name="u"  >
        Select *
        from contactsimport
        where uploadid = #new_uploadid#
        and status = 'Added'
        and website <> '' and website is not null
    </cfquery>




    <cfloop query="u">
         <cfquery datasource="#dsn#" name="u_insert"  >
            Insert into contactitems (contactid,valueType,valueCategory,valuetext,itemstatus)
            Values (#u.contactid#,'Company Website','URL','#u.website#','Active')
        </cfquery>

    </cfloop>










     <cfquery datasource="#dsn#" name="address"  >
        SELECT * FROM contactsimport
        where uploadid = #new_uploadid#
        and status = 'Added'
        
    </cfquery>


    <cfloop query="address">
        
        <cfif #TRIM(address.address)# is "" and #trim(address.address_second)# is "" and #TRIM(address.city)# is "" and #trim(address.state)# is "" and #TRIM(address.zip)# is "" and #TRIM(address.country)# is "">
        
        <cfelse>
      
         <cfquery datasource="#dsn#" name="address_insert"  >
            Insert into contactitems (contactid,valueType,valueCategory
            , valuestreetaddress,valueextendedaddress,valuecity,valueregion,valuepostalcode,valuecountry


            ,itemstatus)
            Values (#address.contactid#,'Work','Address'

            ,'#address.address#','#address.address_second#','#address.city#','#address.state#','#address.zip#','#address.country#'




            ,'Active')
        </cfquery>
  </cfif>
    </cfloop>










 



            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
        
            
            
            
            
            
            
            
            
            
            
            
            
            
             <cfquery datasource="#dsn#" name="maints"  >
        Select *
        from contactsimport
        where uploadid = #new_uploadid#
        and maintenance_or_target = 'Maintenance'
        and status = 'Added'
        and contactid is not null
    </cfquery>


    <Cfloop query="maints">
        <cfoutput>
        
        <cfset maint_contactid = #maints.contactid# />

            
        </cfoutput>
        
        
        <cfif #maints.tag# is "Casting Director" or #maints.tag# is "Casting Assistant" or #maints.tag# is "Casting Associate">

            <cfset maint_systemid=3 />

            <cfelse>

                <cfset maint_systemid=4 />

        </cfif>


         <cfquery datasource="#dsn#" name="findsystem"   maxrows="1">
            Select * from fusystemusers where contactid = #maint_contactid# and systemid = #maint_systemid#
        </cfquery>

        <cfif #findsystem.recordcount# is "0">

            <cfoutput>

                <Cfset suStartDate="#DateFormat(Now(),'yyyy-mm-dd')#" />
                <Cfset currentStartDate="#DateFormat(Now(),'yyyy-mm-dd')#" />
            </cfoutput>

             <cfquery datasource="#dsn#" name="addSystem"   result="result">
                INSERT INTO fuSystemUsers (systemID,contactID,userID,suStartDate)
                VALUES (#maint_systemID#,#maint_contactID#,#userid#,'#suStartDate#')
            </cfquery>

            <cfset NewSUID=result.generatedkey>




                 <cfquery datasource="#dsn#" name="addDaysNo"  >
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
                    INNER JOIN actionusers au on au.actionid = a.actionid
                    WHERE a.systemID = #maint_systemID#
                    and au.actionDaysNo is NOT null
                     and au.userid = #userid#
                    ORDER BY a.actionNo
                </cfquery>

                <cfloop query="addDaysNo">

                     <cfquery datasource="#dsn#" name="checkUnique"  >
                        SELECT a.actionID

                        FROM funotifications n

                        INNER JOIN fusystemusers f ON f.suID = n.suID

                        INNER JOIN fusystems s ON s.systemID = f.systemID

                        INNER JOIN fuactions a ON a.actionID = n.actionID

                        INNER JOIN fuActionLinks l on l.actionlinkid = a.actionlinkid

                        WHERE f.contactID = #maint_contactid#
                        AND a.IsUnique = 1
                        AND a.ActionTitle = '#addDaysNo.actionTitle#'
                        AND a.isUnique = #adddaysNo.IsUnique#

                        LIMIT 1
                    </cfquery>

                    <cfif #checkunique.recordcount# is "0">

                        <!-- for every action, calculate the start date based on the actionDaysNo field and the current date -->

                        <cfset notstartdate=dateAdd('d', actionDaysNo, currentstartdate) />

                        <cfif notstartdate lte currentstartdate>

                             <cfquery datasource="#dsn#" name="addNotification"   result="result">
                                INSERT INTO funotifications (actionid,userid,suID,notstartdate)
                                VALUES (#addDaysNo.actionID#,#userid#,#NewSuid#,'#DateFormat(notstartdate,'yyyy-mm-dd')#')
                            </cfquery>

                            <cfelse>

                                 <cfquery datasource="#dsn#" name="addNotification"   result="result">
                                    INSERT INTO funotifications (actionid,userid,suID,notstartdate,notstatus)
                                    VALUES (#addDaysNo.actionID#,#userid#,#NewSuid#,'#DateFormat(notstartdate,'yyyy-mm-dd')#','Future')
                                </cfquery>

                        </cfif>

                    </cfif>

                </cfloop>


        </cfif>










    </Cfloop>

            
            
            
            
            
            
            









    <cflocation url="/app/contacts-import/?uploadid=#new_uploadid#">

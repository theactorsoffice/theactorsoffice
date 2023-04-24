


<cfset sunotes="Added via past date audition." />

<cfquery datasource="#dsn#" name="fin_recordname">
    select recordname from contactdetails 
    where contactid = #new_contactid# and contactid <> 0
</cfquery>

<cfif #fin_recordname.recordcount# is "1">
    
    <cfset new_contactname = fin_recordname.recordname />


           <cfquery datasource="#dsn#" name="find_fu">
               SELECT su.suid
               FROM fusystems s
               INNER JOIN fusystemusers su ON su.systemID = s.systemid

               WHERE su.suStatus = 'Active'
               AND su.userid = #new_userid#
               AND su.contactid = #new_contactid#
               AND (s.systemid = #new_systemid#

              

                   OR
                   s.systemid in (3,4)
       
               )
           </cfquery>




           <cfif #find_fu.recordcount# is "0">

               <cfoutput>

                   <Cfset suStartDate="#DateFormat(new_suStartDate,'yyyy-mm-dd')#" />
                   <Cfset currentStartDate="#DateFormat(new_suStartDate,'yyyy-mm-dd')#" />

               </cfoutput>

               <cfquery datasource="#dsn#" name="addSystem" result="result">
                   INSERT INTO fuSystemUsers (systemID,contactID,userID,suStartDate,sunotes)
                   VALUES (#new_systemid#,#new_contactid#,#new_userid#,'#suStartDate#','#sunotes#')
               </cfquery>

               <cfset NewSUID=result.generatedkey />

               <cfquery datasource="#dsn#" name="CompleteTargetSystems">
                   UPDATE fusystemusers set sustatus = 'Completed' WHERE userid = #new_userid# AND systemid IN (5,6) AND contactid = #new_contactid#;
               </cfquery>

               <cfquery datasource="#dsn#" name="sudetails">
                   select * from fusystems where systemid = #new_systemid#

               </cfquery>

               <cfquery datasource="#dsn#" name="Insert" result="result">
                   INSERT INTO `notifications`
                   (`subtitle`, `userid`, `notifUrl`, `notifTitle`, `notifType`, `contactid`, `read`,`notifdescript`)

                   VALUES ('Appointment completed. Follow-Up with #new_contactname#', #new_userid#, '/app/contact/?contactid=#new_contactid#&t4=1', 'Follow-Up System Created!','System Added', #new_contactid#, 0,'#sunotes#')
               </cfquery>

               <cfset Newnotification=result.generatedkey>

                   <cfquery datasource="#dsn#" name="addDaysNo">
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
                       ,a.uniquename
                       FROM fusystems s
                       INNER JOIN fuactions a ON s.systemid = a.systemid
                       INNER JOIN actionusers au on au.actionid = a.actionid
                       WHERE a.systemID = #new_systemid#
                       and au.userid = #new_userid#
                       and au.actionDaysNo is NOT null
                       and a.actionID is not null
                       ORDER BY a.actionNo
                   </cfquery>


                   <cfset add_action="Y" />

                   <cfset new_actionid=addDaysNo.actionid />
                   <cfset actiondaysno=numberformat(addDaysNo.actiondaysno) />
                   <cfif #adddaysno.isunique# is "1">


                       <cfquery datasource="#dsn#" name="checkUnique">
                           SELECT d.contactid from
                           contactdetails d
                           where d.#adddaysno.uniquename# = 'Y'
                           and d.contactid = #contactid# limit 1
                       </cfquery>


                       <cfif #checkunique.recordcount# is "1">
                           <cfset #add_action#="N">

                       </cfif>

                   </cfif>

                   <cfif #add_action# is "Y">

                       <cfif #actiondaysno# is "">
                           <cfset actiondaysno=0 />
                       </cfif>

                       <cfset notstartdate=dateAdd('d', actionDaysNo, currentstartdate) />

                       <cfif notstartdate lte currentstartdate>







                           <cfquery datasource="#dsn#" name="addNotification" result="result">
                               INSERT INTO funotifications (actionid,userid,suID,notstartdate,notnotes)
                               VALUES (

                               <cfqueryparam cfsqltype="cf_sql_integer" value="#new_actionid#" />,
                               <cfqueryparam cfsqltype="cf_sql_integer" value="#new_userid#" />,
                               <cfqueryparam cfsqltype="cf_sql_integer" value="#NewSuid#" />,
                               <cfqueryparam cfsqltype="cf_sql_date" value="#notstartdate#" />,
                               <cfqueryparam cfsqltype="cf_sql_varchar" value="#sunotes#" />

                               )
                           </cfquery>

                           <cfelse>

                               <cfquery datasource="#dsn#" name="addNotification" result="result">
                                   INSERT INTO funotifications (actionid,userid,suID,notstartdate,notstatus,notnotes)
                                   VALUES (
                                   <cfqueryparam cfsqltype="cf_sql_integer" value="#new_actionid#" />,
                                   <cfqueryparam cfsqltype="cf_sql_integer" value="#new_userid#" />,
                                   <cfqueryparam cfsqltype="cf_sql_integer" value="#NewSuid#" />,
                                   <cfqueryparam cfsqltype="cf_sql_date" value="#notstartdate#" />,
                                   <cfqueryparam cfsqltype="cf_sql_varchar" value="Pending" />,
                                   <cfqueryparam cfsqltype="cf_sql_varchar" value="#sunotes#" />
                                   )
                               </cfquery>

                       </cfif>

                   </cfif>

                   <cfelse>


           </cfif>
                       
                       
                       </cfif>

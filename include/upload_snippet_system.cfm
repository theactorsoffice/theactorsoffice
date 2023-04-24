
            
            
                <cfquery datasource="#dsn#" name="targets"  >
        Select *
        from contactsimport
        where uploadid = #new_uploadid#
        and maintenance_or_target = 'Target'
        and status = 'Added'
        and contactid is not null
    </cfquery>


    <Cfloop query="targets">
        
        <Cfoutput>
        <cfset target_contactid=#targets.contactid# />
</Cfoutput>
        <cfif #targets.tag# is "Casting Director" or #targets.tag# is "Casting Assistant" or #targets.tag# is "Casting Associate">

            <cfset target_systemid=5 />

            <cfelse>

                <cfset target_systemid=6 />

        </cfif>


         <cfquery datasource="#dsn#" name="findsystem"   maxrows="1">
            Select * from fusystemusers where contactid = #target_contactid# and systemid = #target_systemid#
        </cfquery>

        <cfif #findsystem.recordcount# is "0">

            <cfoutput>

                <Cfset suStartDate="#DateFormat(Now(),'yyyy-mm-dd')#" />
                <Cfset currentStartDate="#DateFormat(Now(),'yyyy-mm-dd')#" />
            </cfoutput>

             <cfquery datasource="#dsn#" name="addSystem"   result="result">
                INSERT INTO fuSystemUsers (systemID,contactID,userID,suStartDate)
                VALUES (#target_systemid#,#target_contactid#,#userid#,'#suStartDate#')
            </cfquery>

            <cfset NewSUID=result.generatedkey>


                <!-- Select all of the actions of that system  -->

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
                    WHERE a.systemID = #target_systemid#
                    and au.actionDaysNo is NOT null
                     and au.userid = #session.userid#
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

                        WHERE f.contactID = #target_contactid#
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
                                    VALUES (#addDaysNo.actionID#,#userid#,#NewSuid#,'#DateFormat(notstartdate,'yyyy-mm-dd')#','Pending')
                                </cfquery>

                        </cfif>

                    </cfif>

                </cfloop>


        </cfif>


    </Cfloop>

            
            
            
            
            
            
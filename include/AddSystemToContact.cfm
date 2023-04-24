           <!---        Variables IN:

                        new_systemid
                        new_contactid
                        new_suStartDate
            --->


            <!--- Add fuSystemUsers record --->
            <cfquery datasource="#dsn#" name="addSystem" result="result">
            INSERT INTO fuSystemUsers (systemID,contactID,userID,suStartDate,suNotes)
            VALUES ('#new_systemid#',#new_contactid#,#session.userid#,'#new_suStartDate#','Added via user batch update')
            </cfquery>

            <cfoutput>
            
            <cfset no_added = #no_added# + 1 />
                
            </cfoutput>
                
            <cfif #dbug# is "Y">
                
                    <cfoutput>
 <p>New system added.</p>
                    <p>Total added: #no_added#</p>
                        
                    </cfoutput>
                    
            </cfif>

            <!--- NewSUID: new fuSystemUsers record --->            
            <cfset NewSUID=result.generatedkey />

            <!--- Determine action items needed for new system --->  
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
            WHERE s.systemID = #new_systemid# and au.userid = #session.userid#
            ORDER BY a.actionNo
            </cfquery>
    
            <!--- Loop action items ---> 
            <cfloop query="addDaysNo">
                
            <!--- add_action "Y" by default ---> 
            <cfset add_action="Y" />

            <!--- isunique = 1: only completed once per contact  --->     
            <cfif #adddaysno.isunique# is "1">
                
                <!--- 
                        Unique types:

                        newsletter_yn
                        socialmedia_yn
                        googlealert_yn

                --->

                <cfquery datasource="#dsn#" name="checkUnique">
                    SELECT d.contactid from
                    contactdetails d
                    where d.#adddaysno.uniquename# = 'Y'
                    and d.contactid = #new_contactid# limit 1
                </cfquery>
                
                <!--- if recordcount is 1, the action has been completed. Don't add action.  --->  
                
                <cfif #checkunique.recordcount# is "1">

                    <cfset #add_action#="N" />

                    <cfoutput>
                        
                        #adddaysno.actionid# - #adddaysno.actiontitle# not added
                        
                        <BR>
                            
                    </cfoutput>

                </cfif>

            </cfif>
                
            <!--- If add_action is still Y, add the action item --->
            <cfif #add_action# is "Y">
            
                 <!--- set the start date as current date plus actiondaysno --->
                <cfset notstartdate=dateAdd('d', actionDaysNo, new_currentstartdate) />
                
               
                 <!--- if start date is today or older, add as current active notification --->
                <cfif notstartdate lte currentstartdate>

                    <cfquery datasource="#dsn#" name="addNotification" result="result">
                    INSERT INTO funotifications (actionid,userid,suID,notstartdate,notstatus)
                    VALUES (#addDaysNo.actionID#,#session.userid#,#NewSuid#,'#DateFormat(notstartdate,'yyyy-mm-dd')#','Pending')
                    </cfquery>
                    
                </cfif>
                
                <!--- if start date in the future, add "future" status --->
                <cfif notstartdate gt currentstartdate>

                    <cfquery datasource="#dsn#" name="addNotification" result="result">
                    INSERT INTO funotifications (actionid,userid,suID,notstartdate,notstatus)
                    VALUES (#addDaysNo.actionID#,#session.userid#,#NewSuid#,'#DateFormat(notstartdate,'yyyy-mm-dd')#','Pending')
                    </cfquery>

                </cfif>

            </cfif>
                
        </cfloop>
                
                
                
<CFINCLUDE template="/include/remote_load.cfm" />
<cfparam name="new_isDeleted" default="0">
    <cfparam name="new_contactid" default="">
        <cfparam name="essence" default="" />
        <cfparam name="vocaltype" default="" />
        <cfparam name="rangename" default="" />
        <cfparam name="referral" default="" />
               <cfparam name="new_opencallname" default="" /> 
        
         <cfparam name="NEW_OPENCALLID" default="0" /> 
        <cfparam name="new_submitsiteid" default="" />

        <cfparam name="dbug" default="n" />
        <cfquery name="delete" datasource="#dsn#">
            delete from audvocaltypes_audition_xref where audroleid = #new_audroleid#
        </cfquery>
        <cfquery name="delete" datasource="#dsn#">
            delete from audessences_audtion_xref where audroleid = #new_audroleid#
        </cfquery>

        <cfquery name="delete" datasource="#dsn#">
            delete from audgenres_audition_xref where audroleid = #new_audroleid#
        </cfquery>

        <cfquery name="delete" datasource="#dsn#">
            delete from audageranges_audtion_xref where audroleid = #new_audroleid#
        </cfquery>



        <cfquery name="delete" datasource="#dsn#">
            delete from audessences_audtion_xref where audroleid = #new_audroleid#
        </cfquery>




<cfif #new_opencallname# is not "">
    
            <cfquery name="findit2" datasource="#dsn#" maxrows="1">
                    SELECT *
                    FROM audopencalloptions_user
                    WHERE opencallname = '#new_opencallname#'
                    AND userid = #userid#
                </cfquery>

    <cfif #findit2.recordcount# is "1">
        
        
        <cfset new_opencallid = findit2.opencallid />
        <cfelse>
                         <cfquery name="insert" datasource="#dsn#" result="result">
                            insert into audopencalloptions_user (opencallname,userid,isdeleted) values ('#new_opencallname#',#userid#,0)
                        </cfquery>
                <cfset new_opencallid=result.generated_key />
            
            </cfif>
    
    
    
        </cfif>





        <Cfif #essence# is not "">

            <cfloop list="#essence#" index="new_essence">

                <cfquery name="findit" datasource="#dsn#" maxrows="1">
                    SELECT essenceid AS new_essenceid
                    FROM essences
                    WHERE essencename = '#new_essence#'
                    AND userid = #userid#
                    AND isdeleted = 0
                </cfquery>

                <cfif #findit.recordcount# is "1">

                    <cfset new_essenceid=findit.new_essenceid />

                    <cfelse>

                        <cfquery name="insert" datasource="#dsn#" result="result">
                            insert into essences (essenceName,userid,isdeleted) values ('#new_essence#',#userid#,0)
                        </cfquery>

                        <cfset new_essenceid=result.generated_key />

                </cfif>

                <cfquery name="insert" datasource="#dsn#">
                    insert into audessences_audtion_xref (essenceid,audroleid) values (#new_essenceid#,#new_audroleid#)
                </cfquery>

            </cfloop>

        </cfif>







<cfparam name="genre" default="" />


        <Cfif #genre# is not "">

            <cfloop list="#Genre#" index="new_genre">

                <cfquery name="findit" datasource="#dsn#" maxrows="1">
                    SELECT audgenreid
                    FROM audgenres_user
                    WHERE audgenre = '#new_genre#'
                    and userid = #userid#
                </cfquery>

                <cfif #findit.recordcount# is "1">

                    <cfset new_audgenreid=findit.audgenreid />

                    <cfquery name="insert" datasource="#dsn#">
                        insert into audgenres_audition_xref (audgenreid,audroleid) 
                        values (#new_audgenreid#,#new_audroleid#)
                    </cfquery>
                    
                    
                    
                    
                    <Cfelse>
                        
                            <cfquery name="insert" datasource="#dsn#" result="result">
                        insert into audgenres_user (audgenre,audcatid,userid) 
                        values ('#new_genre#',#new_catid#,#userid#)
                    </cfquery>
                        
                           <cfset new_audgenreid=result.generated_key />
                                     <cfquery name="insert" datasource="#dsn#">
                        insert into audgenres_audition_xref (audgenreid,audroleid) 
                        values (#new_audgenreid#,#new_audroleid#)
                    </cfquery>

                </cfif>

            </cfloop>

        </cfif>










        <cfif #vocaltype# is not "">
            
            <cfquery name="delete" datasource="#dsn#">
                delete from audvocaltypes_audition_xref where audroleid = #new_audroleid#
            </cfquery>

            <cfloop list="#vocaltype#" index="new_vocaltypeid">

                <cfquery name="insert" datasource="#dsn#">
                    insert into audvocaltypes_audition_xref (vocaltypeid,audroleid) values (#new_vocaltypeid#,#new_audroleid#)
                </cfquery>
                
            </cfloop>
            
        </cfif>

        <cfif #rangename# is not "">
            <cfquery name="delete" datasource="#dsn#">
                delete from audageranges_audtion_xref where audroleid = #new_audroleid#
            </cfquery>



            <cfloop list="#rangename#" index="new_rangeid">

                <cfquery name="insert" datasource="#dsn#">
                    insert into audageranges_audtion_xref (rangeid,audroleid) values (#new_rangeid#,#new_audroleid#)
                </cfquery>


            </cfloop>
        </cfif>








        <cfif #new_audSourceID# is "3">


            <cfif #referral# is not "">



                <cfquery datasource="#dsn#" name="findg" maxrows="1">

                    SELECT * FROM contactdetails WHERE userid = #userid# and recordname = '#referral#'

                </cfquery>


                <cfif #findg.recordcount# is "1">

                    <cfset new_contactid=findg.contactid />


                    <cfelse>










                        <cfoutput>

                            <cfset numelements=listlen(referral, " " )>
                                <!--- this will give you number of elements in fullName --->
                                <cfif numelements is 2>
                                    <cfset firstname=listfirst(referral, " " )>
                                        <!--- assign first element to firstname --->
                                        <cfset lastname=listlast(referral, " " )>
                                            <!--- assign last (2nd) element to lastname --->
                                            <cfelseif numelements gte 3>
                                                <!--- 3 or more elements in fullName --->
                                                <cfset firstname=listgetat(referral, 1, " " ) & " " & listgetat(referral, 2, " " )>
                                                    <!--- assign elements 1 and 2 to firstname --->
                                                    <cfset lastname=right(referral, len(referral) - len(firstname) - 1)>
                                                        <!--- assign the rest of the string (less the space separating 2nd and 3rd elements [the -1]) to lastname --->
                                                        <cfelse>
                                                            <!--- 0 or 1 elements in fullName --->
                                                            <cfset firstname=referral>
                                                                <cfset lastname=''>
                                </cfif>
                        </cfoutput>





                        <CFINCLUDE template="/include/remote_load.cfm" />
                        <cfquery datasource="#dsn#" name="add" result="result">
                            INSERT INTO contactdetails (userid,contactfullname) VALUES (#session.userid#,'#contactfullname#');
                        </cfquery>

                        <cfset new_contactid=result.generated_key />



                        <cfset select_userid=session.userid />
                        <cfset select_contactid=new_contactid />
                        <cfinclude template="/include/scripts/folder_setup.cfm" />



                </cfif>






            </cfif>


        </cfif>





        <cfif #new_audSourceID# is "2">


            <cfquery datasource="#dsn#" name="find_subsite" maxrows="1">
                SELECT submitsiteid as new_submitsiteid, catlist as new_catlist
                FROM audsubmitsites_user
                WHERE userid = #userid# and submitsitename = '#trim(new_submitsitename)#'
            </cfquery>

            <cfif #dbug# is "Y">
                <cfoutput>
                    SELECT submitsiteid as new_submitsiteid, catlist as new_catlist
                    FROM audsubmitsites_user
                    WHERE userid = #userid# and submitsitename = '#trim(new_submitsitename)#'<BR>


                    find_subsite.recordcount: #find_subsite.recordcount#<BR>

                </cfoutput>
            </cfif>

            <cfif #find_subsite.recordcount# is "1">

                <cfset new_submitsiteid=find_subsite.new_submitsiteid />
                <cfset new_catlist=find_subsite.new_catlist />

                <cfif #dbug# is "Y">
                    <cfoutput>
                        new_submitsiteid:#new_submitsiteid#<BR>
                        new_catlist:#new_catlist#<BR>
                    </cfoutput>
                </cfif>

                <cfif "#new_catlist#" contains "#new_catid#">
                    <cfset new_catlist=new_catlist />

                    <cfelse>
                        <cfoutput>
                            <cfset new_catlist="#new_catlist#,#new_catid#" />
                        </cfoutput>

                        <cfif #dbug# is "Y">
                            <cfoutput>

                                new_catlist:#new_catlist#<BR>
                            </cfoutput>
                        </cfif>



                        <cfquery datasource="#dsn#" name="update">
                            update audsubmitsites_user
                            set catlist = '#new_catlist#'
                            WHERE submitsiteid = #new_submitsiteid#
                        </cfquery>
                        <cfif #dbug# is "Y">
                            <cfoutput>

                                update audsubmitsites_user
                                set catlist = '#new_catlist#'
                                WHERE submitsiteid = #new_submitsiteid#<BR>
                            </cfoutput>
                        </cfif>


                </cfif>


                <cfelse>

                    <cfquery datasource="#dsn#" name="add" result="sub">
                        INSERT INTO `audsubmitsites_user_tbl` (`submitsiteName`, `userid`, `catlist`)
                        VALUES ('#trim(new_submitsitename)#', #userid#, '#new_catid#')
                    </cfquery>

                    <cfif #dbug# is "Y">
                        <cfoutput>

                            INSERT INTO `audsubmitsites_user_tbl` (`submitsiteName`, `userid`, `catlist`)
                            VALUES ('#trim(new_submitsitename)#', #userid#, '#new_catid#')<BR>
                        </cfoutput>
                    </cfif>




                    <cfset new_submitsiteid=sub.generated_key />

                    <cfif #dbug# is "Y">
                        <cfoutput>

                            new_submitsiteid: #new_submitsiteid#<BR>
                        </cfoutput>
                    </cfif>




            </cfif>





        </cfif>





        <cfif #dbug# is "Y">
            <cfabort>

        </cfif>
            
            
            
                    
        <cfif  #new_audDialectID# is "CustomDialect">

    <cfif #CustomDialect# is not "">  
  <cfquery name="insert" datasource="#dsn#" result="resultk">
INSERT INTO auddialects_user_tbl (auddialect,audcatid,userid)
VALUES ('#CustomDialect#',#new_catid#,#userid#)
    </cfquery>
    
        <cfset new_audDialectID = resultk.generatedkey>
            <Cfelse><cfset  new_dialectid = old_dialectid />
</cfif>
</cfif> 
        
        
        
        

        <cfquery name="audroles_upd" datasource="#dsn#" result="result">


            UPDATE audroles SET

            audRoleName =
            <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#new_audRoleName#" maxlength="500" null="#NOT len(trim(new_audRoleName))#" /> ,
            
                        opencallid =
            <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_opencallid#" maxlength="500" null="#NOT len(trim(new_opencallid))#" /> ,


            audRoleTypeID =
            <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audRoleTypeID#" null="#NOT len(trim(new_audRoleTypeID))#" /> ,

            charDescription =
            <cfqueryparam cfsqltype="CF_SQL_LONGVARCHAR" value="#new_charDescription#" null="#NOT len(trim(new_charDescription))#" /> ,

            audDialectID =
            <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audDialectID#" null="#NOT len(trim(new_audDialectID))#" /> ,

            audSourceID =
            <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audSourceID#" null="#NOT len(trim(new_audSourceID))#" /> ,

            <cfif #new_contactid# is not "">

                contactid =
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_contactid#" null="#NOT len(trim(new_contactid))#" /> ,

            </cfif>


            <cfif #new_submitsiteid# is not "">

                submitsiteid =
                <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_submitsiteid#" null="#NOT len(trim(new_submitsiteid))#" /> ,

            </cfif>


            isDeleted =
            <cfqueryparam cfsqltype="CF_SQL_BIT" value="#new_isDeleted#" null="#NOT len(trim(new_isDeleted))#" />

            WHERE audRoleID =
            <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audRoleID#" />
        </cfquery>

        <cfparam name="focusid" default="" />

        <cfif #focusid# is "">
            <cfoutput>
                <cfset returnurl="/app/audition/?audprojectid=#audprojectid#&secid=#secid#" />
            </cfoutput>

            <cfelse>


                <cfoutput>
                    <cfset returnurl="/app/audition/?audprojectid=#audprojectid#&secid=#secid#&focusid=#focusid#" />
                </cfoutput>


        </cfif>

        <cflocation url="#returnurl#">

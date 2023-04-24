<cfparam name="dbug" default="Y" />

<cfparam name="dbugdbug" default="YY" />

<cfparam name="select_user" default="0" />

<cfparam name="select_contactid" default="0" />

<cfparam name="select_userid" default="0" />

<cfinclude template="/include/remote_load.cfm" />

<cfset currentURL=cgi.server_name />

<cfset host=ListFirst(currentURL, "." ) />

<cfif #select_userid# is "0">

    No user <CFABORT>

</cfif>

<cfoutput>
    
    <cfset starttime="#timeformat(NOw(),'HHMMSS')#" />

    <cfset dir_media_root="C:\home\theactorsoffice.com\media-#host#" />

    <cfif #dbugdbug# is "YY">

        <p>dir_media_root: #dir_media_root#</p>

    </cfif>

    <cfset browser_media_root="/media-#host#" />

    <cfif #dbugdbug# is "YY">

        <p>browser_media_root: #browser_media_root#</p>

    </cfif>

    <cfset dir_media_root_defaults="#dir_media_root#\defaults" />

    <cfif #dbugdbug# is "YY">

        <p>dir_media_root_defaults: #dir_media_root_defaults#</p>

    </cfif>

    <cfset browser_media_root_defaults="#browser_media_root#/defaults" />

    <cfif #dbugdbug# is "YY">

        <p>browser_media_root_defaults: #browser_media_root_defaults#</p>

    </cfif>

    <cfset dir_missing_avatar_filename="#dir_media_root_defaults#\avatar.jpg" />

    <cfif #dbugdbug# is "YY">

        <p>dir_missing_avatar_filename: #dir_missing_avatar_filename#</p>

    </cfif>

    <cfset browser_missing_avatar_filename="#browser_media_root_defaults#/avatar.jpg" />

    <cfif #dbugdbug# is "YY">

        <p>browser_missing_avatar_filename: #browser_missing_avatar_filename#</p>

    </cfif>

</cfoutput>

<cfquery datasource="#dsn#" name="users">
    SELECT
    users.userid
    ,users.recordname
    ,users.userFirstName
    ,users.userLastName
    ,users.userEmail
    ,users.contactid
    ,users.userRole
    FROM taousers users
    <cfif #select_userid# is not "0">
        where users.userid = #select_userid#
    </cfif>
</cfquery>

<cfloop query="users">

    <cfoutput>

        <cfset userstatus="No Change" />

        <cfif #dbug# is "Y">

            <cfsavecontent variable="user_output">
                
                <p>User: #users.userid# - #users.userfirstname# #users.userlastname#</p>
                
            </cfsavecontent>

        </cfif>

        <cfset browser_media_root_user="#browser_media_root#/users/#users.userid#" />

        <cfif #dbugdbug# is "YY">

            <p>browser_media_root_user: #browser_media_root_user#</p>

        </cfif>

        <cfset dir_media_root_user="#dir_media_root#\users\#users.userid#" />

        <cfif #dbugdbug# is "YY">

            <p>dir_media_root_user: #dir_media_root_user#</p>

        </cfif>

        <cfset dir_user_avatar_filename="#dir_media_root_user#\avatar.jpg" />

        <cfif #dbugdbug# is "YY">

            <p>dir_user_avatar_filename: #dir_user_avatar_filename#</p>

        </cfif>

        <cfset browser_user_avatar_filename="#browser_media_root_user#/avatar.jpg" />

        <cfif #dbugdbug# is "YY">

            <p>browser_user_avatar_filename: #browser_user_avatar_filename#</p>

        </cfif>

        <cfif not DirectoryExists("#dir_media_root_user#")>

            <cfset userstatus="Fixed" />

            <cfif #dbug# is "Y">


                <cfsavecontent variable="user_output">
                    #user_output#
                    <p>Directory [#dir_media_root_user#] does not exist. Creating...</p>
                </cfsavecontent>

            </cfif>

            <cfdirectory directory="#dir_media_root_user#" action="create" />

            <cfif #dbug# is "Y">

                <cfsavecontent variable="user_output">
                    #user_output#
                    <p>Directory [#browser_user_avatar_filename#] created.</p>
                </cfsavecontent>


            </cfif>

        </cfif>

        <cfset browser_media_root_user_contacts="#browser_media_root_user#/contacts" />

        <cfif #dbugdbug# is "YY">

            <p>browser_media_root_user_contacts: #browser_media_root_user_contacts#</p>

        </cfif>

        <cfset dir_media_root_user_contacts="#dir_media_root_user#\contacts" />

        <cfif #dbugdbug# is "YY">

            <p>dir_media_root_user_contacts: #dir_media_root_user_contacts#</p>

        </cfif>

        <cfif not DirectoryExists("#dir_media_root_user_contacts#")>

            <cfset userstatus="Fixed" />

            <cfif #dbug# is "Y">

                <cfsavecontent variable="user_output">
                    #user_output#
                    <p>Directory [#dir_media_root_user_contacts#] does not exist. Creating...</p>
                </cfsavecontent>


            </cfif>

            <CFDIRECTORY directory="#dir_media_root_user_contacts#" action="create" />

            <cfif #dbug# is "Y">


                <cfsavecontent variable="user_output">
                    #user_output#
                    <p>Directory [#dir_media_root_user_contacts#] CREATED.</p>
                </cfsavecontent>


            </cfif>

        </cfif>


        <cfset browser_media_root_user_imports="#browser_media_root_user#/imports" />

        <cfif #dbugdbug# is "YY">

            <p>browser_media_root_user_imports: #browser_media_root_user_imports#</p>

        </cfif>

        <cfset dir_media_root_user_imports="#dir_media_root_user#\imports" />

        <cfif #dbugdbug# is "YY">

            <p>dir_media_root_user_imports: #dir_media_root_user_imports#</p>

        </cfif>

        <cfif not DirectoryExists("#dir_media_root_user_imports#")>

            <cfset userstatus="Fixed" />

            <cfif #dbug# is "Y">

                <cfsavecontent variable="user_output">
                    #user_output#
                    <p>Directory [#dir_media_root_user_imports#] does not exist. Creating...</p>
                </cfsavecontent>


            </cfif>

            <CFDIRECTORY directory="#dir_media_root_user_imports#" action="create">

                <cfif #dbug# is "Y">

                    <cfsavecontent variable="user_output">
                        #user_output#
                        <p>Directory [#dir_media_root_user_imports#] CREATED.</p>
                    </cfsavecontent>


                </cfif>




        </cfif>

        <cfif NOT fileExists(dir_user_avatar_filename)>

            <cfset userstatus="Fixed" />

            <cffile action="copy" source="#dir_missing_avatar_filename#" destination="#dir_media_root_user#\" />

            <cfif #dbug# is "Y">

                <cfsavecontent variable="user_output">
                    #user_output#
                    <p>default avatar moved to: #dir_media_root_user#</p>
                </cfsavecontent>


            </cfif>

        </cfif>




    </cfoutput>










    <cfquery datasource="#dsn#" name="C">
        SELECT contactid,recordname
        from contactdetails
        where userid = #users.userid#
        <cfif #select_contactid# is not "0">
            and contactid = #select_contactid#
        </cfif>
        order by contactid
    </cfquery>

    <cfif #dbug# is "Y">
        <cfoutput>
            <cfsavecontent variable="user_output">
                #user_output#
                <p> #users.recordname#: Creating folders for #c.recordcount# contacts</p>
            </cfsavecontent>
        </cfoutput>
    </cfif>

    <cfloop query="C">

        <cfoutput>


            <cfset new_contactid="#C.contactid#" />


            <cfset dir_media_root_user_contacts_folder="#dir_media_root_user_contacts#\#new_contactid#" />




            <cfif not DirectoryExists("#dir_media_root_user_contacts_folder#")>

                <cfset userstatus="Fixed" />

                <cfif #dbug# is "Y">

                    <cfsavecontent variable="user_output">
                        #user_output#
                        <p>#c.recordname# Directory [#dir_media_root_user_contacts_folder#] does not exist. Creating...</p>
                    </cfsavecontent>


                </cfif>





                <CFDIRECTORY directory="#dir_media_root_user_contacts_folder#" action="create" />
                <cfif #dbug# is "Y">

                    <cfsavecontent variable="user_output">
                        #user_output#
                        <p>Directory [#dir_media_root_user_contacts_folder#] CREATED.</p>
                    </cfsavecontent>


                </cfif>





            </cfif>





            <cfset dir_media_root_user_contacts_folder_attachements="#dir_media_root_user_contacts_folder#\attachments" />




            <cfif not DirectoryExists("#dir_media_root_user_contacts_folder_attachements#")>

                <cfset userstatus="Fixed" />


                <cfif #dbug# is "Y">
                    <cfsavecontent variable="user_output">
                        #user_output#
                        <p>#c.recordname# Directory [#dir_media_root_user_contacts_folder_attachements#] does not exist. Creating...</p>
                    </cfsavecontent>

                </cfif>

                <CFDIRECTORY directory="#dir_media_root_user_contacts_folder_attachements#" action="create" />


                <cfif #dbug# is "Y">


                    <cfsavecontent variable="user_output">
                        #user_output#
                        <p>Directory [#dir_media_root_user_contacts_folder_attachements#] CREATED.</p>
                    </cfsavecontent>


                </cfif>





            </cfif>










            <cfset dir_contact_avatar_filename="#dir_media_root_user_contacts_folder#\avatar.jpg" />

            <cfif #dbugdbug# is "YY">

                <p>dir_contact_avatar_filename: #dir_contact_avatar_filename#</p>

            </cfif>







            <cfif NOT fileExists(dir_contact_avatar_filename)>

                <cfset userstatus="Fixed" />

                <cfif #dbug# is "Y">

                    <cfsavecontent variable="user_output">
                        #user_output#
                        <p>#c.recordname# filename [#dir_missing_avatar_filename#] does not exist. Moving default...</p>
                    </cfsavecontent>



                </cfif>
                <cffile action="copy" source="#dir_missing_avatar_filename#" destination="#dir_media_root_user_contacts_folder#\" />

                <cfif #dbug# is "Y">
                    <cfsavecontent variable="user_output">
                        #user_output#
                        <p>Default contact avatar moved to: #dir_media_root_user_contacts_folder#\#dir_missing_avatar_filename#.</p>
                    </cfsavecontent>


                </cfif>




            </cfif>







        </cfoutput>


    </cfloop>
        
        
        <cfquery datasource="#dsn#" name="m">
    SELECT * FROM pgpanels_master 
</cfquery>

<cfloop query="m">

<cfquery datasource="#dsn#" name="FIND">
    SELECT * FROM pgpanels_user where userid = #select_userid# and pnFilename = '#m.pnFilename#' 
</cfquery>

    <cfif #find.recordcount# is "0">
        <cfquery datasource="#dsn#" name="insert">
      
            INSERT INTO `pgpanels_user_tbl` (`userid`,`pnTitle`, `pnFilename`, `pnOrderNo`, `pnColXl`, `pnColMd`, `pnDescription`,`IsVisible`)
            VALUES
            (#select_userid#,'#m.pntitle#', '#m.pnfilename#', #m.pnOrderNo#, #m.pnColXl#, #m.pnColMd#, '#m.pnDescription#',1);

        </cfquery>

    </cfif>
    
</cfloop>
        
        
        
        
        
        
        
        
        





    <cfquery datasource="#dsn#" name="x">
        SELECT sitetypename,sitetypedescription from sitetypes_master
    </cfquery>


    <cfloop query="x">
        
        <cfoutput>

        <cfquery datasource="#dsn#" name="find">
            Select * from sitetypes_user
            where sitetypename = '#x.sitetypename#' and userid = #select_userid#
        </cfquery>

        <cfif #find.recordcount# is "0">

            <cfset userstatus="Fixed" />

            <cfif #dbug# is "Y">

                <cfsavecontent variable="user_output">
                    #user_output#
                    <p>#users.recordname# has no custom sitetypes. Adding....</p>
                </cfsavecontent>



            </cfif>


            <cfquery datasource="#dsn#" name="insert" result="result">

                INSERT INTO `sitetypes_user` (`siteTypeName`, `siteTypeDescription`, `userid`)
                VALUES ('#x.sitetypename#','#x.sitetypedescription#',#users.userid#);

            </cfquery>
            
            
                <cfset new_sitetypeid = result.generated_key />
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            <cfoutput>
             <Cfset new_pntitle = "#x.sitetypename# Links" />
</cfoutput>
    <cfquery name="Findtotal" datasource="#dsn#"  maxrows="1">  
     Select p.pnOrderno + 1 as new_pnOrderNo
        
        from pgpanels_user p 
 
        where p.userid = #select_userid#
        order by p.pnOrderno desc
    </cfquery> 
    

    <cfquery name="add" datasource="#dsn#"  result="PN">    
    INSERT INTO pgpanels_user (pnTitle,pnFilename,pnorderno,pncolxl,pncolMd,pnDescription,IsDeleted,IsVisible,userid)
    VALUES ('#new_pnTitle#','mylinks_user.cfm',#Findtotal.new_pnOrderNo#,3,3,'',0,1,#select_userid#)
    </cfquery>    

    <cfset new_pnid = PN.generated_key />
      <cfquery name="add" datasource="#dsn#"> 
    update sitetypes_user
    set pnid = #new_pnid# where sitetypeid = #new_sitetypeid#
               </cfquery>
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            <cfsavecontent variable="user_output">
                #user_output#
                <p>INSERT INTO `sitetypes_user` (`siteTypeName`, `siteTypeDescription`, `userid`)
                    VALUES ('#x.sitetypename#','#x.sitetypedescription#',#users.userid#);</p>
            </cfsavecontent>




        </cfif>
</cfoutput>
    </cfloop>



    <cfquery datasource="#dsn#" name="x">
        SELECT genderpronoun,genderpronounplural FROM genderpronouns
    </cfquery>


    <cfloop query="x">
        
        <cfoutput>

        <cfquery datasource="#dsn#" name="find">
            Select * from genderpronouns_users
            where genderpronoun = '#x.genderpronoun#' and userid = #users.userid#
        </cfquery>

        <cfif #find.recordcount# is "0">

            <cfset userstatus="Fixed" />

            <cfif #dbug# is "Y">
                <cfsavecontent variable="user_output">
                    #user_output#
                    <p>#users.recordname# has no custom gender pronouns. Adding....</p>
                </cfsavecontent>

            </cfif>

            <cfquery datasource="#dsn#" name="insert">

                INSERT INTO `genderpronouns_users` (`genderpronoun`, `genderpronounplural`, `userid`)
                VALUES ('#x.genderpronoun#','#x.genderpronounplural#',#users.userid#);

            </cfquery>

            <cfsavecontent variable="user_output">
                #user_output#
                <p> INSERT INTO `genderpronouns_users` (`genderpronoun`, `genderpronounplural`, `userid`)
                    VALUES ('#x.genderpronoun#','#x.genderpronounplural#',#users.userid#);
                </p>
            </cfsavecontent>


        </cfif>
</cfoutput>
    </cfloop>



    <cfquery datasource="#dsn#" name="x">
        SELECT

        s.id
        ,s.sitename
        ,s.siteURL
        ,s.siteicon
        ,s.sitetypeid
        ,t.sitetypename

        FROM sitelinks_master s INNER JOIN sitetypes_master t ON t.sitetypeid = s.siteTypeid
        ORDER BY s.sitename
    </cfquery>


    <cfloop query="x">
<cfoutput>
        <cfquery datasource="#dsn#" name="find">
            Select sitetypeid from sitetypes_user
            where sitetypename = '#x.sitetypename#' and userid = #users.userid#

        </cfquery>

        <cfif #find.recordcount# is "1">

            <cfset new_sitetypeid=find.sitetypeid />

            <cfquery datasource="#dsn#" name="find2">
                Select * from sitelinks_user_tbl where sitename = '#x.sitename#' and userid = #users.userid#
            </cfquery>

            <cfif #find2.recordcount# is "0">

                <cfset userstatus="Fixed" />

                <cfif #dbug# is "Y">

                    <cfsavecontent variable="user_output">
                        #user_output#
                        <p>#users.recordname# has no custom sitelinks_user_tbl. Adding....</p>
                    </cfsavecontent>




                </cfif>



                <cfquery datasource="#dsn#" name="insert">

                    INSERT INTO `sitelinks_user_tbl` (`siteName`,`siteURL`,`siteicon`,`siteTypeid`,`userid`)
                    VALUES ('#x.sitename#','#x.siteurl#','#x.siteicon#', #new_sitetypeid#, #users.userid#);



                </cfquery>

                <cfif #dbug# is "Y">

                    <cfsavecontent variable="user_output">
                        #user_output#
                        <p>
                            INSERT INTO `sitelinks_user_tbl` (`siteName`,`siteURL`,`siteicon`,`siteTypeid`,`userid`)
                            VALUES ('#x.sitename#','#x.siteurl#','#x.siteicon#', #new_sitetypeid#, #users.userid#);
                        </p>
                    </cfsavecontent>


                </cfif>
            </cfif>
        </cfif>
</cfoutput>
    </cfloop>



    <cfquery datasource="#dsn#" name="xs">
        SELECT eventTypeName
        ,eventtypedescription
        ,eventtypecolor
        FROM eventtypes
    </cfquery>

    <cfloop query="xs">
<cfoutput>

        <cfquery datasource="#dsn#" name="find">
            SELECT eventTypeName
            ,eventtypedescription
            ,eventtypecolor
            FROM eventtypes_user
            where eventTypeName = '#xs.eventtypeName#' and userid = #users.userid#
        </cfquery>

        <cfif #find.recordcount# is "0">

            <cfset userstatus="Fixed" />

            <cfif #dbug# is "Y">

                <cfsavecontent variable="user_output">
                    #user_output#
                    <p>#users.recordname# has no custom event types. Adding....</p>
                </cfsavecontent>



            </cfif>

            <cfquery datasource="#dsn#" name="insert">
                INSERT INTO `eventtypes_user` (`eventTypeName`,`eventtypedescription`,`eventtypecolor`,`userid`)
                VALUES ('#xs.eventTypeName#', '#xs.eventtypedescription#','#xs.eventtypecolor#', #users.userid#);
            </cfquery>
            <cfif #dbug# is "Y">
                <cfsavecontent variable="user_output">
                    #user_output#
                    <p>INSERT INTO `eventtypes_user` (`eventTypeName`,`eventtypedescription`,`eventtypecolor`,`userid`)
                        VALUES ('#xs.eventTypeName#', '#xs.eventtypedescription#','#xs.eventtypecolor#', #users.userid#);</p>
                </cfsavecontent>



            </cfif>
        </cfif>
</cfoutput>
    </cfloop>



    <cfquery datasource="#dsn#" name="xs">
        SELECT actionid,actiondaysno,actiondaysrecurring from fuactions
    </cfquery>

    <cfloop query="xs">
<cfoutput>

        <cfquery datasource="#dsn#" name="find">
            SELECT * from actionusers where actionid = #xs.actionid# and userid = #users.userid#
        </cfquery>

        <cfif #find.recordcount# is "0">

            <cfset userstatus="Fixed" />

            <cfif #dbug# is "Y">
                <cfsavecontent variable="user_output">
                    #user_output#
                    <p>#users.recordname# has no custom event types. Adding....</p>
                </cfsavecontent>



            </cfif>

            <cfquery datasource="#dsn#" name="insert">
                INSERT INTO `actionusers_tbl` (`actionid`,`userid`,`actiondaysno`<cfif #xs.actiondaysrecurring# is not "">,`actiondaysrecurring`</cfif>,`IsDeleted`)
                VALUES (#xs.actionid#, #users.userid#,#xs.actiondaysno#<cfif #xs.actiondaysrecurring# is not "">,#actiondaysrecurring#</cfif>, 0);
            </cfquery>

            <cfif #dbug# is "Y">
                <cfsavecontent variable="user_output">
                    #user_output#
                    <p>INSERT INTO `actionusers_tbl` (`actionid`,`userid`,`actiondaysno`<cfif #xs.actiondaysrecurring# is not "">,`actiondaysrecurring`</cfif>,`IsDeleted`)
                        VALUES (#xs.actionid#, #users.userid#,#xs.actiondaysno#<cfif #xs.actiondaysrecurring# is not "">,#actiondaysrecurring#</cfif>, 0);</p>
                </cfsavecontent>


            </cfif>

        </cfif>
</cfoutput>
    </cfloop>

    <cfquery datasource="#dsn#" name="x">
        SELECT * FROM tags
    </cfquery>


    <cfloop query="x">
<cfoutput>
        <cfquery datasource="#dsn#" name="find">
            Select * from tags_user
            where tagname = '#x.tagname#' and userid = #users.userid#
        </cfquery>

        <cfif #find.recordcount# is "0">

            <cfset userstatus="Fixed" />

            <cfif #dbug# is "Y">

                <cfsavecontent variable="user_output">
                    #user_output#
                    <p>#users.recordname# has no custom tags_user. Adding....</p>
                </cfsavecontent>



            </cfif>

            <cfquery datasource="#dsn#" name="insert">

                INSERT INTO `tags_user` (`tagname`, `userid`, `tagtype`)
                VALUES ('#x.tagname#',#users.userid#, '#x.tagtype#');

            </cfquery>
            <cfif #dbug# is "Y">
                <cfsavecontent variable="user_output">
                    #user_output#
                    <p> INSERT INTO `tags_user` (`tagname`, `userid`, `tagtype`)
                        VALUES ('#x.tagname#',#users.userid#, '#x.tagtype#');</p>
                </cfsavecontent>



            </cfif>

        </cfif>
</cfoutput>
    </cfloop>


    <cfquery datasource="#dsn#" name="update_tags">
        UPDATE tags_user
        SET IsTeam = 1
        WHERE userid = #select_userid# and tagname IN (
        SELECT tagname FROM tags WHERE isteam = 1)
    </cfquery>

    <cfquery datasource="#dsn#" name="update_Iscasting">
        UPDATE tags_user
        SET Iscasting = 1
        WHERE userid = #select_userid# and tagname IN (
        SELECT tagname FROM tags WHERE Iscasting = 1)
    </cfquery>



    <cfquery datasource="#dsn#" name="u">
        SELECT * from taousers where userid = #select_userid#
    </cfquery>


    <cfquery datasource="#dsn#" name="x">
        SELECT typeid,valuetype,typeicon FROM itemtypes
    </cfquery>


    <cfloop query="x">
<cfoutput>
        <cfquery datasource="#dsn#" name="find">
            Select * from itemtypes_user
            where valuetype = '#x.valuetype#' and userid = #users.userid#
        </cfquery>

        <cfif #find.recordcount# is "0">

            <cfset userstatus="Fixed" />

            <cfif #dbug# is "Y">

                <cfsavecontent variable="user_output">
                    #user_output#
                    <p>#users.recordname# has no custom itemtypes_user. Adding....</p>
                </cfsavecontent>



            </cfif>

            <cfquery datasource="#dsn#" name="insert">

                INSERT INTO `itemtypes_user` (`valuetype`, `typeicon`, `userid`)
                VALUES ('#x.valuetype#','#x.typeicon#',#users.userid#);

            </cfquery>

            <cfif #dbug# is "Y">


                <cfsavecontent variable="user_output">
                    #user_output#
                    <p> INSERT INTO `itemtypes_user` (`valuetype`, `typeicon`, `userid`)
                        VALUES ('#x.valuetype#','#x.typeicon#',#users.userid#);</p>
                </cfsavecontent>




            </cfif>
        </cfif>
</cfoutput>
    </cfloop>


    <cfquery datasource="#dsn#" name="x">
        SELECT DISTINCT c.catid,i.valuetype
        FROM itemcategory c

        inner join itemcatxref x ON x.catid = c.catid

        INNER JOIN itemtypes i ON i.typeid = x.typeid

        ORDER BY c.catid,i.valuetype
    </cfquery>




    <cfloop query="x">
<cfoutput>
        <cfset new_catid=x.catid />



        <cfquery datasource="#dsn#" name="find">
            Select typeid from itemtypes_user
            where valuetype = '#x.valuetype#' and userid = #select_userid#
        </cfquery>

        <cfset new_typeid=find.typeid />



        <cfquery datasource="#dsn#" name="check">
            select * from itemcatxref_user where userid = #select_userid# and typeid = #new_typeid# and catid = #new_catid#
        </cfquery>




        <cfif #check.recordcount# is "0">

            <cfset userstatus="Fixed" />

            <cfif #dbug# is "Y">
                <p>#users.recordname# has no custom itemcatxref_user. Adding....</p>
            </cfif>

            <cfquery datasource="#dsn#" name="insert">
                INSERT INTO `itemcatxref_user` (`typeid`, `catid`, `userid`)
                VALUES (#new_typeid#,#new_catid#,#select_userid#);
            </cfquery>

            <cfif #dbug# is "Y">

                <cfsavecontent variable="user_output">
                    #user_output#
                    <p> INSERT INTO `itemcatxref_user` (`typeid`, `catid`, `userid`)
                        VALUES (#new_typeid#,#new_catid#,#select_userid#);</p>
                </cfsavecontent>



            </cfif>

        </cfif>
</cfoutput>
    </cfloop>
    
<cfoutput>

    <cfset endtime="#timeformat(NOw(),'HHMMSS')#" />

    <cfset dur=endtime - starttime />

    <cfif #dbug# is "Y">


        <cfsavecontent variable="user_output">
            #user_output#
            <p>Completed: #dur# second(s)</p>
        </cfsavecontent>

    </cfif>

    <cfif #userstatus# is "Fixed">

        <cfmail to="kevinking7135@gmail.com" from="support@theactorsoffice.com" subject="#users.recordname# Fixed" type="html">
            #user_output#

        </cfmail>


        <cfset user_output="" />

    </cfif>

    #user_output#
    </cfoutput> 

    </cfloop>
<cfparam name="dbug" default="Y" /> 
<cfparam name="select_user" default="0" />
<cfparam name="select_contactid" default="0" />
<cfparam name="select_userid" default="0" />

    <cfset currentURL = cgi.server_name />
    <cfset host = ListFirst(currentURL, ".") />
    
    <cfif #select_userid# is "0">
    No user <CFABORT>
    </cfif>
        
        
    <cfoutput>
    <cfset starttime = "#timeformat(NOw(),'HHMMSS')#" />
    
    <cfset dir_media_root="C:\home\theactorsoffice.com\media-#host#" />

    <cfif #dbug# is "Y">

        <h2>dir_media_root: #dir_media_root#</h2>

    </cfif>

    <cfset browser_media_root="/media-#host#" />

    <cfif #dbug# is "Y">

        <h2>browser_media_root: #browser_media_root#</h2>

    </cfif>



    <cfset dir_media_root_defaults="#dir_media_root#\defaults" />

    <cfif #dbug# is "Y">

        <h2>dir_media_root_defaults: #dir_media_root_defaults#</h2>

    </cfif>

    <cfset browser_media_root_defaults="#browser_media_root#/defaults" />

    <cfif #dbug# is "Y">

        <h2>browser_media_root_defaults: #browser_media_root_defaults#</h2>

    </cfif>

    <cfset dir_missing_avatar_filename="#dir_media_root_defaults#\avatar.jpg" />

    <cfif #dbug# is "Y">

        <h2>dir_missing_avatar_filename: #dir_missing_avatar_filename#</h2>

    </cfif>

    <cfset browser_missing_avatar_filename="#browser_media_root_defaults#/avatar.jpg" />

    <cfif #dbug# is "Y">

        <h2>browser_missing_avatar_filename: #browser_missing_avatar_filename#</h2>

    </cfif>
    
 
    

</cfoutput>

 <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="U"  >
    SELECT
    u.userid
    ,u.recordname
    ,u.userFirstName
    ,u.userLastName
    ,u.userEmail
    ,u.contactid
    ,u.userRole
    FROM taousers u
    <cfif #select_userid# is not "0">
    where u.userid = #select_userid#
    </cfif>
</cfquery>

        
<cfloop query="U">

    <cfoutput>
        

        <cfif #dbug# is "Y">

            <h2>User: #u.userid#</h2>

        </cfif>

        <cfset browser_media_root_user="#browser_media_root#/users/#u.userid#" />

        <cfif #dbug# is "Y">

            <p>browser_media_root_user: #browser_media_root_user#</p>

        </cfif>


        <cfset dir_media_root_user="#dir_media_root#\users\#u.userid#" />

        <cfif #dbug# is "Y">

            <p>dir_media_root_user: #dir_media_root_user#</p>

        </cfif>

        <cfset dir_user_avatar_filename="#dir_media_root_user#\avatar.jpg" />

        <cfif #dbug# is "Y">

            <p>dir_user_avatar_filename: #dir_user_avatar_filename#</p>

        </cfif>

        <cfset browser_user_avatar_filename="#browser_media_root_user#/avatar.jpg" />

        <cfif #dbug# is "Y">

            <p>browser_user_avatar_filename: #browser_user_avatar_filename#</p>

        </cfif>

        <CFIF not DirectoryExists("#dir_media_root_user#")>

            <CFDIRECTORY directory="#dir_media_root_user#" action="create">



                <h3>dir_media_root_user dir created: #browser_user_avatar_filename#</h3>


        </CFIF>

        <cfset browser_media_root_user_contacts="#browser_media_root_user#/contacts" />

        <cfif #dbug# is "Y">

            <p>browser_media_root_user_contacts: #browser_media_root_user_contacts#</p>

        </cfif>

        <cfset dir_media_root_user_contacts="#dir_media_root_user#\contacts" />

        <cfif #dbug# is "Y">

            <p>dir_media_root_user_contacts: #dir_media_root_user_contacts#</p>

        </cfif>

        <CFIF not DirectoryExists("#dir_media_root_user_contacts#")>

            <CFDIRECTORY directory="#dir_media_root_user_contacts#" action="create">


                <h3>dir_media_root_user_contacts dir created: #dir_media_root_user_contacts#</h3>



        </CFIF>


        <cfset browser_media_root_user_imports="#browser_media_root_user#/imports" />

        <cfif #dbug# is "Y">

            <p>browser_media_root_user_imports: #browser_media_root_user_imports#</p>

        </cfif>

        <cfset dir_media_root_user_imports="#dir_media_root_user#\imports" />

        <cfif #dbug# is "Y">

            <p>dir_media_root_user_imports: #dir_media_root_user_imports#</p>

        </cfif>

        <CFIF not DirectoryExists("#dir_media_root_user_imports#")>

            <CFDIRECTORY directory="#dir_media_root_user_imports#" action="create">




                <h3>dir_media_root_user_imports dir created: #dir_media_root_user_imports#</h3>



        </CFIF>

        <cfif NOT fileExists(dir_user_avatar_filename)>

            <cffile action="copy" source="#dir_missing_avatar_filename#" destination="#dir_media_root_user#\" />



            <h3>default avatar moved to: #dir_media_root_user#</h3>



        </cfif>

    </cfoutput>






     <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="C"  >
        SELECT contactid,recordname
        from contactdetails
        where userid = #u.userid#
        <cfif #select_contactid# is not "0">
        and contactid = #select_contactid#
        </cfif>
        order by contactid
    </cfquery>

    <cfif #dbug# is "Y">
        <cfoutput>
            <h3> #u.userid#: Creating folders for #c.recordcount# contacts</h3>

        </cfoutput>

    </cfif>
    <cfloop query="C">

        <cfoutput>


            <cfset new_contactid="#C.contactid#" />

            <cfif #dbug# is "Y">
                <h3>#c.recordname#: Contact ID #new_contactid#</h3>
            </cfif>

            <cfset dir_media_root_user_contacts_folder="#dir_media_root_user_contacts#\#new_contactid#" />




            <CFIF not DirectoryExists("#dir_media_root_user_contacts_folder#")>

                <CFDIRECTORY directory="#dir_media_root_user_contacts_folder#" action="create">




                    <h3>dir_media_root_user_contacts_folder dir created: #dir_media_root_user_contacts_folder#</h3>




            </cfif>



                
                
                  <cfset dir_media_root_user_contacts_folder_attachements="#dir_media_root_user_contacts_folder#\attachments" />




            <CFIF not DirectoryExists("#dir_media_root_user_contacts_folder_attachements#")>

                <CFDIRECTORY directory="#dir_media_root_user_contacts_folder_attachements#" action="create">




                    <h3>dir_media_root_user_contacts_folder_attachements dir created: #dir_media_root_user_contacts_folder_attachements#</h3>




            </cfif>

                
                
                
                
                
                
                
                
                
                
                
                

            <cfset dir_contact_avatar_filename="#dir_media_root_user_contacts_folder#\avatar.jpg" />

            <cfif #dbug# is "Y">

                <p>dir_contact_avatar_filename: #dir_contact_avatar_filename#</p>

            </cfif>







            <cfif NOT fileExists(dir_contact_avatar_filename)>

                <cffile action="copy" source="#dir_missing_avatar_filename#" destination="#dir_media_root_user_contacts_folder#\" />


                <h3>default contact avatar moved to: #dir_media_root_user_contacts_folder#</h3>



            </cfif>










        </cfoutput>


    </cfloop>

</cfloop>
        
        
        
        
        
        
        
<cfoutput><cfset endtime = "#timeformat(NOw(),'HHMMSS')#" />
    
    
    <cfset dur = endtime - starttime />
       <cfif #dbug# is "Y">  
           <h1>Completed: <cfoutput>#dur# second(s)</cfoutput></h1></cfif>
    
            </cfoutput>
        
        
        
    
        
        
         <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="users"  >
select userid from taousers 
             <cfif #select_userid# is not "0">
            where userid = #select_userid#
            </cfif>
</cfquery>

<cfloop query="users">
    
    
    

<cfset newuserid = users.userid />

 <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="panels"  >
select pnid from pgpanels
</cfquery>

<cfloop query="panels">

<cfset newpnid = panels.pnid />
    
     <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="Find"  >
    Select * from pgpanels_user_xref where pnid = #newpnid# and userid = #newuserid#
    </cfquery>
    
    <cfif #find.recordcount# is "0">
 <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="insert"  >
Insert into pgpanels_user_xref (pnid,userid) values (#newpnid#,#newuserid#)
</cfquery>
<cfif #dbug# is "Y">
   <cfoutput> PNID #newpnid# and userid #newuserid# added</cfoutput><BR>                
</cfif>
</cfif>
</cfloop>

</cfloop>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
     <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="u"  >
        SELECT * from taousers     <cfif #select_userid# is not "0">
        where userid = #select_userid#</cfif>
    </cfquery>

    <cfloop query="u">

         <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="x"  >
            SELECT sitetypename,sitetypedescription from sitetypes_master
        </cfquery>


        <cfloop query="x">
            
             <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="find"  >
            Select * from sitetypes_user 
            where sitetypename = '#x.sitetypename#' and userid = #u.userid#
            </cfquery>
            
            <cfif #find.recordcount# is "0">
            
                 <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="insert"  >
                    
                    INSERT INTO `sitetypes_user` (`siteTypeName`, `siteTypeDescription`, `userid`) 
                    VALUES ('#x.sitetypename#','#x.sitetypedescription#',#u.userid#);
          
                </cfquery>
                
                <cfoutput>           
                    INSERT INTO `sitetypes_user` (`siteTypeName`, `siteTypeDescription`, `userid`) 
                    VALUES ('#x.sitetypename#','#x.sitetypedescription#',#u.userid#);
                    
                    <BR>
                    
                    </cfoutput>
            </cfif>

        </cfloop>


    </cfloop>

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
 <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="u"  >
        SELECT * from taousers 
        <cfif #select_userid# is not "0">
    where userid = #select_userid#
    </cfif>
    </cfquery>

    <cfloop query="u">

         <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="x"  >
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
            
             <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="find"  >
                Select sitetypeid from sitetypes_user 
                where sitetypename = '#x.sitetypename#' and userid = #u.userid#

            </cfquery>
            
            <cfif #find.recordcount# is "1">
                
                <cfset new_sitetypeid = find.sitetypeid />
                
                       <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="find2"  >
            Select * from sitelinks_user_tbl where sitename = '#x.sitename#' and userid = #u.userid#
                </cfquery>
                
                <cfif #find2.recordcount# is "0">
                 <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="insert"  >
                    
                    INSERT INTO `sitelinks_user_tbl` (`siteName`,`siteURL`,`siteicon`,`siteTypeid`,`userid`) 
                    VALUES ('#x.sitename#','#x.siteurl#','#x.siteicon#', #new_sitetypeid#, #u.userid#);
                    
                    
                    
                </cfquery>
                
                <cfif #dbug# is "Y">
                <CFOUTPUT>       INSERT INTO `sitelinks_user_tbl` (`siteName`,`siteURL`,`siteicon`,`siteTypeid`,`userid`) 
                    VALUES ('#x.sitename#','#x.siteurl#','#x.siteicon#', #new_sitetypeid#, #u.userid#);</CFOUTPUT><BR>
                </cfif>
                </cfif>
            </cfif>

        </cfloop>


    </cfloop>
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
                 <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="u"  >
        SELECT * from taousers  
        </cfquery>

    <cfloop query="u">

         <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="x"  >
        SELECT eventTypeName
,eventtypedescription
,eventtypecolor
 FROM eventtypes
        </cfquery>

        <cfloop query="x">
            
            
             <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="find"  >
            SELECT eventTypeName
            ,eventtypedescription
            ,eventtypecolor
             FROM eventtypes_user
            where eventTypeName = '#x.eventtypeName#' and userid = #u.userid#
            </cfquery>
            
            <cfif #find.recordcount# is "0">
            
                 <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="insert"  >
                    INSERT INTO `eventtypes_user` (`eventTypeName`,`eventtypedescription`,`eventtypecolor`,`userid`) 
                    VALUES ('#x.eventTypeName#', '#x.eventtypedescription#','#x.eventtypecolor#', #u.userid#);
                </cfquery>
     
            </cfif>

        </cfloop>


    </cfloop>
        
        
        
        
        
        
        
        
        
        
        
        
    
     <cfquery  datasource="#dsn#"  name="u"  >
        SELECT * from taousers     
    </cfquery>

    <cfloop query="u">

         <cfquery datasource="#dsn#" name="x"  >
            SELECT toneid,
tone,
audcatid,
isDeleted
 FROM audtones
        </cfquery>


        <cfloop query="x">
            
             <cfquery datasource="#dsn#" name="find"  >
            Select * from audtones_user
            where tone = '#x.tone#' and userid = #u.userid#
            </cfquery>
            
            <cfif #find.recordcount# is "0">
            
                 <cfquery datasource="#dsn#" name="insert"  >
                    
                    INSERT INTO `audtones_user` (`tone`, `audcatid`, `userid`) 
                    VALUES ('#x.tone#','#x.audcatid#',#u.userid#);
          
                </cfquery>
                
                <cfoutput>           
                 audtones added: #x.tone# (user #u.userid#)<BR>
                </cfoutput>
            </cfif>

        </cfloop>


    </cfloop>

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
         <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="u"  >
        SELECT * from taousers  where userid = #select_userid#
    </cfquery>

    <cfloop query="u">

         <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="x"  >
        SELECT * FROM tags
        </cfquery>


        <cfloop query="x">
            
             <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="find"  >
            Select * from tags_user 
            where tagname = '#x.tagname#' and userid = #u.userid#
            </cfquery>
            
            <cfif #find.recordcount# is "0">
            
                 <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="insert"  >
                    
                    INSERT INTO `tags_user` (`tagname`,  `userid`) 
                    VALUES ('#x.tagname#',#u.userid#);
          
                </cfquery>
                
     
            </cfif>

        </cfloop>


    </cfloop>
        
        
        
        
        
        
        
        
        
         <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="update_tags"  >
        UPDATE tags_user 
            SET IsTeam = 1 
            WHERE userid = #select_userid# and tagname IN (
            SELECT tagname FROM tags WHERE isteam = 1)
        </cfquery>
        
        
        
        
         <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="u"  >
        SELECT * from taousers  where userid = #select_userid#
    </cfquery>

    <cfloop query="u">

         <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="x"  >
      SELECT typeid,valuetype,typeicon FROM itemtypes
        </cfquery>


        <cfloop query="x">
            
             <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="find"  >
            Select * from itemtypes_user 
            where valuetype = '#x.valuetype#' and userid = #u.userid#
            </cfquery>
            
            <cfif #find.recordcount# is "0">
            
                 <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="insert"  >
                    
                    INSERT INTO `itemtypes_user` (`valuetype`, `typeicon`, `userid`) 
                    VALUES ('#x.valuetype#','#x.typeicon#',#u.userid#);
          
                </cfquery>
                
     
            </cfif>

        </cfloop>


    </cfloop>

        
      
        
        
        
        
        
        
        
        
        
        
        
        
        
         <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="u"  >
        SELECT * from taousers where userid = #select_userid#
    </cfquery>

    <cfloop query="u">
        
        <cfset new_userid = u.userid />
        
           <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="x"  >
SELECT DISTINCT c.catid,i.valuetype
FROM itemcategory c

inner join itemcatxref x ON x.catid = c.catid

INNER JOIN itemtypes i ON i.typeid = x.typeid

ORDER BY c.catid,i.valuetype
        </cfquery>
   
        
 

        <cfloop query="x">
            
            <cfset new_catid = x.catid />
            
    
            
             <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="find"  >
            Select typeid from itemtypes_user
            where valuetype = '#x.valuetype#' and userid = #new_userid#
            </cfquery>
            
            <cfset new_typeid = find.typeid />
            
            
            
                   <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="check"  >
        select * from itemcatxref_user where userid = #new_userid# and typeid = #new_typeid# and catid = #new_catid#
            </cfquery>
            
            
            
            
            <cfif #check.recordcount# is "0">
            
                 <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="insert"  >
                    
                    INSERT INTO `itemcatxref_user` (`typeid`, `catid`, `userid`) 
                    VALUES (#new_typeid#,#new_catid#,#new_userid#);
          
                </cfquery>
                
     
            </cfif>

        </cfloop>


    </cfloop>


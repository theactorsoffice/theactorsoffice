 
<cfif NOT #isdefined('session.userid')# >
  
    <cflocation url="/loginform.cfm" />
</cfif>
<cfparam name="catArea_UCB" default="C" />
<cfparam name="contactid" default="0" />
 	<cfoutput>
    <cfset cal_root_dir = "c:\home\theactorsoffice.com\wwwroot\#host#-subdomain\calendar\" />

    <cfset cal_root_url = "https://#cgi.server_name#/calendar/" />
</cfoutput>
 
      
<CFINCLUDE template="/include/remote_load.cfm" />

<cfquery datasource="#dsn#" name="FindUser"  >
    SELECT
    u.userid
    ,u.recordname
    ,u.userFirstName
    ,u.userLastName
    ,u.userEmail
    ,u.contactid
    ,u.userRole
    ,u.IsBetaTester
    ,u.defRows
    ,u.defCountry
    ,u.defState
    ,u.calstarttime
    ,u.calendtime
    ,u.avatarname
    ,u.contactid AS userContactID
    ,u.tzid
 ,t.tzname
    ,u.customerid
    FROM taousers u
            LEFT join timezones t on t.tzid = u.tzid
    WHERE u.userid = #session.userid#
</cfquery>

<cfoutput>
              
    finduser.recordcount: #FindUser.recordcount#<BR>
<cfset dir_user_avatar_loc ="c:\home\theactorsoffice.com\wwwroot\#host#-subdomain\media-#host#\users\#finduser.userid#" />   

<cfset dir_user_avatar_filename ="#dir_user_avatar_loc#\avatar.jpg" />
    
<cfset browser_user_avatar_loc ="/media-#host#/users/#finduser.userid#" />  
    
<cfset browser_user_avatar_filename ="#browser_user_avatar_loc#/avatar.jpg" />
    
<cfset dir_user_imports_loc ="#dir_user_avatar_loc#\imports" />     
 
<cfset dir_contact_avatar_loc ="c:\home\theactorsoffice.com\wwwroot\#host#-subdomain\media-#host#\users\#finduser.userid#\contacts\#contactid#" /> 
    
<cfset dir_contact_avatar_filename ="#dir_contact_avatar_loc#\avatar.jpg" />
    
<cfset browser_contact_avatar_loc ="/media-#host#/users/#finduser.userid#/contacts/#contactid#" />   
    
<cfset browser_contact_avatar_filename ="#browser_contact_avatar_loc#/avatar.jpg" />
    
<cfset calendar_name3 = "#FindUser.userfirstname##FindUser.userlastname#" />
        
<cfset calendar_name2 = #REReplace(calendar_name3,"[^0-9A-Za-z ]","","all")# />
      
<cfset calendar_name = #replace(calendar_name2," ","","all")# />
        
<cfset calendar_dir = "#cal_root_dir##calendar_name#.ics" />      

<cfset calendar_url = "#cal_root_url##calendar_name#.ics" />   
       finduser.avatarname: #FindUser.avatarname#<BR>
</cfoutput>
        

        <cfif #FindUser.avatarname# is "">
            
                                                     
            

                <cfquery datasource="#dsn#" name="InsertContact"   result="result">  
update taousers
        set avatarname = '#FindUser.userfirstname#'
        where userid = #session.userid#
    </cfquery>   
            


           <cfquery datasource="#dsn#" name="FindUser"  >
    SELECT
    u.userid
    ,u.recordname
    ,u.userFirstName
    ,u.userLastName
    ,u.userEmail
    ,u.contactid
    ,u.userRole
    ,u.calstarttime
    ,u.calendtime
    ,u.avatarname
        ,u.IsBetaTester
    ,u.defRows
    ,u.defCountry
    ,u.defState
    ,u.contactid AS userContactID
    ,u.tzid
 ,t.tzname
    ,u.customerid
    FROM taousers u
            LEFT join timezones t on t.tzid = u.tzid
    WHERE u.userid = #session.userid#
</cfquery> 
            
        
        </cfif>

 
<cfif #FindUser.contactid# is "">
 <cfquery datasource="#dsn#" name="InsertContact"   result="result">  
INSERT INTO contactdetails (ContactFullName,userid,user_yn)
     values ('#finduser.userfirstname# #finduser.userlastname#',#session.userid#,'Y')
    </cfquery>
    

    <cfset new_contactid = result.generatedkey>
    <cfquery datasource="#dsn#" name="InsertContact"   result="result">  
update taousers
        set contactid = #new_contactid#
        where userid = #session.userid#
    </cfquery>     
        <cfquery datasource="#dsn#" name="FindUser"  >
    SELECT
    u.userid
    ,u.recordname
    ,u.userFirstName
    ,u.userLastName
    ,u.userEmail
    ,u.contactid
    ,u.userRole
    ,u.calstarttime
    ,u.calendtime
    ,u.avatarname
    ,u.IsBetaTester
    ,u.defRows
    ,u.defCountry
    ,u.defState
    ,u.contactid AS userContactID
    ,u.tzid
    ,t.tzname
    ,u.customerid
    FROM taousers u
            LEFT join timezones t on t.tzid = u.tzid
    WHERE u.userid = #session.userid#
</cfquery>
</cfif>

    


<cfquery datasource="#dsn#" name="FindPage"  >
    SELECT
    a.appname
    ,a.appAuthor
    ,c.compname
    ,p.pgname
    ,a.appId
    ,a.appDescription
    ,a.appLogoName
    ,a.colorTopBar
    ,a.colorLeftSideBar
    ,a.mocktoday
    ,a.mock_yn
    ,c.compid
    ,c.compDir
    ,c.compTable
    ,c.compowner
    ,c.compIcon
    ,c.menuYN
    ,c.menuOrder
    ,c.compInner
    ,c.compRecordName
    ,c.compActive
    ,p.pgid
    ,p.pgDir
    ,p.pgTitle
    ,p.pgHeading
    ,p.pgFilename
    ,p.datatables_YN
    ,p.fullcalendar_YN
    ,p.editable_YN
    ,p.newdatatables_YN
    ,p.pk
    ,p.update_type
    FROM pgpages p
    INNER JOIN pgcomps c ON c.compID = p.compID
    INNER JOIN pgapps a ON a.appID = c.appid
    WHERE p.pgDir = '#trim(thispage)#'
</cfquery>
    
        <cfoutput>  
       FindPage.recordcount: #FindPage.recordcount#<BR></cfoutput>
 

<cfquery datasource="#dsn#" name="FindFields"  >
    SELECT
    a.appname
    ,c.compname
    ,p.pgname
    ,f.fname
    ,a.appId
    ,a.appName
    ,a.appDescription
    ,a.appLogoName
    ,a.colorTopBar
    ,a.colorLeftSideBar
    ,c.compid
    ,c.compDir
    ,c.compTable
    ,c.compowner
    ,c.compIcon
    ,c.menuYN
    ,c.menuOrder
    ,c.compInner
    ,c.compRecordName
    ,c.compActive
    ,p.pgid
    ,p.pgDir
    ,p.pgTitle
    ,p.pgHeading
    ,p.pgFilename
    ,p.datatables_YN
    ,p.fullcalendar_YN
    ,p.editable_YN
    ,p.newdatatables_YN
    ,p.pk
    ,f.fieldid
    ,f.pgid
    ,f.ftype
    ,f.ftypefull
    ,f.update_yn
    ,f.updatename
    ,f.updatetype
    ,f.fkey
    ,f.num_min
    ,f.num_max
    FROM pgpages p
    INNER JOIN pgcomps c ON c.compID = p.compID
    INNER JOIN pgapps a ON a.appID = c.appid
    INNER join pgfields f on f.pgid = p.pgid
    WHERE p.pgDir = '#trim(thispage)#'
</cfquery>
      <cfoutput>  
     pgid:#findpage.pgid#<BR>
       FindFields.FindFields: #FindFields.recordcount#<BR></cfoutput>
<cfif #FindPage.RecordCount# is "1">
    
    <cfquery datasource="#dsn#" name="FindLinksT"  >
    SELECT 

    l.linkid
    ,l.linkurl
    ,l.linkname
    ,l.linktype
    ,l.link_no
    ,l.linkloc_tb
    ,l.pluginname
    ,l.rel
    ,l.hrefid


     FROM pgapplinks l

     INNER JOIN pgplugins p ON p.pluginName = l.pluginname 
     INNER JOIN pgpagespluginsxref x ON x.pluginid = p.pluginid
     INNER JOIN pgpages g ON g.pgid = x.pgid


     WHERE g.pgid = #findpage.pgid# AND l.linkloc_tb = 't'

     ORDER BY l.link_no
    </cfquery>
          <cfoutput>  
Findlinkst.recordcount: #findlinkst.recordcount#</cfoutput>
<cfquery datasource="#dsn#" name="FindLinksB"  >
        SELECT 

    l.linkid
    ,l.linkurl
    ,l.linkname
    ,l.linktype
    ,l.link_no
    ,l.linkloc_tb
    ,l.pluginname
    ,l.rel
    ,l.hrefid


     FROM pgapplinks l

     INNER JOIN pgplugins p ON p.pluginName = l.pluginname 
     INNER JOIN pgpagespluginsxref x ON x.pluginid = p.pluginid
     INNER JOIN pgpages g ON g.pgid = x.pgid


     WHERE g.pgid = #findpage.pgid# AND l.linkloc_tb = 'b' and l.linkname NOT like '%calendar - custom%'

     ORDER BY l.link_no
</cfquery>
        <cfoutput>  
Findlinksb.recordcount: #findlinksb.recordcount#</cfoutput>
    <cfquery datasource="#dsn#" name="FindLinksExtra"  >
    SELECT distinct 
    l.pluginname

     FROM pgapplinks l

     INNER JOIN pgplugins p ON p.pluginName = l.pluginname 
     INNER JOIN pgpagespluginsxref x ON x.pluginid = p.pluginid
     INNER JOIN pgpages g ON g.pgid = x.pgid

     WHERE g.pgid = #findpage.pgid# AND l.linkloc_tb = 'b'
and l.pluginname <> 'global'
     ORDER BY l.link_no
</cfquery>
    
   
    <!--- Application variables --->
    
    <cfset appName = FindPage.appName />
    <cfset appDescription = FindPage.appDescription />  
    <cfset appAuthor = FindPage.appAuthor />  
    <cfset appLogoName = FindPage.appLogoName />
    <cfset colorTopBar = FindPage.colorTopBar />
    <cfset colorLeftSideBar = FindPage.colorLeftSideBar />
    <cfset home = "/app/dashboard" />
    <cfset mocktoday = FindPage.mocktoday />
    <cfset mock_yn = FindPage.mock_yn />
    <!--- Component variables --->
    
    <cfset compid = FindPage.compid />
    <cfset compname = FindPage.compname /> 
    <cfset compDir = FindPage.compDir />
    <cfset compTable = FindPage.compTable />
    <cfset compowner = FindPage.compowner />
    
    <!--- Page variables --->    
    
    <cfset pgid = FindPage.pgid />
     <cfset cookie.pgid = pgid />   
    <cfset pgname = FindPage.pgname />    
    <cfset pgDir = FindPage.pgDir />
    <cfset pgTitle = FindPage.pgTitle />
    <cfset pgHeading = FindPage.pgHeading />
    <cfset pgFilename = FindPage.pgFilename />
    <cfset update_type = FindPage.update_type />
    <!--- User variables --->  

    <cfset userid = session.userid />
    <cfset userContactid = FindUser.userContactID />
    <cfset userCalStarttime = FindUser.calstarttime />
    <cfset userCalendtime = FindUser.calendtime />    
    <cfset useravatarname = FindUser.avatarname />  
    <cfset userIsBetaTester = FindUser.IsBetaTester />  
    <cfset userdefRows = FindUser.defRows />  
    <cfset userdefCountry = FindUser.defCountry />  
    <cfset userdefState = FindUser.defState />  
    <cfset usertzid = FindUser.tzid />
    <cfset usercustomerid = FindUser.customerid /> 
        
    <cfif "#usercontactid#" is "#contactid#" >
        <Cfset catArea_UCB = "U" />
    </cfif>
 

    
    <cfset userFirstName = FindUser.userFirstName />
    <cfset userLastName = FindUser.userLastName />
    <cfset userEmail = FindUser.userEmail />
    <cfset userRole = FindUser.userRole />
    
    <cfoutput>
    <cfset pageTitle = "#appName# | #pgTitle#" />
  
    </cfoutput>

 <cfif #pgfilename# is not "">
               <cfoutput>  
pgfilename: #pgfilename#</cfoutput>
               
    
here

                           
</cfif>
        <cfelse>               

            
    <cfoutput>         No record!#trim(thispage)#</cfoutput> 
        
        </cfif>


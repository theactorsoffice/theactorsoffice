<CFINCLUDE template="/include/remote_load.cfm" />

<cfquery datasource="#dsn#" name="FindRefPage"  >
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
    FROM pgpages p
    INNER JOIN pgcomps c ON c.compID = p.compID
    INNER JOIN pgapps a ON a.appID = c.appid
    WHERE p.pgid = #ref_pgid#
</cfquery>

<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="FindRefcontacts"  >
    SELECT recordname
    from contactdetails
    WHERE contactid = #contactid#
</cfquery>

 

<style>
.btn-success:disabled {
	color: #fff;
	background-color: #D3D3D3;
	border-color: #D3D3D3
}
</style>

<cfoutput>
<cfif #ref_pgid# is "3">    
    
    <cfset cookie.uploadDir = "#dir_contact_avatar_filename#" /> 
    <cfset cookie.return_url = "/app/contact/?contactid=#contactid#" />
    <cfset subtitle = "#FindRefContacts.recordname#" />
    
    
        <cfset browser_contact_avatar_loc="/media-#host#/users/#finduser.userid#/contacts/#contactid#" />

    <cfset browser_contact_avatar_filename="#browser_contact_avatar_loc#/avatar.jpg" />
    <cfset image_url = "#browser_contact_avatar_filename#" />
    
<cfelseif #ref_pgid# is "7">
    <cfset subtitle = "#userFirstName# #userLastName#" />
        <cfset image_url = "#browser_user_avatar_filename#" />
    <cfset cookie.uploadDir = "#dir_user_avatar_filename#" /> 
        <cfset cookie.return_url = "/app/myaccount/" />
    
    <cfelseif #ref_pgid# is "9">
    <cfset subtitle = "#userFirstName# #userLastName#" />
        <cfset image_url = "#browser_user_avatar_filename#" />
    <cfset cookie.uploadDir = "#dir_user_avatar_filename#" /> 
        <cfset cookie.return_url = "/app/setup/" />
    
</cfif>
    


</cfoutput>

<html>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Material+Icons" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/jsuites/dist/jsuites.min.css" type="text/css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@jsuites/css/dist/style.min.css" type="text/css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@jsuites/cropper/cropper.min.css" type="text/css" />

<script src="https://cdn.jsdelivr.net/npm/jsuites/dist/jsuites.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@jsuites/cropper/cropper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/lemonadejs/dist/lemonade.min.js"></script>
<script src='https://cdn.jsdelivr.net/npm/@lemonadejs/cropper/dist/cropper.min.js'></script>

<div id='root'></div>

<script>
function App() {
    const self = this;
    self.save = function() {
        console.log(self.cropper.getValue());
    }
    return `<>
        <div style="background: white">
            <Cropper :ref="self.cropper" />
        </div>
        <input type="button" value="console.log()" onclick="self.save()" />
    </>`
}
// Register component
lemonade.setComponents({ Cropper });
// Render app
lemonade.render(App, document.getElementById('root'));
</script>
</html>

<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" /><cfinclude template="/include/bigbrotherinclude.cfm" /> 

<script src="https://jsuites.net/v4/jsuites.js"></script>
<link rel="stylesheet" href="https://jsuites.net/v4/jsuites.css" type="text/css" />
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

<div id="imageCropper"></div>


<script>
    document.addEventListener("DOMContentLoaded", function() {
        var cropper = new jSuites.imageCropper(document.getElementById('imageCropper'), {
            src: '<cfoutput>#image_url#</cfoutput>',
            // Additional options can be specified here
        });
    });
</script>

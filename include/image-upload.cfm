
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
 

 <p class="small">Click on the big square to upload an image</p>

<div style="display: flex;">
    <div id="image-cropper" style="border:1px solid #ccc; margin: 5px;"></div>
    <div id="image-cropper-result"><img style="width:120px; height:120px; margin: 5px;"></div>
</div>

<p><input type="button" value="Get cropped image" id="image-getter" class="jbutton dark"></p>

<script>
cropper(document.getElementById('image-cropper'), {
    url: '<cfoutput>#image_url#</cfoutput>'
})

document.getElementById('image-getter').onclick = function() {
    document.getElementById('image-cropper-result').children[0].src =
        document.getElementById('image-cropper').crop.getCroppedImage().src;
}
</script>
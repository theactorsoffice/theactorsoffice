<!--- Include remote load template --->
<CFINCLUDE template="/include/remote_load.cfm" />

<!--- Secure query with cfqueryparam --->
<cfquery datasource="#dsn#" name="FindRefcontacts">
    SELECT recordname
    FROM contactdetails
    WHERE contactid = <cfqueryparam value="#contactid#" cfsqltype="CF_SQL_INTEGER">
</cfquery>

<!--- Output block for setting variables --->
<cfoutput>
    <cfset cookie.uploadDir_Contact = "#dir_contact_avatar_filename#" /> 
    <cfset cookie.return_url = "/app/contact/?contactid=#contactid#" />
    <cfset subtitle = "#FindRefContacts.recordname#" />
    <cfset browser_contact_avatar_loc="/media-#host#/users/#finduser.userid#/contacts/#contactid#" />
    <cfset browser_contact_avatar_filename="#browser_contact_avatar_loc#/avatar.jpg" />
    <cfset image_url = "#browser_contact_avatar_filename#" />
    <cfset picsize = 200 />
    <cfset inputsize = 200 />
</cfoutput>

<!--- Adjust input size based on ref_pgid --->
<cfif ref_pgid neq 9>
    <cfset inputsize = 300 />
</cfif>

<!--- HTML content --->


<div class="container mt-4">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <h4 id="pageTitle">Upload Avatar</h4>
            <div id="instructions" class="alert alert-info">Select an image from your computer, resize and crop it, then click Update.</div>
            
            <div id="selectfile" class="mb-3">
                <input type="file" id="upload" class="form-control">
            </div>

            <div id="upload-input" class="croppie-container mb-3"></div>

            <button id="uploadbutton" class="btn btn-primary">Update</button>
        </div>
    </div>
</div>


























<!--- JavaScript for handling UI interactions --->
<script>
$(document).ready(function() {
    $('#cont').hide(); 
    $('#uploadbutton').hide();
    $('input:file').change(function() {
        if ($(this).val()) {
            $('#uploadbutton').attr('disabled', false);  
            $('#uploadbutton').show();
        } 
    });
});

// Initialize Croppie
$uploadCrop = $('#upload-input').croppie({
    enableExif: true,
    url: '<cfoutput>#image_url#</cfoutput>?ver=<cfoutput>#rand()#</cfoutput>',
    viewport: {
        width: <cfoutput>#picsize#</cfoutput>,
        height: <cfoutput>#picsize#</cfoutput>,
        type: 'circle'
    },
    boundary: {
        width: <cfoutput>#picsize#</cfoutput>,
        height: <cfoutput>#picsize#</cfoutput>
    }
});

// Handle file change
$('#upload').on('change', function() { 
    var reader = new FileReader();
    reader.onload = function(e) {
        $uploadCrop.croppie('bind', {
            url: e.target.result
        }).then(function() {
            console.log('jQuery bind complete');
        });
    }
    reader.readAsDataURL(this.files[0]);
});

// Function to convert result to base64
function resultToField() {
    uploadCrop.croppie('result', 'base64').then(function(baseImage) {
        $('#picturebase').val(baseImage);
    });
};

// Handle the upload result
$('.upload-result').on('click', function(ev) {
    $uploadCrop.croppie('result', {
        type: 'canvas',
        size: 'viewport'
    }).then(function(resp) {
        $.ajax({
            url: "/include/image_upload-contact2.cfm",
            type: "POST",
            data: {"picturebase": resp},
            success: function(data) {
                var html = '<img style="margin: 20px;" src="' + resp + '" /><br><a href="<cfoutput>#cookie.return_url#</cfoutput>"><button type="button" class="btn btn-primary waves-effect mb-2 waves-light">Continue</button></a>';
                $("#upload-input").html(html);
                $('#uploadbutton').hide();
                $('#selectfile').hide();
                $('#cont').show();
            }
        });
    });
});
</script>

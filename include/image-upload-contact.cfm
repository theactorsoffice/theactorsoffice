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

    // Function to initialize or reinitialize Croppie
    function initCroppie() {
        // If Croppie is already initialized, destroy it
        if ($uploadCrop && $uploadCrop.croppie('get')) {
            $uploadCrop.croppie('destroy');
        }

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
    }

    // Initial call to initialize Croppie
    initCroppie();

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

    // Rest of your script...
});
</script>
